//
//  CalculatorViewModifier.swift
//  SwiftCalculator
//
//  Created by Andrei Pascu on 7/14/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct CalculatorButtonViewModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.buttonStyle(PlainButtonStyle())
			.padding(4)
	}
}

struct CalculatorButtonTextModifier: ViewModifier {
	@State var background: Color
	@State var foregroundColor: Color = Color.white
	
	func body(content: Content) -> some View {
		content
			.frame(width: 72, height: 72)
			.font(.largeTitle)
			.foregroundColor(foregroundColor)
			.background(background)
			.cornerRadius(100)
	}
}

struct ZeroButtonTextModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(width: 133, height: 72, alignment: .leading)
			.padding(.leading, 26)
			.font(.largeTitle)
			.foregroundColor(Color.white)
			.background(Color(.systemGray4))
			.cornerRadius(100)
	}
}
