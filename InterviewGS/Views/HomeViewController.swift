//
//  HomeViewController.swift
//  InterviewGS
//
//  Created by David on 10/7/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var itemsTableView: UITableView!
    
    var data: [SectionModel] = [SectionModel]()
    var formPresenter = FormSectionListPresenter()
    var generateFormPresenter = GenerateFormPresenter()
    
    private let cellIdentifier = "reusable"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    private func setUp(){
        self.itemsTableView.delegate = self
        self.itemsTableView.dataSource = self
        self.itemsTableView.allowsMultipleSelection = true
        self.itemsTableView.allowsMultipleSelectionDuringEditing = true
        self.formPresenter.attachView(view: self)
        self.generateFormPresenter.attachView(view: self)
        self.formPresenter.getSections()
    }
    
    
    @IBAction func generateFormBtnAction(_ sender: UIButton) {
        var selected = [SectionModel]()
        if let selectedCells = self.itemsTableView.indexPathsForSelectedRows {
            for index in selectedCells {
                selected.append(self.data[index.row])
            }
        }
        self.formPresenter.verifySelectedItems(items: selected)
    }
        
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CheckboxTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.textLabel?.text = self.data[indexPath.row].title
        return cell
    }
    
    
}

extension HomeViewController: FormSectionListProtocol {
    
    func setData(data: [SectionModel]) {
        self.data = data
        self.itemsTableView.reloadData()
    }
    
    func success() {
        guard let selectedCells = self.itemsTableView.indexPathsForSelectedRows else { return }
        var selected = [SectionModel]()
        for item in selectedCells {
            selected.append(data[item.row])
        }
        self.generateFormPresenter.generate(information: selected)
    }
    
    func error(error: String) {
        self.showSingleAlert(message: error)
    }

}

extension HomeViewController: GenerateFormProtocol {
    func startFormGeneration() {
        // Start Activity indicator ....
    }
    
    func successFormGeneration(_ form: Form) {
        if let nextVC = self.storyboard?.instantiateViewController(identifier: "FormViewController") as?  FormViewController {
            nextVC.generatedForm = form
            self.present(nextVC, animated: true)
        }
    }
    
    func errorFormGeneration(error: String) {
        self.showSingleAlert(message: error)
    }
    
    func stopFormGeneration() {
        // Stop Activity indicator ....
    }
    
    
}
