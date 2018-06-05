import AppKit

public extension NSMenu
{
    func item(_ title: String,
              action: Selector,
              key: String,
              modifiers: NSEvent.ModifierFlags = [.command]) -> NSMenuItem
    {
        let item = NSMenuItem()
        item.target = self
        item.title = title
        item.action = action
        item.keyEquivalent = key
        item.keyEquivalentModifierMask = modifiers
        
        return item
    }
}
