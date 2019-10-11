//
//  GenderSection.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class GenderSection: FormSectionProtocol {
    var selectionConfig: SelectionConfig?

    var title: String = "Sexo"
    
    var cellView: FormCellType = FormCellType.options
        
    var sectionItems: [FormSectionItem] = []
    
    var indexSection: Int = 0
        
    init(config: SectionWithOptions) {
        self.selectionConfig = SelectionConfig()
        for option in config.options {
            let sectionItem = FormSectionItem()
            sectionItem.label = option.value
            sectionItem.value = option.key
            sectionItems.append(sectionItem)
        }
    }

    func validate() -> ValidateSection {
        var count = 0
        
        for option in sectionItems {
            count += option.isSelected ? 1 : 0
        }
        
        if count == 0 {
            return ValidateSection(isValidate: false, error: GenderErrors.empty.rawValue)
        }
        
        return ValidateSection(isValidate: true, error: nil)
    }


    func getValue() -> Any? {
        for option in sectionItems {
            return [option.label : option.value] as? Any
        }
        return nil
    }
    
    
}

enum GenderErrors: String {
    case empty = "Debes seleccionar tu sexo"
}
