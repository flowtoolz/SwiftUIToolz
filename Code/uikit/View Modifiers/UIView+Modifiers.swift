import UIKit

public extension UIView {
    @discardableResult
    func hugContent() -> Self {
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        return self
    }
    
    @discardableResult
    func resistCompression() -> Self {
        setContentCompressionResistancePriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        return self
    }
    
    @discardableResult
    func allowCompression() -> Self {
        setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return self
    }
    
    @discardableResult
    func hide() -> Self {
        isHidden = true
        return self
    }
    
    @discardableResult
    func show() -> Self {
        isHidden = false
        return self
    }
    
    @discardableResult
    func set(cornerRadius: CGFloat) -> Self {
        layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    func clipToBounds() -> Self {
        clipsToBounds = true
        return self
    }
    
    @discardableResult
    func set(contentMode: ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
    
    @discardableResult
    func set(backgroundColor: UIColor) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
}
