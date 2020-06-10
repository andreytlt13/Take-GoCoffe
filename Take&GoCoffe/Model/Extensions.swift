//
//  Extensions.swift
//  Take&GoCoffe
//
//  Created by andrey on 15.05.2020.
//  Copyright © 2020 Andrey Mescheryakov. All rights reserved.
//

import Foundation

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
