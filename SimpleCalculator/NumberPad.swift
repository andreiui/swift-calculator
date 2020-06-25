//
//  NumberPad.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct NumberPad: View {
    var body: some View {
		VStack {
			HStack {
				SpecialActionButton(value: "AC")
				SpecialActionButton(value: "+/-")
				SpecialActionButton(value: "%")
				OperationButton(value: "÷")
			}
			.padding(4)
			HStack {
				NumberButton(value: 7)
				NumberButton(value: 8)
				NumberButton(value: 9)
				OperationButton(value: "×")
			}
			.padding(4)
			HStack {
				NumberButton(value: 4)
				NumberButton(value: 5)
				NumberButton(value: 6)
				OperationButton(value: "–")
			}
			.padding(4)
			HStack {
				NumberButton(value: 1)
				NumberButton(value: 2)
				NumberButton(value: 3)
				OperationButton(value: "+")
			}
			.padding(4)
			HStack {
				ZeroButton()
				DotButton()
				EqualSignButton()
			}
			.padding(4)
		}
    }
}

struct NumberPad_Previews: PreviewProvider {
    static var previews: some View {
        NumberPad()
    }
}
