//
//  Model.swift
//  SwiftUICalculator
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
	
	init (double: Double = 0) {
		self.setNumber(double: double)
	}
	
	func isNew() -> Bool {
		return (exponent == "" && !floating && significand == "")
	}
	
	func getDisplay() -> String {
		return (
			(signed ? "-" : "") +
			(exponent.contains("e") ? exponent : String(Int(exponent)?.formattedWithSeparator ?? "0")) +
			(floating ? "." + significand : "")
		)
	}
	
	func getSize() -> Int {
		return exponent.count + significand.count
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
	
	mutating func appendToNumber(value: String) {
		if self.getSize() < 9 {
			if value == "." {
				if !self.floating { self.floating.toggle() }
			}
			else {
				if !self.floating { self.exponent.append(value) }
				else { self.significand.append(value) }
			}
		}
	}
}

struct Input {
	var number: Number = .init()
	private(set) var numbers: [Number] = []
	private(set) var operation: String = ""
	private(set) var clear: Bool = true
	
	mutating func resetDisplay() -> Void {
		self = .init()
	}
	
	mutating func updateDisplay(value: String) {
		self.clear = false
		if operation != "" {
			numbers.append(number)
			number = .init()
			operation = ""
		}
		if self.number.getSize() <= 9 {
			if value == "." {
				if !self.number.floating { self.number.floating.toggle() }
			}
			else {
				if !self.number.floating { self.number.exponent.append(value) }
				else { self.number.significand.append(value) }
			}
		}
	}
	
	mutating func setOperation(operation: String) -> Void {
		self.operation = operation
	}
	
	mutating func retrieveResult() -> Void {
		self.numbers.reverse()
		let result = self.numbers.reduce(self.number.getNumber(), {
			(result: Double, nextItem: Number) -> Double in
			return doOperation(x: result, y: nextItem.getNumber(), operation: "+")
		})
		self.number = .init(double: result)
		self.numbers = [self.number]
	}
	
	func doOperation(x: Double, y: Double, operation: String) -> Double {
		switch operation {
		case "+":
			return x + y
		case "-":
			return x - y
		case "×":
			return x * y
		case "÷":
			return x / y
		default:
			return 0
		}
	}
}

struct Model {
	private var onDisplayView: Display = .init()
	private var inputFromUser: Number = .init()
	private var orderForInstr: [Instruction] = []
	private(set) var operation: String = ""
	private(set) var reset: Bool = true
	
	mutating func clearOnDisplayView() -> Void {
		self = .init()
	}
	
	func retrieveOnDisplayView() -> String {
		return onDisplayView.getDisplay()
	}
	
	private mutating func updateOnDisplayView(number: Number) -> Void {
		onDisplayView.setDisplay(display: number.getDisplay())
	}
	
	private mutating func updateInputFromUser(value: String) -> Void {
		inputFromUser.appendToNumber(value: value)
		reset = false
	}
	
	private mutating func overwriteInputFromUser(double: Double) -> Void {
		inputFromUser.setNumber(double: double)
	}
	
	private mutating func appendToOrderOfInstr() -> Void {
		let newInstruction = Instruction(number: inputFromUser, operation: operation)
		orderForInstr.append(newInstruction)
	}
	
	mutating func updateOperation(operation: String) -> Void {
		self.operation = operation
	}
}

private struct Display {
	private var display: String
	
	init(number: Number = .init()) {
		display = number.getDisplay()
	}
	
	func getDisplay() -> String {
		return self.display
	}
	
	mutating func setDisplay(display: String) -> Void {
		self.display = display
	}
}

private struct Instruction {
	private var number: Number
	private var operation: String
	
	init(number: Number, operation: String) {
		self.number = number
		self.operation = operation
	}
	
	func getOperation() -> String {
		return operation
	}
	
	func getNumber() -> Number {
		return number
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
