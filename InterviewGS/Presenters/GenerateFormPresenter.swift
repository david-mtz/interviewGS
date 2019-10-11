//
//  GenerateForm.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

protocol GenerateFormProtocol: class {
    func startFormGeneration()
    func successFormGeneration(_ form: Form)
    func errorFormGeneration(error: String)
    func stopFormGeneration()
}

class GenerateFormPresenter {
    
    weak var view: GenerateFormProtocol?
    
    func attachView(view: GenerateFormProtocol) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func generate(information: [SectionModel]) {
        self.view?.startFormGeneration()
        
        let form: Form
        var formSections: [FormSectionProtocol] = [FormSectionProtocol]()
        
        for section in information {
            switch section.sectionType {
                case .camera:
                    formSections.append(PhotoSection())
                    break
                case .image:
                    formSections.append(ImageSection())
                    break
                case .text:
                    formSections.append(NameSection())
                    break
                case .phone:
                    formSections.append(PhoneSection())
                    break
                case .date:
                    formSections.append(DateSection())
                    break
                case .gender:
                    if let options = section.sectionWithOptions {
                        formSections.append(GenderSection(config: options))
                    }
                    break
                case .colors:
                    if let options = section.sectionWithOptions {
                        formSections.append(ColorSection(config: options))
                    }
                    break
                default:
                    break
            }
        }
        
        form = Form(sections: formSections)
        
        self.view?.successFormGeneration(form)
        
        self.view?.stopFormGeneration()
    }
    

}
