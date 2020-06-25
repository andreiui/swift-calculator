//
//  NumberButton.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct NumberButton: View {
	var value: Int
	
    var body: some View {
        Button(action: {
			
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

struct SimpleButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton(value: 1)
    }
}
