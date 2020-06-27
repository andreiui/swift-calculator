//
//  DotButton.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct DotButton: View {
    var body: some View {
        Button(action: {
			
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

struct DotButton_Previews: PreviewProvider {
    static var previews: some View {
        DotButton()
    }
}
