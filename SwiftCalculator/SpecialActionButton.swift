//
//  SpecialActionButton.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/24/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct SpecialActionButton: View {
	var value: String
	
    var body: some View {
        Button(action: {
			
		}) {
			Text(self.value)
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

struct SpecialActionButton_Previews: PreviewProvider {
    static var previews: some View {
		SpecialActionButton(value: "±")
    }
}
