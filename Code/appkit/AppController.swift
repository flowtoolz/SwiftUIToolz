import AppKit
import FoundationToolz
import SwiftObserver
import SwiftyToolz

open class AppController: NSObject, NSApplicationDelegate, NSWindowDelegate, LogObserver
{
    // MARK: - Initialization
    
    public override init() {
        super.init()
        Log.Entry.prefix = (appName ?? "App").uppercased()
        Log.shared.add(observer: self)
    }
    
    public func receive(_ entry: Log.Entry)
    {
        showAlert(with: entry)
    }
    
    deinit { Log.shared.remove(observer: self) }
    
    // MARK: - App Delegate
    
    open func applicationDidFinishLaunching(_ aNotification: Notification)
    {
        NSApp.activate(ignoringOtherApps: true)
        
        observeSystemAppearance()
        
        //networkReachability.setup()
    }
    
    open func applicationWillBecomeActive(_ notification: Notification)
    {
        // TODO: why does the window lose the delegate anyway??
        window.delegate = self
        window.show()
    }
    
    open func applicationShouldHandleReopen(_ sender: NSApplication,
                                            hasVisibleWindows flag: Bool) -> Bool
    {
        if !flag { window.show() }
        return false
    }
    
    // MARK: - Window
    
    public let window = Window()
    
    // MARK: - Dark Mode
    
    private func observeSystemAppearance()
    {
        guard #available(OSX 10.14, *) else { return }
        
        appearanceObservation = NSApp.observe(\.effectiveAppearance)
        {
            [weak self] _, _ in self?.appAppearanceDidChange()
        }
    }
    
    @available(OSX 10.14, *)
    private func appAppearanceDidChange()
    {
        systemDidChangeColorMode(dark: systemIsInDarkMode)
    }
    
    private var appearanceObservation: NSKeyValueObservation?
    
    open func systemDidChangeColorMode(dark: Bool) {}
    
    public var systemIsInDarkMode: Bool
    {
        guard #available(OSX 10.14, *) else { return false }
        
        return NSApp.effectiveAppearance.name == .darkAqua
    }
    
    // MARK: - Push Notifications
    
    public func registerForPushNotifications()
    {
        NSApp.registerForRemoteNotifications(matching: [.badge, .sound, .alert])
    }
}
