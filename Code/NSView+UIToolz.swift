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
