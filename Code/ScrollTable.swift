import AppKit

open class ScrollTable<T: NSTableView>: NSScrollView
{
    public override init(frame frameRect: NSRect)
    {
        super.init(frame: frameRect)
        documentView = table
        hasHorizontalScroller = false
        horizontalScroller = nil
        horizontalScrollElasticity = .none
    }
    
    public required init?(coder: NSCoder) { nil }
    
    public let table = T()
}
