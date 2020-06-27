//
//  EqualSignButton.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct EqualSignButton: View {
    var body: some View {
        Button(action: {
			
		}) {
			Text("=")
				.frame(width: 72, height: 72)
				.font(.largeTitle)
				.foregroundColor(Color.white)
				.background(Color(.systemBlue))
				.clipShape(Circle())
		}
		.buttonStyle(PlainButtonStyle())
		.padding(4)
    }
}

struct EqualSignButton_Previews: PreviewProvider {
    static var previews: some View {
        EqualSignButton()
    }
}
