//
//  UITableView.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

extension NSObject {

    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }

}

extension UITableView {

    func registerCell(_ cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.nameOfClass)
    }

}
