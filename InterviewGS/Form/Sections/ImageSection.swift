//
//  ImageSection.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class ImageSection: FormSectionProtocol {
    
    var title: String = "Foto"
    
    var cellView: FormCellType = FormCellType.image
    
    var optionsList: SectionWithOptions? = nil
    
    var sectionItems: [FormSectionItem] = []
    
    var indexSection: Int = 0
    
    var selectionConfig: SelectionConfig?
    
    init() {
        let item = ImageItem()
        sectionItems.append(item)
    }

    func validate() -> ValidateSection {
        
        guard let item = sectionItems.first else { return ValidateSection(isValidate: false, error: "Error inesperado en la sección" + self.title)}
        
        return ValidateSection(isValidate: true, error: nil)
    }

    func getValue() -> Any? {
        guard let item = sectionItems.first else { return nil }
        return item.value as? Any
    }
    
    
}
