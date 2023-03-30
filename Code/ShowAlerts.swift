import AppKit
import SwiftyToolz

public func showAlert(with entry: Log.Entry?)
{
    guard let entry = entry, entry.forUser else { return }
    
    let title = entry.title ?? entry.level.displayName
    
    show(alert: entry.message,
         title: title,
         style: entry.level.alertStyle)
}

extension Log.Level
{
    var alertStyle: NSAlert.Style
    {
        switch self
        {
        case .info, .verbose: return NSAlert.Style.informational
        case .warning: return NSAlert.Style.warning
        case .error: return NSAlert.Style.critical
        }
    }
}

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
