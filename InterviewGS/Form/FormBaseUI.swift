//
//  FormBaseUI.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation
import UIKit

typealias completionCamera = (UIImage) -> Void
protocol FormDelegate: UIViewController {
    func presentCameraViewController(completion: @escaping completionCamera)
}

class FormBaseViewController: BaseViewController, FormDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
        
    var completionFromCamera: completionCamera?
    
    func presentCameraViewController(completion: @escaping completionCamera) {
        self.completionFromCamera = completion
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
        
        guard let completion = self.completionFromCamera else { return }
        
        completion(image)

    }

}
