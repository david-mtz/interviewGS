//
//  Array+Where.swift
//  InterviewGS
//
//  Created by David on 11/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    func all(where predicate: (Element) -> Bool) -> [Element]  {
        return self.compactMap { predicate($0) ? $0 : nil }
    }
}
