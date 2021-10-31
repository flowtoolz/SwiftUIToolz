import AppKit
import SwiftObserver

open class Window: NSWindow, SwiftObserver.ObservableObject
{
    // MARK: - Initialization
    
    init()
    {
        super.init(contentRect: .initialWindowRect,
                   styleMask: [.resizable, .titled, .miniaturizable, .closable, .fullSizeContentView],
                   backing: .buffered,
                   defer: false)
        titlebarAppearsTransparent = true
        isReleasedWhenClosed = false
        center()
        
        // required for macOS 10.10
        collectionBehavior = [.managed, .fullScreenPrimary]
    }
    
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
        styleMask.contains(.fullScreen)
    }
    
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
    
    public let messenger = Messenger<Event?>()
    
    public enum Event
    {
        case didChangeVisibility(visible: Bool)
    }
    
    // MARK: - Avoid Beep from Unprocessed Keys
    
    open override func doesNotRecognizeSelector(_ aSelector: Selector!) {}
    open override func noResponder(for eventSelector: Selector) {}
}

fileprivate extension CGRect
{
    static var initialWindowRect: CGRect
    {
        .init(x: 0,
              y: 0,
              width: NSScreen.size.width * 0.7,
              height: NSScreen.size.height * 0.7)
    }
}

public extension NSScreen
{
    static var size: CGSize
    {
        main?.frame.size ?? CGSize(width: 1920, height: 1080)
    }
}
