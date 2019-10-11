//
//  CheckboxTableViewCell.swift
//  InterviewGS
//
//  Created by David on 10/7/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
import UIKit

class CheckboxTableViewCell: UITableViewCell {
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
    }
}
