//
//  NumberButton.swift
//  SwiftUICalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct NumberButton: View {
	var value: Int
	@Binding var input: Input
	
    var body: some View {
        Button(action: {
			self.input.numberButtonPressed(value: String(self.value))
			withAnimation{ self.input.updateSelectedOperation(operation: "") }
		}) {
			Text(String(self.value))
				.modifier(CalculatorButtonTextModifier(
					background: Color(.systemGray4)
					)
				)
		}
		.modifier(CalculatorButtonViewModifier())
    }
}

struct ZeroButton: View {
	@Binding var input: Input
	
    var body: some View {
        Button(action: {
			self.input.numberButtonPressed(value: "0")
			withAnimation{ self.input.updateSelectedOperation(operation: "") }
		}) {
			Text("0")
				.modifier(ZeroButtonTextModifier())
		}
		.modifier(CalculatorButtonViewModifier())
    }
}

struct DotButton: View {
	@Binding var input: Input
	
    var body: some View {
        Button(action: {
			self.input.numberButtonPressed(value: ".")
			withAnimation{ self.input.updateSelectedOperation(operation: "") }
		}) {
			Text(".")
				.modifier(CalculatorButtonTextModifier(
					background: Color(.systemGray4)
					)
				)
		}
		.modifier(CalculatorButtonViewModifier())
    }
}

