//
//  PhotoTableViewCell.swift
//  InterviewGS
//
//  Created by David on 10/8/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell, FormCellDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    var item: FormSectionItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
        // Initialization code
    }
    
    private func setUp() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(presentCamera(tapGestureRecognizer:)))
        photoImageView.isUserInteractionEnabled = true
        photoImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    internal func prepareUI(_ withItem: FormSectionItem) {
        self.item = withItem
    }

    @objc func presentCamera(tapGestureRecognizer: UITapGestureRecognizer) {
        guard let delegate = item?.delegate else {return}
        //delegate.presentCameraViewController()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}


protocol CameraFromCellDelegate: NSObject {
    func presentCameraFromPhotoCell()
}
