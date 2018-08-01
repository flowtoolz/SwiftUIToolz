import AppKit
import SwiftyToolz

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
                    case .light: return .light
                    case .regular: return .regular
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
