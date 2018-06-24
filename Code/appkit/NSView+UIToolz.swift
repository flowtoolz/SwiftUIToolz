import AppKit

public extension NSView
{
    @discardableResult
    func makeFirstResponder() -> Bool
    {
        if acceptsFirstResponder
        {
            return NSApp.mainWindow?.makeFirstResponder(self) ?? false
        }
        else
        {
            return false
        }
    }
    
    func bringToFront(_ subview: NSView)
    {
        guard subviews.contains(subview) else { return }
        
        subview.removeFromSuperview()
        
        addSubview(subview, positioned: .above, relativeTo: nil)
    }
}

public extension NSImageView
{
    convenience init(withAspectFillImage image: NSImage?)
    {
        self.init(frame: NSRect.zero)
        
        self.image = image
        
        imageAlignment = .alignCenter
        imageScaling = .scaleProportionallyUpOrDown
        
        let priority = NSLayoutConstraint.Priority(rawValue: 0.1)
        setContentCompressionResistancePriority(priority, for: .horizontal)
        setContentCompressionResistancePriority(priority, for: .vertical)
    }
}
