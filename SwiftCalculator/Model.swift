//
//  Model.swift
//  SwiftUICalculator
//
//  Created by Andrei Pascu on 6/26/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct Number {
	var exponent: String = "0"
	var floating: Bool = false
	var significand: String = ""
	var signed: Bool = false
	
	init (double: Double = 0) {
		self.setNumber(double: double)
	}
	
	func isNew() -> Bool {
		return (exponent == "" && !floating && significand == "")
	}
	
	mutating func toggleSigned() -> Void {
		signed.toggle()
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
	
	mutating func appendToNumber(value: String) -> Bool {
		if self.getSize() > 9 { return false }
		if value == "0" && exponent == "0" { return false }
		
		if value == "." {
			if !self.floating { self.floating.toggle() }
		}
		else {
			if !self.floating { self.exponent.append(value) }
			else { self.significand.append(value) }
		}
		return true
	}
}

struct Input {
	private var onDisplayView: Display = .init()
	private var inputFromUser: Number = .init()
	private var orderForInstr: [Instruction] = []
	private(set) var operation: String = ""
	private(set) var reset: Bool = true
	
	mutating func resetInput() -> Void {
		self = .init()
	}
	
	mutating func clearOnDisplayView() -> Void {
		onDisplayView = .init()
	}
	
	func retrieveOnDisplayView() -> String {
		return onDisplayView.getDisplay()
	}
	
	private mutating func updateOnDisplayView(number: Number) -> Void {
		onDisplayView.setDisplay(number: number)
	}
	
	private mutating func updateInputFromUser(value: String) -> Void {
		let status = inputFromUser.appendToNumber(value: value)
		reset = reset && !status
	}
	
	private mutating func resetInputFromUser(value: String = "") -> Void {
		inputFromUser = .init()
		if value != "" {
			_ = inputFromUser.appendToNumber(value: value)
		}
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
	
	mutating func numberButtonPressed(value: String) -> Void {
		if operation == "" {
			updateInputFromUser(value: value)
		}
		else {
			resetInputFromUser()
			operation = ""
		}
		updateOnDisplayView(number: inputFromUser)
	}
	
	mutating func changeSignButtonPressed() -> Void {
		inputFromUser.toggleSigned()
		updateOnDisplayView(number: inputFromUser)
	}
}

private struct Display {
	private var display: String
	
	init(number: Number = .init()) {
		display = number.getDisplay()
	}
	
	func getDisplay() -> String {
		return display
	}
	
	mutating func setDisplay(number: Number) -> Void {
		display = number.getDisplay()
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
