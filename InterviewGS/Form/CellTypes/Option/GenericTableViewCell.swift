//
//  GenericTableViewCell.swift
//  InterviewGS
//
//  Created by David on 10/8/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class GenericTableViewCell: UITableViewCell, FormCellDelegate {
    
    @IBOutlet weak var valueLabel: UILabel!
    var item: FormSectionItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func prepareUI(_ withItem: FormSectionItem) {
        self.item = withItem
        self.valueLabel.text = self.item?.label
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.item?.isSelected = selected
    }
    
}
