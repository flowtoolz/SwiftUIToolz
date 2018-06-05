import AppKit.NSView

public extension NSView
{
    func addForAutoLayout<View>(_ view: View) -> View where View: NSView
    {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        return view
    }
}
