//
//  SpecialButton.swift
//  SwiftUICalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct ClearButton: View {
    @Binding var input: Input
	
    var body: some View {
        Button(action: {
			self.input.clearOnDisplay()
			withAnimation { self.input.resetInput() }
		}) {
			Text(input.clear ? "AC" : "C")
				.font(.title)
				.modifier(CalculatorButtonTextModifier(
					background: Color(.systemGray2)
					)
				)
		}
		.modifier(CalculatorButtonViewModifier())
    }
}

struct ChangeSignButton: View {
    @Binding var input: Input
	
    var body: some View {
        Button(action: {
			self.input.changeSignButtonPressed()
		}) {
			Text("+/-")
				.font(.title)
				.modifier(CalculatorButtonTextModifier(
					background: Color(.systemGray2)
					)
				)
		}
		.modifier(CalculatorButtonViewModifier())
    }
}

struct PercentButton: View {
    @Binding var input: Input
	
    var body: some View {
        Button(action: {
			self.input.percentButtonPressed()
		}) {
			Text("%")
				.font(.title)
				.modifier(CalculatorButtonTextModifier(
					background: Color(.systemGray2)
					)
				)
		}
		.modifier(CalculatorButtonViewModifier())
    }
}
