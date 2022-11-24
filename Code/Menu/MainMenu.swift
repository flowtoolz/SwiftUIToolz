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
            let appDisplayName = AppInformation.name ?? "Application"
            
            super.init(title: appDisplayName + " Menu")
            
            addItem(withTitle: "Hide " + appDisplayName,
                    action: #selector(NSApplication.hide(_:)),
                    keyEquivalent: "h")
            addItem(withTitle: "Quit " + appDisplayName,
                    action: #selector(NSApplication.terminate(_:)),
                    keyEquivalent: "q")
        }
        
        required init(coder decoder: NSCoder) { fatalError() }
    }
}
