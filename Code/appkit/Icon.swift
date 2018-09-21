import AppKit

public class Icon: NSImageView
{
    public init(with image: NSImage? = nil,
                scaling: NSImageScaling = .scaleProportionallyUpOrDown)
    {
        super.init(frame: .zero)

        self.image = image
    
        imageScaling = scaling
        imageAlignment = .alignCenter
    
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        
        isEnabled = false
    }
    
    public required init?(coder: NSCoder) { fatalError() }
}
