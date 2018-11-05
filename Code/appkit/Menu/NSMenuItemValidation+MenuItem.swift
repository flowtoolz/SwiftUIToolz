import AppKit

public extension NSMenuItemValidation where Self: NSMenu
{
    public func makeItem(_ title: String,
                         key: String,
                         id: String? = nil,
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
