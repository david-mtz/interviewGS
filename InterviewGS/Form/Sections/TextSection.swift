//
//  TextSection.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class NameSection: FormSectionProtocol {
    
    var title: String = "Nombre completo"
    
    var cellView: FormCellType = FormCellType.text
    
    var optionsList: SectionWithOptions? = nil
    
    var sectionItems: [FormSectionItem] = []
    
    var indexSection: Int = 0
    
    private var maxLenght = 35
    
    var selectionConfig: SelectionConfig?
    
    init() {
        let textField = TextItem()
        textField.label = "nombreCompleto"
        textField.textfieldProperties = TextFieldProperties(placeholder: "Ingresa tu nombre completo", keyboardType: .alphabet)
        self.sectionItems.append(textField)
    }

    func validate() -> ValidateSection {
        
        guard let item = sectionItems.first else { return ValidateSection(isValidate: false, error: "Error inesperado en la sección" + self.title)}
        
        if item.value == nil || item.value == "" {
            return ValidateSection(isValidate: false, error: TextErrors.empty.rawValue)
        } else if item.value?.count ?? 0 > self.maxLenght {
            return ValidateSection(isValidate: false, error: TextErrors.maxLenght.rawValue)
        }
        
        return ValidateSection(isValidate: true, error: nil)
    }

    func getValue() -> Any? {
        guard let item = sectionItems.first else {return nil}
        return item.value as? Any
    }
    
    
}

enum TextErrors: String {
    case empty = "Ingresa tu nombre en la sección correspondiente"
    case maxLenght = "El campo nombre no puede ser mayor a 35 carácteres"
}
