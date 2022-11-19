import AppKit
import SwiftyToolz

open class LayerBackedView: NSView
{
    public override init(frame frameRect: NSRect)
    {
        super.init(frame: frameRect)
        
        wantsLayer = true
        
        layerContentsRedrawPolicy = .onSetNeedsDisplay
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder decoder: NSCoder) { nil }
}
