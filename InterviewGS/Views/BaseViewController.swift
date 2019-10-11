//
//  BaseViewController.swift
//  InterviewGS
//
//  Created by David on 10/7/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    func addHideKeyboardGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func showSingleAlert(title: String = "Error", message : String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Aceptar", style: .default)
            
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
}
