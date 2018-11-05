import AppKit
import FoundationToolz

open class MainMenu: Menu
{
    public init()
    {
        super.init(title: "Menu Bar")
        
        addItem(NSMenuItem(submenu: appMenu))
    }
    
    required public init(coder decoder: NSCoder) { fatalError() }
    
    public let appMenu = AppMenu()
    
    public class AppMenu: NSMenu
    {
        init()
        {
            super.init(title: "Application Menu")
            
            var namePostfix = ""
            
            if let name = appName { namePostfix = " " + name }
            
            addItem(withTitle: "Hide" + namePostfix,
                    action: #selector(NSApplication.hide(_:)),
                    keyEquivalent: "h")
            addItem(withTitle: "Quit" + namePostfix,
                    action: #selector(NSApplication.terminate(_:)),
                    keyEquivalent: "q")
        }
        
        required init(coder decoder: NSCoder) { fatalError() }
    }
}
