//
//  FormSectionItem.swift
//  InterviewGS
//
//  Created by David on 10/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation


protocol FormSectionProtocol: class {
    var title: String { get set }
    var cellView: FormCellType {get set}
    var sectionItems: [FormSectionItem] {get set}
    var indexSection: Int {get set}
    var selectionConfig: SelectionConfig? {get set}
    
    func validate() -> ValidateSection
    func getValue() -> Any?
}


struct SelectionConfig {
    var multiple: Bool = false
    var min: Int = 1
    var max: Int?
}


struct ValidateSection {
    var isValidate: Bool
    var error: String?
}

struct SectionWithOptions {
    let options: [String: String]
    let multipleSelection: Bool
    var min: Int = 1
    var max: Int?
}
