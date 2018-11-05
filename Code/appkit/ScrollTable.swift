import AppKit

public class ScrollTable<T: NSTableView>: NSScrollView
{
    override init(frame frameRect: NSRect)
    {
        super.init(frame: frameRect)
        
        documentView = table
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    public let table = T()
}
