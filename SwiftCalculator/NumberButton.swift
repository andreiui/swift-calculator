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
		if !self.input.floating {
			self.input.integer = self.input.integer.replacingOccurrences(of: ",", with: "")
			self.input.integer.append(digit)
			self.input.integer = Float64(self.input.integer)?.formattedWithSeparator ?? "0"
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
