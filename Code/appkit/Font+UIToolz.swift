import AppKit
import SwiftyToolz

public extension NSFont
{
    static var system: NSFont
    {
        .systemFont(ofSize: NSFont.systemFontSize)
    }
}

public extension Font
{
    var nsFont: NSFont
    {
        switch self
        {
        case .system(let size, let weight):
        
            if #available(OSX 10.11, *)
            {
                let nsFontWeight: NSFont.Weight =
                {
                    switch weight
                    {
                    case .ultraLight: return .ultraLight
                    case .thin: return .thin
                    case .light: return .light
                    case .regular: return .regular
                    case .medium: return .medium
                    case .semibold: return .semibold
                    case .bold: return .bold
                    case .system: return .regular
                    }
                }()
                
                return .systemFont(ofSize: CGFloat(size), weight: nsFontWeight)
            }
            else
            {
                return .systemFont(ofSize: CGFloat(size))
            }
        
        case .named(let name, let size):
            
            let size = CGFloat(size)
            
            return NSFont(name: name, size: size) ?? .systemFont(ofSize: size)
        }
    }
}
