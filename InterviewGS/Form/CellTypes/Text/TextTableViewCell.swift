//
//  TextTableViewCell.swift
//  InterviewGS
//
//  Created by David on 10/8/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell, FormCellDelegate {
    
    @IBOutlet weak var textField: UITextField!
    var item: FormSectionItem?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    internal func prepareUI(_ withItem: FormSectionItem) {
        self.item = withItem
        self.textField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        guard let itemTextField = self.item as? TextItem, let properties = itemTextField.textfieldProperties else { return }
        self.textField.keyboardType = properties.keyboardType
        self.textField.placeholder = properties.placeholder
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        guard let item = self.item else { return }
        item.value = textField.text
    }

}

struct TextFieldProperties {
    let placeholder: String
    let keyboardType: UIKeyboardType
}
