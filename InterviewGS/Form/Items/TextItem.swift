//
//  TextItem.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class TextItem: FormSectionItem {
    
    var textfieldProperties: TextFieldProperties?
    
    override init() {
        super.init()
        self.indexPath = nil
        self.label = "field"
        self.value = ""
        self.height = 54.0
    }
    
    override func didChange(value: String) {
        
    }
    
}
