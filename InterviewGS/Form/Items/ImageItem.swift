//
//  ImageItem.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class ImageItem: FormSectionItem {
    
    override init() {
        super.init()
        self.indexPath = nil
        self.label = "image"
        self.value = "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_372221-MLA20737862411_052016-F.jpg"
        self.height =  200.0
    }
    
    override func didChange(value: String) {
        
    }
    
}
