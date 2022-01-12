import UIKit

public extension UITableView {
    func register(_ cellType: AnyClass?) {
        guard let cellType = cellType as? UITableViewCell.Type else { return }
        register(cellType, forCellReuseIdentifier: cellType.id)
    }
    
    func dequeue<Cell>(for indexPath: IndexPath) -> Cell where Cell: UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: Cell.id, for: indexPath)
        return cell as? Cell ?? Cell(frame: .zero)
    }
}

public extension UITableViewCell {
    static var id: String { "Reuse ID for \(self)" }
}

public extension UICollectionView {
    func register(_ cellType: AnyClass) {
        guard let cellType = cellType as? UICollectionViewCell.Type else { return }
        register(cellType, forCellWithReuseIdentifier: cellType.id)
    }
    
    func dequeue<Cell>(for indexPath: IndexPath) -> Cell where Cell: UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: Cell.id, for: indexPath)
        return cell as? Cell ?? Cell(frame: .zero)
    }
}

public extension UICollectionViewCell {
    static var id: String { "Reuse ID for \(self)" }
}
