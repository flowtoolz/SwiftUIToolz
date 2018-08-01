import AppKit
import PureLayout

public class Button: LayerBackedView
{
    // MARK: - Initialization
    
    public convenience init(with action: @escaping () -> Void)
    {
        self.init(frame: NSZeroRect)
        
        self.action = action
    }
    
    override init(frame frameRect: NSRect)
    {
        super.init(frame: frameRect)
        
        constrainTitleLabel()
    }
    
    public required init?(coder decoder: NSCoder) { fatalError() }
    
    // MARK: - Interaction
    
    public override func mouseDown(with theEvent: NSEvent)
    {
        super.mouseDown(with: theEvent)
        
        action?()
    }
    
    public var action: (() -> Void)?
    
    // MARK: - Title
    
    public var title: String
    {
        set
        {
            titleLabel.stringValue = newValue
        }
        
        get
        {
            return titleLabel.stringValue
        }
    }
    
    private func constrainTitleLabel()
    {
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        titleLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
    }
    
    public lazy var titleLabel: Label =
    {
        let label = addForAutoLayout(Label())
        
        label.alignment = .center
        
        return label
    }()
}
