import AppKit.NSEvent
import SwiftObserver
import SwiftyToolz

public let keyboard = Keyboard()

public class Keyboard: Observable
{
    fileprivate init()
    {
        let monitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown)
        {
            [unowned self] event in
            
            self.send(event)
            
            return event
        }
        
        if monitor == nil { log(error: "Couldn't get event monitor.") }
    }
    
    public let messenger = Messenger<NSEvent>()
}
