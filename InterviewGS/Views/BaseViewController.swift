//
//  BaseViewController.swift
//  InterviewGS
//
//  Created by David on 10/7/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    func showSingleAlert(message : String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Aceptar", style: .default)
            
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
}
