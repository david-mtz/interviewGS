//
//  PhotoSection.swift
//  InterviewGS
//
//  Created by David on 10/9/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class PhotoSection: FormSectionProtocol {
    
    var title: String = "Cámara"
    
    var cellView: FormCellType = FormCellType.camera
    
    var optionsList: SectionWithOptions? = nil
    
    var sectionItems: [FormSectionItem] = []
    
    var indexSection: Int = 0
    
    var selectionConfig: SelectionConfig?

    init() {
        sectionItems.append(PhotoItem())
    }

    func validate() -> ValidateSection {
        
        guard let item = sectionItems.first else { return ValidateSection(isValidate: false, error: "Error inesperado en la sección" + self.title)}
        
        return ValidateSection(isValidate: true, error: nil)
    }

    func getValue() -> Any? {
        return "Result" as? Any
    }
    
    
}
