import AppKit
import GetLaid
import SwiftyToolz

public class Button: LayerBackedView
{
    // MARK: - Initialization
    
    public convenience init(with action: @escaping Action)
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
    
    public var action: Action?
    
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
        titleLabel.constrainLeft(to: self, offset: 10)
        titleLabel.constrainRight(to: self, offset: -10)
        titleLabel.constrainCenterY(to: self)
    }
    
    public lazy var titleLabel: Label =
    {
        let label = addForAutoLayout(Label())
        
        label.alignment = .center
        
        return label
    }()
}
