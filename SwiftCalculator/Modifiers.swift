//
//  Modifiers.swift
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

struct NumberButtonTextModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(width: 72, height: 72)
			.font(.largeTitle)
			.foregroundColor(Color.white)
			.background(Color(.systemGray4))
			.cornerRadius(100)
	}
}

struct SpecialButtonTextModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(width: 72, height: 72)
			.font(.largeTitle)
			.foregroundColor(Color.white)
			.background(Color(.systemGray2))
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

struct OperationButtonTextModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(width: 72, height: 72)
			.font(.largeTitle)
			.cornerRadius(100)
	}
}

struct EqualButtonTextModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(width: 72, height: 72)
			.font(.largeTitle)
			.foregroundColor(Color.white)
			.background(Color(.systemBlue))
			.cornerRadius(100)
	}
}
