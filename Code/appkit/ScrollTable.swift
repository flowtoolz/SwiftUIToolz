import AppKit

open class ScrollTable<T: NSTableView>: NSScrollView
{
    public override init(frame frameRect: NSRect)
    {
        super.init(frame: frameRect)
        
        documentView = table
    }
    
    public required init?(coder: NSCoder) { fatalError() }
    
    public let table = T()
}
