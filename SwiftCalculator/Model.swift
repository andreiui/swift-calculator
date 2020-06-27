//
//  Model.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/26/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct Input {
	var display: String = "0"
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
		formatter.locale = Locale.current
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
