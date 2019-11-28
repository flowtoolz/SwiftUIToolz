import AppKit
import SwiftObserver

open class Window: NSWindow, Observable
{
    // MARK: - Initialization
    
    init()
    {
        super.init(contentRect: NSScreen.initialWindowRect,
                   styleMask: [.resizable, .titled, .miniaturizable, .closable],
                   backing: .buffered,
                   defer: false)
        titlebarAppearsTransparent = true
        titleVisibility = .hidden
        backgroundColor = .windowBackgroundColor
        isReleasedWhenClosed = false
        
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

public extension NSScreen {
    
    static var initialWindowRect: CGRect
    {
        .init(x: size.width * 0.1,
              y: size.height  * 0.1,
              width: size.width * 0.8,
              height: size.height * 0.8)
    }
    
    static var size: CGSize {
        main?.frame.size ?? CGSize(width: 1920, height: 1080)
    }
}
