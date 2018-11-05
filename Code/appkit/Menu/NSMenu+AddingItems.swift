import AppKit
import SwiftObserver

public extension NSMenu
{
    public func insert(_ items: [NSMenuItem], at index: Int)
    {
        guard index <= numberOfItems else
        {
            log(error: "Menu item index is out of bounds.")
            return
        }
        
        for i in 0 ..< items.count
        {
            insertItem(items[i], at: i + index)
        }
    }
}
