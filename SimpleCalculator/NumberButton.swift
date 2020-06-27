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
		self.input.display.append(digit)
		self.input.display = String(Int(self.input.display) ?? 0)
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
