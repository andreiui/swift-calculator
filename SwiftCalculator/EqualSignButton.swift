//
//  EqualSignButton.swift
//  SwiftUICalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct EqualSignButton: View {
	@Binding var input: Input
	
    var body: some View {
        Button(action: {
			self.input.equalSignButtonPressed()
			withAnimation { self.input.updateSelectedOperation(operation: "=") }
		}) {
			Text("=")
				.modifier(CalculatorButtonTextModifier(
					background: Color(.systemBlue)
					)
				)
		}
		.modifier(CalculatorButtonViewModifier())
    }
}
