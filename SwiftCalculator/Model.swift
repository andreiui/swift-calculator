//
//  Model.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/26/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct Input {
	var integer: String = "0"
	var floating: Bool = false
	var decimal: String = ""
	var clear: String = "AC"
	var signed: Bool = false
	
	func getDisplay() -> String {
		return (
			(signed ? "-" : "") +
			String(Int(integer)?.formattedWithSeparator ?? "0") +
			(floating ? "." + decimal : "")
		)
	}
	
	func getSize() -> Int {
		var count = 0;
		for i in integer {
			if (i >= "0" && i <= "9") { count += 1 }
		}
		return count + decimal.count
	}
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
		formatter.groupingSeparator = ","
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
