import AppKit.NSImageView

public class Icon: NSImageView
{
    public init(with image: NSImage,
                scaling: NSImageScaling = .scaleProportionallyUpOrDown)
    {
        super.init(frame: .zero)
        
        self.image = image
        imageScaling = scaling
        imageAlignment = .alignCenter
        
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
    }
    
    public required init?(coder: NSCoder) { fatalError() }
}