//
//  PickerDateTableViewCell.swift
//  InterviewGS
//
//  Created by David on 10/8/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit
import Foundation

class PickerDateTableViewCell: UITableViewCell, FormCellDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    var item: FormSectionItem?

    override func awakeFromNib() {
        super.awakeFromNib()
        datePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
        setUp()
    }
    
    private func setUp() {
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        components.day = -1
        let maxDate = calendar.date(byAdding: components, to: currentDate)!

        self.datePicker.maximumDate = maxDate
    }
    
    internal func prepareUI(_ withItem: FormSectionItem) {
        self.item = withItem
    }
    
    @objc func datePickerChanged(_ picker: UIDatePicker) {
        self.item?.value = self.datePicker.date.toFormat()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

