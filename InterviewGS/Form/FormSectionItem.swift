//
//  FormSectionItem.swift
//  InterviewGS
//
//  Created by David on 10/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

class FormSectionItem {
    var indexPath: IndexPath?
    var label: String?
    var value: String?
    var isSelected: Bool = false
    weak var delegate: FormDelegate?
    var height: Float = 44.0

    func didChange(value: String) {}
}
