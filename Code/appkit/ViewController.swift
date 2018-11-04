public class ViewControlller<V: NSView>: NSViewController
{
    public override func loadView()
    {
        view = contentView
    }
    
    public let contentView = V()
}
