import AppKit.NSTextField

public class Label: NSTextField
{
    override init(frame frameRect: NSRect)
    {
        super.init(frame: frameRect)
        
        let priority = NSLayoutConstraint.Priority(rawValue: 0.1)
        setContentCompressionResistancePriority(priority, for: .horizontal)
        
        if #available(OSX 10.11, *)
        {
            allowsDefaultTighteningForTruncation = true
        }
        
        lineBreakMode = .byTruncatingTail
        drawsBackground = false
        isBezeled = false
        isEditable = false
        isBordered = false
        font = .system
    }
    
    public required init?(coder: NSCoder) { fatalError() }
}
