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
	
    var body: some View {
        Button(action: {
			self.input.numberButtonPressed(value: "0")
			withAnimation{ self.input.updateSelectedOperation(operation: "") }
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
			self.input.numberButtonPressed(value: ".")
			withAnimation{ self.input.updateSelectedOperation(operation: "") }
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

