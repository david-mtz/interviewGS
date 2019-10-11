//
//  DateSection.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class DateSection: FormSectionProtocol {
    
    var title: String = "Fecha de nacimiento"
    
    var cellView: FormCellType = FormCellType.date
    
    var optionsList: SectionWithOptions? = nil
    
    var sectionItems: [FormSectionItem] = []
    
    var indexSection: Int = 0
    
    private var maxLenght = 10

    var selectionConfig: SelectionConfig?

    
    init() {
        self.sectionItems.append(TextItem())
    }

    func validate() -> ValidateSection {
        
        guard let item = sectionItems.first else { return ValidateSection(isValidate: false, error: "Error inesperado en la sección" + self.title)}
        
        if item.value == nil || item.value == "" {
            return ValidateSection(isValidate: false, error: DateErrors.empty.rawValue)
        }
        
        return ValidateSection(isValidate: true, error: nil)
    }

    func getValue() -> Any? {
        guard let item = sectionItems.first else {return nil}
        return item.value as? Any
    }
    
    
}

enum DateErrors: String {
    case empty = "Tu fecha de nacimiento no es válida"
}
