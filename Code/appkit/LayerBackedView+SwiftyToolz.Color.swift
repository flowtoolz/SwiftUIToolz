import SwiftUIToolz
import AppKit
import SwiftyToolz

public extension LayerBackedView
{
    @available(macOS 11, *)
    func set(backgroundColor: SwiftyToolz.Color)
    {
        layer?.backgroundColor = NSColor(backgroundColor).cgColor
    }
}
