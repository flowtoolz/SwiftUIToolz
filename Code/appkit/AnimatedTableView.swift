import AppKit
import SwiftyToolz

open class AnimatedTableView: NSTableView
{
    open override func scrollRowToVisible(_ row: Int)
    {
        if !scrollAnimatedTo(row: row)
        {
            super.scrollRowToVisible(row)
        }
    }
    
    @discardableResult
    public func scrollAnimatedTo(row: Int,
                                 completionHandler: (() -> Void)? = nil) -> Bool
    {
        guard row >= 0, row < numberOfRows else
        {
            log(warning: "Tried to scroll to invalid row \(row).")
            return false
        }
        
        guard let scrollView = enclosingScrollView else
        {
            log(warning: "Expected enclosing scroll view but found none.")
            return false
        }
        
        let clipView = scrollView.contentView
        
        let optionalTargetPosition: CGFloat? =
        {
            let rowRect = rect(ofRow: row)
            let rowTop = rowRect.origin.y - 10
            let rowBottom = rowRect.origin.y + rowRect.size.height + 10
            let topPosition = max(0, rowTop)
            
            let clipRect = clipView.bounds
            let clipTop = clipRect.origin.y
            
            if rowTop < clipTop { return topPosition }
            
            let clipHeight = clipRect.size.height
            let clipBottom = clipTop + clipHeight
            
            if rowBottom > clipBottom
            {
                let bottomPosition = rowBottom - clipHeight
                
                return min(topPosition, bottomPosition)
            }
            
            return nil
        }()
        
        guard let targetPosition = optionalTargetPosition else
        {
            completionHandler?()
            return true
        }
        
        let targetOrigin = NSPoint(x: 0, y: targetPosition)
        
        NSAnimationContext.runAnimationGroup(
            {
                $0.duration = 0.3
                clipView.animator().setBoundsOrigin(targetOrigin)
                scrollView.reflectScrolledClipView(clipView)
            },
            completionHandler: completionHandler
        )
        
        return true
    }
}
