public class ViewControlller<V: NSView>: NSViewController
{
    public override func loadView()
    {
        view = V()
    }
}
