import AppKit
import SwiftObserver
import SwiftyToolz

public extension NSMenu
{
    func insert(_ items: [NSMenuItem], at index: Int)
    {
        guard index <= numberOfItems else
        {
            log(error: "Menu item index is out of bounds.")
            return
        }
        
        items.forEachIndex { insertItem($0, at: $1 + index) }
    }
}
