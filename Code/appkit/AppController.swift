import AppKit
//import FoundationToolz

open class AppController: NSObject, NSApplicationDelegate
{
    public init(withMainMenu mainMenu: NSMenu)
    {
        super.init()
    
        _ = NSApplication.shared // initializes app
    
        NSApp.mainMenu = mainMenu // must be set before delegate
        NSApp.delegate = self
        NSApp.run()
    }
    
    open func applicationDidFinishLaunching(_ aNotification: Notification)
    {
        NSApp.activate(ignoringOtherApps: true)
        
        //networkReachability.setup()
    }
}
