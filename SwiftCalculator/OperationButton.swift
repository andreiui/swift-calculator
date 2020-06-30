//
//  OperationButton.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct OperationButton: View {
	var value: String
	
    var body: some View {
        Button(action: {
			
		}) {
			Text(self.value)
				.frame(width: 72, height: 72)
				.font(.largeTitle)
				.foregroundColor(Color.white)
				.background(Color(.systemTeal))
				.clipShape(Circle())
		}
		.buttonStyle(PlainButtonStyle())
		.padding(4)
    }
}
