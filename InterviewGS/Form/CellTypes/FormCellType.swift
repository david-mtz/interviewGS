//
//  FormSectionType.swift
//  InterviewGS
//
//  Created by David on 10/8/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
import UIKit

protocol FormCellDelegate {
    var item: FormSectionItem? {get set}
    func prepareUI(_ withItem: FormSectionItem)
}

enum FormCellType: String {
    case camera = "PhotoTableViewCell"
    case image = "ImageTableViewCell"
    case text = "TextTableViewCell"
    case date = "PickerDateTableViewCell"
    case options = "GenericTableViewCell"
    
    static func registerCells(for tableView: UITableView) {
        tableView.register(UINib(nibName: camera.rawValue, bundle: nil), forCellReuseIdentifier: camera.rawValue)
        tableView.register(UINib(nibName: image.rawValue, bundle: nil), forCellReuseIdentifier: image.rawValue)
        tableView.register(UINib(nibName: text.rawValue, bundle: nil), forCellReuseIdentifier: text.rawValue)
        tableView.register(UINib(nibName: date.rawValue, bundle: nil), forCellReuseIdentifier: date.rawValue)
        tableView.register(UINib(nibName: options.rawValue, bundle: nil), forCellReuseIdentifier: options.rawValue)
    }
    
    func dequeueCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell()
        switch self {
            case .camera:
                cell = tableView.dequeueReusableCell(withIdentifier: self.rawValue, for: indexPath) as! PhotoTableViewCell
                break
            case .image:
                cell = tableView.dequeueReusableCell(withIdentifier: self.rawValue, for: indexPath) as! ImageTableViewCell
                break
            case .text:
                cell = tableView.dequeueReusableCell(withIdentifier: self.rawValue, for: indexPath) as! TextTableViewCell
                break
            case .date:
                cell = tableView.dequeueReusableCell(withIdentifier: self.rawValue, for: indexPath) as! PickerDateTableViewCell
                break
            case .options:
                cell = tableView.dequeueReusableCell(withIdentifier: self.rawValue, for: indexPath) as! GenericTableViewCell
                break
            @unknown default:
                cell = UITableViewCell()
        }
        
        
        
        return cell
    }
  
}
