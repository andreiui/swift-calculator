//
//  NumberPad.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct NumberPad: View {
	@Binding var input: Input
	
    var body: some View {
		VStack {
			HStack {
				ClearButton(input: $input)
				ChangeSignButton(input: $input)
				PercentButton(input: $input)
				OperationButton(value: "÷")
			}
			.padding(4)
			HStack {
				NumberButton(value: 7, input: $input)
				NumberButton(value: 8, input: $input)
				NumberButton(value: 9, input: $input)
				OperationButton(value: "×")
			}
			.padding(4)
			HStack {
				NumberButton(value: 4, input: $input)
				NumberButton(value: 5, input: $input)
				NumberButton(value: 6, input: $input)
				OperationButton(value: "–")
			}
			.padding(4)
			HStack {
				NumberButton(value: 1, input: $input)
				NumberButton(value: 2, input: $input)
				NumberButton(value: 3, input: $input)
				OperationButton(value: "+")
			}
			.padding(4)
			HStack {
				ZeroButton(input: $input)
				DotButton(input: $input)
				EqualSignButton()
			}
			.padding(4)
		}
    }
}
