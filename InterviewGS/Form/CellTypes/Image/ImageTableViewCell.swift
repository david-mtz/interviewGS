//
//  ImageTableViewCell.swift
//  InterviewGS
//
//  Created by David on 10/8/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell, FormCellDelegate {
    
    @IBOutlet weak var imageViee: UIImageView!
    var item: FormSectionItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func prepareUI(_ withItem: FormSectionItem) {
        self.item = withItem
        guard let url = item?.value else { return }
        imageViee?.loadImageFromUrl(url: url)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
    }
    
}
