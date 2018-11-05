import AppKit

open class Menu: NSMenu, NSMenuItemValidation
{
    open override func validateMenuItem(_ menuItem: NSMenuItem) -> Bool
    {
        if let id = menuItem.id
        {
            return validateItem(with: id)
        }
        
        return true
    }
    
    open func validateItem(with id: String) -> Bool { return true }
}
