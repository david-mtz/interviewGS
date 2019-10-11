//
//  DateItem.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class DateItem: FormSectionItem {
    
    var textfieldProperties: TextFieldProperties?
    
    override init() {
        super.init()
        self.indexPath = nil
        self.label = "date"
        self.value = ""
        self.height =  60.0
    }
    
    override func didChange(value: String) {
        
    }
    
}
