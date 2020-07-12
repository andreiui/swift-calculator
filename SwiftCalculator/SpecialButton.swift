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
			self.input.clearOnDisplayView()
			withAnimation { self.input.resetInput() }
		}) {
			Text(input.clear ? "AC" : "C")
				.frame(width: 72, height: 72)
				.font(.title)
				.foregroundColor(Color.white)
				.background(Color(.systemGray2))
				.clipShape(Circle())
		}
		.buttonStyle(PlainButtonStyle())
		.padding(4)
    }
}

struct ChangeSignButton: View {
    @Binding var input: Input
	
    var body: some View {
        Button(action: {
			self.input.changeSignButtonPressed()
		}) {
			Text("+/-")
				.frame(width: 72, height: 72)
				.font(.title)
				.foregroundColor(Color.white)
				.background(Color(.systemGray2))
				.clipShape(Circle())
		}
		.buttonStyle(PlainButtonStyle())
		.padding(4)
    }
}

struct PercentButton: View {
    @Binding var input: Input
	
    var body: some View {
        Button(action: {
			self.input.percentButtonPressed()
		}) {
			Text("%")
				.frame(width: 72, height: 72)
				.font(.title)
				.foregroundColor(Color.white)
				.background(Color(.systemGray2))
				.clipShape(Circle())
		}
		.buttonStyle(PlainButtonStyle())
		.padding(4)
    }
}
