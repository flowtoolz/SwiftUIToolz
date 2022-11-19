import AppKit
import GetLaid
import SwiftyToolz

@available(macOS 11, *)
public class ProgressBar: LayerBackedView
{
    // MARK: - Initialization
    
    override init(frame frameRect: NSRect)
    {
        super.init(frame: frameRect)
        set(backgroundColor: .rgb(1.0, 0.0, 0.0))
        constrainProgressIndicator()
    }
    
    public required init?(coder decoder: NSCoder) { nil }
    
    // MARK: - Progress Indicator
    
    public func set(progressColor: Color)
    {
        progressIndicator.set(backgroundColor: progressColor)
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
            
            let cappedCGFloat = Swift.max(0.0, min(1.0, newValue))

            constrainIndicatorWidth(with: cappedCGFloat)
            
            layoutSubtreeIfNeeded()
            
            NSAnimationContext.endGrouping()
        }
        
        get { widthConstraint?.multiplier ?? 0 }
    }
    
    private func constrainProgressIndicator(with widthFactor: CGFloat = 0)
    {
        progressIndicator >> allButRight
        constrainIndicatorWidth(with: widthFactor)
    }
    
    private func constrainIndicatorWidth(with widthFactor: CGFloat)
    {
        widthConstraint = (progressIndicator >> width.at(widthFactor)).first
    }
    
    private var widthConstraint: NSLayoutConstraint?
    
    private lazy var progressIndicator: LayerBackedView =
    {
        let view = addForAutoLayout(LayerBackedView())
        
        view.set(backgroundColor: .rgb(0.0, 1.0, 0.0))
        
//        view.shadow = NSShadow()
//        view.layer?.shadowColor = NSColor.black.cgColor
//        view.layer?.shadowOffset = CGSize(width: 15, height: 0)
//        view.layer?.shadowRadius = 15
//        view.layer?.shadowOpacity = 0.5
        
        return view
    }()
}
