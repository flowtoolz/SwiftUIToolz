import AppKit.NSImageView

public class Icon: NSImageView
{
    public init(with image: NSImage)
    {
        super.init(frame: .zero)
        
        self.image = image
        imageScaling = .scaleNone
        imageAlignment = .alignCenter
    }
    
    public required init?(coder: NSCoder) { fatalError() }
}
