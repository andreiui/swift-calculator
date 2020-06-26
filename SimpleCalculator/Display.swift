//
//  Display.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/25/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct Display: View {
	@State var value: String
	
    var body: some View {
        Text(value)
			.frame(alignment: .bottomTrailing)
			.font(.custom("largerTitle", size: 64))
			.padding()
    }
}

struct Display_Previews: PreviewProvider {
    static var previews: some View {
		Display(value: "10")
    }
}
