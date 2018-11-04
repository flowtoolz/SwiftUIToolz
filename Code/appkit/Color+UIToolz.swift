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

public extension Color.System
{
    var nsColor: NSColor
    {
        switch self
        {
        case .text: return NSColor.textColor
        case .label: return NSColor.labelColor
        case .red: return NSColor.systemRed
        case .orange: return NSColor.systemOrange
        case .yellow: return NSColor.systemYellow
        case .green: return NSColor.systemGreen
        case .blue: return NSColor.systemBlue
        case .purple: return NSColor.systemPurple
        }
    }
}
