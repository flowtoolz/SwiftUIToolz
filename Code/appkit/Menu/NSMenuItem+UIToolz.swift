import AppKit

public extension NSMenuItem
{
    convenience init(submenu: NSMenu)
    {
        self.init()
        
        self.submenu = submenu
    }
    
    var id: String? { return identifier?.rawValue }
}
