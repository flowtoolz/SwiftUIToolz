import AppKit

public extension NSEvent
{
    var key: Key { Key(rawValue: keyCode) ?? .unknown }
    
    enum Key: UInt16
    {
        case unknown
        case enter = 36
        case tab = 48
        case space = 49
        case delete = 51
        case left = 123
        case right = 124
        case down = 125
        case up = 126
        case esc = 53
    }
    
    var cmd: Bool { modifierFlags.contains(.command) }
    var alt: Bool { modifierFlags.contains(.option) }
    var ctrl: Bool { modifierFlags.contains(.control) }
    var shift: Bool { modifierFlags.contains(.shift) }
}
