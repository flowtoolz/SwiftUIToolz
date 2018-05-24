import AppKit
import SwiftyToolz

public extension Color
{
    init(_ nsColor: NSColor)
    {
        self.init(Float(nsColor.redComponent),
                  Float(nsColor.greenComponent),
                  Float(nsColor.blueComponent),
                  Float(nsColor.alphaComponent))
    }
    
    var cgColor: CGColor { return nsColor.cgColor }
    
    var nsColor: NSColor
    {
        return NSColor(calibratedRed: CGFloat(self.red),
                       green: CGFloat(self.green),
                       blue: CGFloat(self.blue),
                       alpha: CGFloat(self.alpha))
    }
}
