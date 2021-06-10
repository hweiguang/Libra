//
//  UITableView+Extension.swift
//
//
//  Created by Wei Guang
//
#if os(iOS)
import UIKit

public extension UITableView {
    func hideEmptyCells() {
        self.tableFooterView = UIView(frame: .zero)
    }
    
    func register<T: UITableViewCell>(_: T.Type) {
        let nib = UINib(nibName: String(describing: T.self), bundle: nil)
        self.register(nib, forCellReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Unable to dequeue cell with identifier \(String(describing: T.self)))")
        }
        return cell
    }
}
#endif
