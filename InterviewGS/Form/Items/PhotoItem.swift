//
//  PhotoItem.swift
//  InterviewGS
//
//  Created by David on 10/9/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class PhotoItem: FormSectionItem {
    
    override init() {
        super.init()
        self.indexPath = nil
        self.label = "photo"
        self.value = ""
        self.height =  200.0

    }
    
    override func didChange(value: String) {
        
    }
    
}
