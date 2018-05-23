import AppKit
import SwiftyToolz

public extension Font
{
    var nsFont: NSFont
    {
        switch self
        {
        case .system(let size):
            return NSFont.systemFont(ofSize: CGFloat(size))
        
        case .named(let name, let size):
            let cgSize = CGFloat(size)
            return NSFont(name: name, size: cgSize) ?? .systemFont(ofSize: cgSize)
        }
    }
}
