import AppKit
import SwiftObserver

open class Window: NSWindow, CustomObservable
{
    // MARK: - Initialization

    public init(color: NSColor = .windowBackgroundColor)
    {
        let windowStyle: StyleMask = [.resizable,
                                      .titled,
                                      //.fullSizeContentView,
                                      .miniaturizable,
                                      .closable]
        
        let initialFrame = Window.initialFrame
        
        Window.intendedMainWindowSize <- initialFrame.size

        super.init(contentRect: initialFrame,
                   styleMask: windowStyle,
                   backing: .buffered,
                   defer: false)
    
        titlebarAppearsTransparent = true
        titleVisibility = .hidden
        backgroundColor = color
        
        isReleasedWhenClosed = false
        
        // required for macOS 10.10
        collectionBehavior = [.managed, .fullScreenPrimary]
    }
    
    open override var contentViewController: NSViewController?
    {
        didSet
        {
            setFrame(Window.initialFrame, display: false)
        }
    }
    
    public static let initialFrame: CGRect =
    {
        let screenSize = NSScreen.main?.frame.size ?? CGSize(width: 1280,
                                                             height: 800)
        
        return CGRect(x: screenSize.width * 0.1,
                      y: screenSize.height  * 0.1,
                      width: screenSize.width * 0.8,
                      height: screenSize.height * 0.8)
    }()
    
    deinit { stopObservations() }
    
    // MARK: - Fullscreen
    
    open override func performKeyEquivalent(with event: NSEvent) -> Bool
    {
        let wasHandled = super.performKeyEquivalent(with: event)
        
        if !wasHandled,
            event.type == .keyDown,
            event.key == .esc
        {
            if isFullscreen { toggleFullScreen(nil) }
            return true
        }
        
        return wasHandled
    }
    
    public var isFullscreen: Bool
    {
        return styleMask.contains(.fullScreen)
    }
    
    // MARK: - Manual Sizing
    
    public func didEndLiveResize()
    {
        guard Window.intendedMainWindowSize.value != frame.size else
        {
            return
        }
        
        Window.intendedMainWindowSize <- frame.size
    }
    
    public static let intendedMainWindowSize = Var<CGSize?>()
    
    // MARK: - Show & Hide
    
    public func toggle() { show(!isVisible) }
    
    public func show(_ show: Bool = true)
    {
        guard show != isVisible else { return }
        
        if show
        {
            makeKeyAndOrderFront(self)
        }
        else
        {
            orderOut(self)
        }
        
        send(.didChangeVisibility(visible: show))
    }
    
    open override func close()
    {
        super.close()
        send(.didChangeVisibility(visible: false))
    }
    
    open override func miniaturize(_ sender: Any?)
    {
        super.miniaturize(sender)
        send(.didChangeVisibility(visible: false))
    }
    
    open override func deminiaturize(_ sender: Any?)
    {
        super.deminiaturize(sender)
        send(.didChangeVisibility(visible: true))
    }
    
    // MARK: - Observability
    
    public typealias Message = Event
    
    public let messenger = Messenger(Event.didNothing)
    
    public enum Event
    {
        case didNothing, didChangeVisibility(visible: Bool)
    }
    
    // MARK: - Avoid Beep from Unprocessed Keys
    
    open override func doesNotRecognizeSelector(_ aSelector: Selector!) {}
    open override func noResponder(for eventSelector: Selector) {}
}
