import AppKit
import SwiftObserver

public extension NSMenuItemValidation where Self: NSMenu
{
    public func makeItem(_ title: String,
                         key: String,
                         id: String,
                         modifiers: NSEvent.ModifierFlags = [.command],
                         action: @escaping () -> Void) -> MenuItem
    {
        return MenuItem(title,
                        key: key,
                        id: id,
                        modifiers: modifiers,
                        validator: self,
                        action: action)
    }
}

public class MenuItem: NSMenuItem, NSMenuItemValidation
{
    // MARK: - Initialization
    
    public convenience init(_ title: String,
                            key: NSEvent.SpecialKey,
                            id: String? = nil,
                            modifiers: NSEvent.ModifierFlags = [.command],
                            validator: NSMenuItemValidation? = nil,
                            action: @escaping () -> Void)
    {
        self.init(title,
                  key: String(key.unicodeScalar),
                  id: id,
                  modifiers: modifiers,
                  validator: validator,
                  action: action)
    }
    
    public init(_ title: String,
                key: String = "",
                id: String? = nil,
                modifiers: NSEvent.ModifierFlags = [.command],
                validator: NSMenuItemValidation? = nil,
                action: @escaping () -> Void)
    {
        actionClosure = action
        
        super.init(title: title,
                   action: #selector(performAction),
                   keyEquivalent: key)
        
        target = self
        self.validator = validator
        
        if let id = id
        {
            identifier = UIItemID(id)
        }
        
        keyEquivalentModifierMask = modifiers
    }
    
    required public init(coder decoder: NSCoder) { fatalError() }
    
    // MARK: - Action Closure
    
    @objc public func performAction() { actionClosure() }
    
    private let actionClosure: () -> Void
    
    // MARK: - Validation
    
    public override func validateMenuItem(_ menuItem: NSMenuItem) -> Bool
    {
        guard menuItem === self else
        {
            log(warning: "validateMenuItem(...) was called with a different NSMenuItem than self")
            return true
        }
        
        return validator?.validateMenuItem(self) ?? true
    }
    
    private weak var validator: NSMenuItemValidation?
}

public extension NSMenuItem
{
    public var id: String? { return identifier?.rawValue }
}
