import AppKit
import SwiftyToolz

public class FileSelectionPanel: NSOpenPanel
{
    override init(contentRect: NSRect,
                  styleMask style: NSWindow.StyleMask,
                  backing backingStoreType: NSWindow.BackingStoreType,
                  defer flag: Bool)
    {
        super.init(contentRect: contentRect,
                   styleMask: style,
                   backing: backingStoreType,
                   defer: flag)
        
        allowsMultipleSelection = false
    }
    
    public func selectFolder(handleFolder: @escaping (URL) -> Void)
    {
        message = "Select a Folder"
        canChooseFiles = false
        canChooseDirectories = true
        
        begin()
        {
            guard $0 == .OK, let folder = self.url else
            {
                log(error: "Selecting folder failed.")
                return
            }
            
            handleFolder(folder)
        }
    }
    
    public func selectFile(handleFile: @escaping (URL) -> Void)
    {
        message = "Select a File"
        canChooseFiles = true
        canChooseDirectories = false
        
        begin()
        {
            guard $0 == .OK, let file = self.url else
            {
                log(error: "Selecting file failed.")
                return
            }
            
            handleFile(file)
        }
    }
}
