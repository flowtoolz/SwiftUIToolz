import AppKit
import SwiftyToolz

open class LayerBackedView: NSView
{
    public override init(frame frameRect: NSRect)
    {
        super.init(frame: frameRect)
        wantsLayer = true
    }
    
    required public init?(coder decoder: NSCoder) { fatalError() }
    
    public var backgroundColor: Color
    {
        set { layer?.backgroundColor = newValue.cgColor }
        get
        {
            let cgColor = layer?.backgroundColor ?? CGColor.clear
            let nsColor = NSColor(cgColor: cgColor) ?? NSColor.clear
            return Color(nsColor)
        }
    }
}
