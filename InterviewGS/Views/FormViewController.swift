//
//  FormViewController.swift
//  InterviewGS
//
//  Created by David on 10/8/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class FormViewController: FormBaseViewController {

    var generatedForm: Form?
    var formPresenter: FormPresenter = FormPresenter()
    
    @IBOutlet weak var formTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.formTableView.dataSource = self
        self.formTableView.delegate = self
        self.setUp()
    }
    
    private func setUp() {
        self.formTableView.allowsMultipleSelection = true
        self.formTableView.allowsMultipleSelectionDuringEditing = true
        FormCellType.registerCells(for: self.formTableView)
        self.addHideKeyboardGesture()
        self.formPresenter.attachView(view: self)
    }
    
    
    @IBAction func validateForm(_ sender: UIButton) {
        self.formPresenter.validate(form: self.generatedForm!)
    }
    
}

extension FormViewController: FormPresenterProtocol {
    func startFormPresenter() {
        // Start loading ...
    }
    
    func successValidationFormPresenter() {
        self.showSingleAlert(title: "Formulario válido", message: "Datos válidos")
        self.formPresenter.sendInformation(form: self.generatedForm!)
    }
    
    func errorValidationFormPresenter() {
        if self.generatedForm?.errors.count ?? 0 > 0, let message = self.generatedForm?.errors.joined(separator: "\n") {
            self.showSingleAlert(message: message)
        }
    }
    
    func successSendFormPresenter() {
        // ToDo
        debugPrint("ToDo: Send information to service")
    }
    
    func errorSendFormPresenter(error: String) {
        self.showSingleAlert(message: error)
    }
    
    func stopFormPresenter() {
        // Stop activity indicador
    }
    
    
    
}

extension FormViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.generatedForm?.formSection.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = self.generatedForm?.formSection[indexPath.section]
        let item = section?.sectionItems[indexPath.row]
        return CGFloat(item?.height ?? 0.0) ?? 44.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sectionComponent = self.generatedForm?.formSection[section] else {return ""}
        return sectionComponent.title
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.generatedForm?.formSection[section].sectionItems.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = self.generatedForm?.formSection[indexPath.section]
        let item = section?.sectionItems[indexPath.row]
        let cell: UITableViewCell

        if let cellType = section?.cellView {
          cell = cellType.dequeueCell(for: tableView, at: indexPath)
        } else {
          cell = UITableViewCell() //or anything you want
        }
                
        
        if let cellWithProtocol = cell as? FormCellDelegate {
            item?.indexPath = indexPath
            item?.delegate = self
            cellWithProtocol.prepareUI(item!)
        }
    self.generatedForm?.formSection[indexPath.section].sectionItems[indexPath.row].indexPath = indexPath
        
        cell.contentView.sizeToFit()
        cell.contentView.layoutIfNeeded()

        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {

        guard let cell = tableView.cellForRow(at: indexPath), let section = self.generatedForm?.formSection[indexPath.section], let config = section.selectionConfig else {
            return indexPath
        }

        if let selectedItems = tableView.indexPathsForSelectedRows?.all(where: {$0.section == indexPath.section}), !config.multiple {
            for selectedItem in selectedItems {
                tableView.deselectRow(at: selectedItem, animated: false)
                tableView.cellForRow(at: selectedItem)?.accessoryType = .none
            }

        }

        return indexPath

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath), let section = self.generatedForm?.formSection[indexPath.section], let config = section.selectionConfig else { return }
        cell.accessoryType =  .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath), let section = self.generatedForm?.formSection[indexPath.section], let config = section.selectionConfig else { return }
        cell.accessoryType = .none
    }
    
}
