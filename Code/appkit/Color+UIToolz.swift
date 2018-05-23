import AppKit
import SwiftyToolz

public extension Color
{
    var nsColor: NSColor
    {
        return NSColor(calibratedRed: CGFloat(self.red),
                       green: CGFloat(self.green),
                       blue: CGFloat(self.blue),
                       alpha: CGFloat(self.alpha))
    }
}
