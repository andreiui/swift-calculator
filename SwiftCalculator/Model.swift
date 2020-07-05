//
//  Model.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/26/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct Number {
	var exponent: String = ""
	var floating: Bool = false
	var significand: String = ""
	var signed: Bool = false
	
	func getDisplay() -> String {
		return (
			(signed ? "-" : "") +
			(exponent.contains("e") ? exponent : String(Int(exponent)?.formattedWithSeparator ?? "0")) +
			(floating ? "." + significand : "")
		)
	}
	
	func getSize() -> Int {
		var count = 0;
		for i in exponent {
			if (i >= "0" && i <= "9") { count += 1 }
		}
		return count + significand.count
	}
	
	func getNumber() -> Double {
		return Double(getDisplay().replacingOccurrences(of: ",", with: "")) ?? 0.0
	}
	
	mutating func setNumber(double: Double) -> Void {
		let precision: Double = 100000000000000000.0
		let number = String(double >= 0 ? Double(round(precision * double) / precision) : -Double(round(precision * double) / precision))
		if !number.contains("e") {
			exponent = String(number[..<(number.firstIndex(of: ".") ?? number.endIndex)])
			floating = false
			significand = String(number[(number.index(number.firstIndex(of: ".") ?? number.endIndex, offsetBy: 1))..<number.endIndex])
			if significand == "0" {
				significand = ""
				floating = false
			}
			else { floating = true }
		}
		else {
			exponent = number
			floating = false
			significand = ""
		}
		signed = double < 0 ? true : false
	}
}

struct Input {
	var number: Number = .init()
	var numbers: [Number] = []
	var operation: String = ""
	var clear: String = "AC"
	
	mutating func setOperation(operation: String) -> Void {
		self.operation = operation
	}
	
	mutating func updateDisplay(value: String) {
		self.clear = "C"
		if self.number.getSize() < 9 {
			if value == "." {
				if !self.number.floating {
					self.number.floating.toggle()
				}
			}
			else if !self.number.floating {
				self.number.exponent.append(value)
			}
			else {
				self.number.significand.append(value)
			}
		}
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
