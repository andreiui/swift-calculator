//
//  NumberButton.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct NumberButton: View {
	var value: Int
	@Binding var input: Input
	
	func updateDisplay(digit: String) {
		self.input.clear = "C"
		if !self.input.floating {
			self.input.integer.append(digit)
		}
		else {
			self.input.decimal.append(digit)
		}
	}
	
    var body: some View {
        Button(action: {
			self.updateDisplay(digit: String(self.value))
		}) {
			Text(String(self.value))
				.frame(width: 72, height: 72)
				.font(.largeTitle)
				.foregroundColor(Color.white)
				.background(Color(.systemGray4))
				.clipShape(Circle())
		}
		.buttonStyle(PlainButtonStyle())
		.padding(4)
    }
}

struct ZeroButton: View {
	@Binding var input: Input
	
	func updateDisplay() {
		if !self.input.floating {
			self.input.integer.append("0")
		}
		else {
			self.input.decimal.append("0")
		}
	}
	
    var body: some View {
        Button(action: {
			self.updateDisplay()
		}) {
			Text("0")
				.frame(width: 133, height: 72, alignment: .leading)
				.padding(.leading, 26)
				.font(.largeTitle)
				.foregroundColor(Color.white)
				.background(Color(.systemGray4))
				.cornerRadius(100)
		}
		.buttonStyle(PlainButtonStyle())
		.padding(4)
    }
}

struct DotButton: View {
	@Binding var input: Input
	
    var body: some View {
        Button(action: {
			self.input.clear = "C"
			if !self.input.floating {
				self.input.floating.toggle()
			}
		}) {
			Text(".")
				.frame(width: 72, height: 72)
				.font(.largeTitle)
				.foregroundColor(Color.white)
				.background(Color(.systemGray4))
				.cornerRadius(100)
		}
		.buttonStyle(PlainButtonStyle())
		.padding(4)
    }
}

