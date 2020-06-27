//
//  Display.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/25/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct Display: View {
	@Binding var input: Input
	
    var body: some View {
		Text(input.display)
			.frame(alignment: .bottomTrailing)
			.font(.custom("largerTitle", size: 64))
			.padding()
    }
}
