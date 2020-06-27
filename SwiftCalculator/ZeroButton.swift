//
//  ZeroButton.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct ZeroButton: View {
	@Binding var input: Input
	
	func updateDisplay() {
		self.input.display.append("0")
		self.input.display = String(Int(self.input.display) ?? 0)
	}
	
    var body: some View {
        Button(action: {
			self.updateDisplay()
		}) {
			Text("0")
				.frame(width: 130, height: 72, alignment: .leading)
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
