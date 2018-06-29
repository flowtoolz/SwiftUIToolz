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
        return NSColor(calibratedRed: CGFloat(red),
                       green: CGFloat(green),
                       blue: CGFloat(blue),
                       alpha: CGFloat(alpha))
    }
}
