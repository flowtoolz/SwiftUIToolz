import UIKit

public extension UILabel {
    
    @discardableResult
    func set(text: String) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    func set(font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func set(textColor: UIColor) -> Self {
        self.textColor = textColor
        return self
    }
    
    @discardableResult
    func set(alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    
    @discardableResult
    func set(numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult
    func set(lineBreakMode: NSLineBreakMode) -> Self {
        self.lineBreakMode = lineBreakMode
        return self
    }
}
