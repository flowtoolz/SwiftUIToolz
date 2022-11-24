import AppKit.NSTextField

public class Label: NSTextField
{
    public convenience init(text: String)
    {
        self.init(frame: .zero)
        
        self.stringValue = text
    }
    
    override init(frame frameRect: NSRect)
    {
        super.init(frame: frameRect)
        
        let priority = NSLayoutConstraint.Priority(rawValue: 0.1)
        setContentCompressionResistancePriority(priority, for: .horizontal)
        
        allowsDefaultTighteningForTruncation = true
        
        lineBreakMode = .byTruncatingTail
        drawsBackground = false
        isBezeled = false
        isEditable = false
        isBordered = false
    }
    
    public required init?(coder: NSCoder) { nil }
}
