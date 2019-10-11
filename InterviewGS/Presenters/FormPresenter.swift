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
    func successFormPresenter()
    func errorFormPresenter(error: String)
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
    
    
    func sendInformation(form: Form) {
        self.view?.startFormPresenter()
        
        for section in form.formSection {
            debugPrint(section.getValue())
        }
        
        self.view?.successFormPresenter()
        
        self.view?.stopFormPresenter()
    }
    

}
