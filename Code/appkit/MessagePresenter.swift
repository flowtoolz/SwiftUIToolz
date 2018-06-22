import AppKit
import SwiftyToolz

// FIXME: Move this to UIObserver and migrate logging + presenting to SwiftObserver primitives
/*
public class MessagePresenter: MessageLogDelegate
{
    private init() {}
    
    public static let sharedInstance = MessagePresenter()
    
    public func messageLogReceived(message: String,
                                   of type: LogMessageType)
    {
        switch type
        {
            case .info:
                showAlert(message, .informational, type.rawValue)
            case .warning:
                showAlert(message, .warning, type.rawValue)
            case .error:
                showAlert(message, .critical, type.rawValue)
        }
    }
    
 
}
*/

public func show(alert message: String,
                 title: String,
                 style: NSAlert.Style = .informational)
{
    let alert = NSAlert()
    
    alert.alertStyle = style
    alert.messageText = title
    alert.informativeText = message
    alert.addButton(withTitle: "OK")
    
    alert.runModal()
}
