import AppKit

open class Icon: NSImageView
{
    public convenience init()
    {
        self.init(with: nil)
    }
    
    public init(with image: NSImage?)
    {
        super.init(frame: .zero)

        self.image = image

        imageAlignment = .alignCenter
        imageScaling = .scaleProportionallyUpOrDown
    }
    
    public required init?(coder: NSCoder) { nil }
}
