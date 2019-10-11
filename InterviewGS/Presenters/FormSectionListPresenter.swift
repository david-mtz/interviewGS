//
//  FormSectionListPresenter.swift
//  InterviewGS
//
//  Created by David on 10/7/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

protocol FormSectionListProtocol: NSObject {
    func setData(data: [SectionModel])
    func success()
    func error(error: String)
}

class FormSectionListPresenter {
    
    weak var view: FormSectionListProtocol?
    private let minOptions = 1
    
    func attachView(view: FormSectionListProtocol) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func getSections() {
        var data: [SectionModel] = [SectionModel]()
        data.append(SectionModel(title: "Cámara", sectionType: .camera, sectionWithOptions: nil))
        data.append(SectionModel(title: "Foto", sectionType: .image, sectionWithOptions: SectionWithOptions(options: ["image" : "http://mouse.latercera.com/wp-content/uploads/2018/02/vegeta.jpg"], multipleSelection: false)))
        data.append(SectionModel(title: "Nombre completo", sectionType: .text, sectionWithOptions: nil))
        data.append(SectionModel(title: "Número", sectionType: .phone, sectionWithOptions: nil))
        data.append(SectionModel(title: "Fecha de nacimiento", sectionType: .date, sectionWithOptions: nil))
        data.append(SectionModel(title: "Sexo", sectionType: .gender, sectionWithOptions: SectionWithOptions(options: ["h": "Hombre", "m": "Mujer"], multipleSelection: false)))
        data.append(SectionModel(title: "Colores", sectionType: .colors, sectionWithOptions: SectionWithOptions(options: ["red": "Rojo", "black": "Negro", "yellow": "Amarillo", "green": "Verde", "blue": "Azul"], multipleSelection: true)))
        self.view?.setData(data: data)
    }
    
    func verifySelectedItems(items: [SectionModel]) {
        if items.count >= minOptions {
            self.view?.success()
        } else {
            self.view?.error(error: "Debes seleccionar al menos un elemento.")
        }
    }
    
}

struct SectionModel {
    var title: String
    var sectionType: SectionType
    var sectionWithOptions: SectionWithOptions?
}

enum SectionType: String {
    case camera = "camara"
    case image = "foto"
    case text = "texto"
    case phone = "telefono"
    case date = "fecha"
    case gender = "sexo"
    case colors = "colores"
}
