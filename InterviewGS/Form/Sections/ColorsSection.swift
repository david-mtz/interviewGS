//
//  ColorsSection.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class ColorSection: FormSectionProtocol {
    var title: String = "Colores"
    
    var cellView: FormCellType = FormCellType.options
    
    var optionsList: SectionWithOptions? = nil
    
    var sectionItems: [FormSectionItem] = []
    
    var indexSection: Int = 0
    
    private let minOptions: Int = 1
    
    var selectionConfig: SelectionConfig?

    init(config: SectionWithOptions) {
        self.selectionConfig = SelectionConfig(multiple: true)
        self.optionsList = config
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
        
        if count < self.minOptions {
            return ValidateSection(isValidate: false, error: GenderErrors.empty.rawValue)
        }
        
        return ValidateSection(isValidate: true, error: nil)
    }


    func getValue() -> Any? {
        var optionsResult: [String:Any] = [String:Any]()
        for option in sectionItems {
            if let key = option.label {
                optionsResult[key] = option.value
            }
        }
        return optionsResult as? Any
    }

    
}

enum ColorsErrors: String {
    case empty = "Debes seleccionar al menos una opción"
}
