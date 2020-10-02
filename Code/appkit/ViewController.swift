import AppKit

public class ViewController<ContentView: NSView>: NSViewController {

    public override func loadView() { view = contentView }
    
    public let contentView = ContentView()
}
