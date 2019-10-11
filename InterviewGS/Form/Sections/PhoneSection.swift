//
//  PhoneSection.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class PhoneSection: FormSectionProtocol {
    
    var title: String = "Número télefónico"
    
    var cellView: FormCellType = FormCellType.text
    
    var optionsList: SectionWithOptions? = nil
    
    var sectionItems: [FormSectionItem] = []
    
    var indexSection: Int = 0

    private var maxLenght = 10
    
    var selectionConfig: SelectionConfig?

    init() {
        let textField = TextItem()
        textField.label = "phoneNumber"
        textField.textfieldProperties = TextFieldProperties(placeholder: "Ingresa tu número télefónico", keyboardType: .phonePad)
        self.sectionItems.append(textField)
    }

    func validate() -> ValidateSection {
        
        guard let item = sectionItems.first else { return ValidateSection(isValidate: false, error: "Error inesperado en la sección" + self.title)}
        
        if item.value == nil || item.value == "" {
            return ValidateSection(isValidate: false, error: PhoneErrors.empty.rawValue)
        } else if item.value?.count ?? 0 != 8 || item.value?.count ?? 0 != 10 {
            return ValidateSection(isValidate: false, error: PhoneErrors.lenght.rawValue)
        }
        
        return ValidateSection(isValidate: true, error: nil)
    }

    func getValue() -> Any? {
        guard let item = sectionItems.first else {return nil}
        return item.value as? Any
    }
    
    
}

enum PhoneErrors: String {
    case empty = "Ingresa tu telefono en la sección correspondiente"
    case lenght = "Tu número télefónico no es válido"
}
