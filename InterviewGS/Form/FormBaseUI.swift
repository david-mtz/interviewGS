//
//  FormBaseUI.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
import UIKit

protocol FormDelegate: UIViewController {
    func presentCameraViewController()
}

class FormBaseViewController: BaseViewController, FormDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func presentCameraViewController() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }

        print(image.size)
    }

}
