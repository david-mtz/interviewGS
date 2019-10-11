//
//  FormPresenter.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

protocol FormPresenterProtocol: class {
    func startFormPresenter()
    func successValidationFormPresenter()
    func errorValidationFormPresenter()
    func successSendFormPresenter()
    func errorSendFormPresenter(error: String)
    func stopFormPresenter()
}

class FormPresenter {
    
    weak var view: FormPresenterProtocol?
    
    func attachView(view: FormPresenterProtocol) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func validate(form: Form) {
        self.view?.startFormPresenter()
        if form.isValid() {
            self.view?.successValidationFormPresenter()
        } else {
            self.view?.errorValidationFormPresenter()
        }
        self.view?.stopFormPresenter()
    }
    
    
    func sendInformation(form: Form) {
        self.view?.startFormPresenter()
        
        for section in form.formSection {
            debugPrint(section.getValue())
        }
        
        self.view?.successSendFormPresenter()
        
        self.view?.stopFormPresenter()
    }
    

}
