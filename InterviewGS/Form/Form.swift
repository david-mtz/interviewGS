//
//  Form.swift
//  InterviewGS
//
//  Created by David on 10/8/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class Form {
    var formSection: [FormSectionProtocol] = [FormSectionProtocol]()
    var errors: [String] = [String]()
    
    
    init(sections: [FormSectionProtocol]) {
        self.formSection = sections
    }
    
    func isValid() -> Bool {
        errors = [String]()
        for section in self.formSection {
            let result = section.validate()
            if !result.isValidate {
                self.errors.append(result.error ?? "")
            }
        }
        return errors.count > 0 ? false : true
    }
    
}
