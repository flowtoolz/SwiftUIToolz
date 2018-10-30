import AppKit
import SwiftObserver
//import FoundationToolz

open class AppController: NSObject, NSApplicationDelegate, Observer
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
        
        observe(Log.shared.latestEntry)
        {
            showAlert(with: $0.new)
        }
        
        //networkReachability.setup()
    }
    
    public func registerForPushNotifications()
    {
        NSApp.registerForRemoteNotifications(matching: [.badge, .sound, .alert])
    }
}
