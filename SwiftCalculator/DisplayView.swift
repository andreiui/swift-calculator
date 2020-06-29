//
//  Display.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/25/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct DisplayView: View {
	@Binding var input: Input
	
    var body: some View {
		Text(input.getDisplay())
			.frame(alignment: .bottomTrailing)
			.font(.system(size: 56))
			.minimumScaleFactor(0.0005)
			.lineLimit(1)
			.padding()
    }
}
