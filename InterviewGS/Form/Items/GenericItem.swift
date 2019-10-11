//
//  GenericItem.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class GenericItem: FormSectionItem {
        
    override init() {
        super.init()
        self.indexPath = nil
        self.label = ""
        self.value = ""
        self.isSelected = false
    }
    
    override func didChange(value: String) {
        
    }
    
}
