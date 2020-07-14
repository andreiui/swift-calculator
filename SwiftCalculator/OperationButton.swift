//
//  OperationButton.swift
//  SwiftUICalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct OperationButton: View {
	var operation: String
	@Binding var input: Input
	
    var body: some View {
        Button(action: {
			withAnimation { self.input.operationButtonPressed(operation: self.operation) }
		}) {
			Text(self.operation)
				.frame(width: 72, height: 72)
				.font(.largeTitle)
				.foregroundColor(self.input.selectedOperation != operation ? Color.white : Color(.systemTeal))
				.background(self.input.selectedOperation != operation ? Color(.systemTeal) : Color.black)
				.clipShape(Circle())
		}
		.buttonStyle(PlainButtonStyle())
		.padding(4)
    }
}
