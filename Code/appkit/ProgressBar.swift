import SwiftyToolz

public class ProgressBar: LayerBackedView
{
    // MARK: - Initialization
    
    override init(frame frameRect: NSRect)
    {
        super.init(frame: frameRect)
        
        backgroundColor = Color(1.0, 0.0, 0.0)
        
        constrainProgressIndicator()
    }
    
    public required init?(coder decoder: NSCoder) { fatalError() }
    
    // MARK: - Progress Indicator
    
    public var progressColor: Color
    {
        set
        {
            progressIndicator.backgroundColor = newValue
        }
        
        get
        {
            return progressIndicator.backgroundColor
        }
    }
    
    public var progress: CGFloat
    {
        set
        {
            NSAnimationContext.beginGrouping()
            
            let context = NSAnimationContext.current
            context.allowsImplicitAnimation = true
            context.duration = 0.3
            
            if let constraint = widthConstraint
            {
                removeConstraint(constraint)
                progressIndicator.removeConstraint(constraint)
            }
            
            let cappedCGFloat = max(0.0, min(1.0, newValue))

            constrainIndicator(widthFactor: cappedCGFloat)
            
            layoutSubtreeIfNeeded()
            
            NSAnimationContext.endGrouping()
        }
        
        get { return widthConstraint?.multiplier ?? 0 }
    }
    
    private func constrainProgressIndicator(with widthFactor: CGFloat = 0)
    {
        progressIndicator.constrainTop(to: self)
        progressIndicator.constrainLeft(to: self)
        progressIndicator.constrainBottom(to: self)

        constrainIndicator(widthFactor: widthFactor)
    }
    
    private func constrainIndicator(widthFactor: CGFloat)
    {
        widthConstraint = progressIndicator.constrainWidth(to: widthFactor, of: self)
    }
    
    private var widthConstraint: NSLayoutConstraint?
    
    private lazy var progressIndicator: LayerBackedView =
    {
        let view = addForAutoLayout(LayerBackedView())
        
        view.backgroundColor = Color(0.0, 1.0, 0.0)
        
        view.shadow = NSShadow()
        view.layer?.shadowColor = NSColor.black.cgColor
        view.layer?.shadowOffset = CGSize(width: 15, height: 0)
        view.layer?.shadowRadius = 15
        view.layer?.shadowOpacity = 0.5
        
        return view
    }()
}
