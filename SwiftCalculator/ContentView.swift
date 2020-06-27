//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/23/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State var input: Input = .init()
	
	var body: some View {
		VStack {
			Spacer()
			HStack {
				Spacer()
				Display(input: $input)
			}
			NumberPad(input: $input)
		}
		.padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
			.previewDisplayName("iPhone 11 Pro")
	}
}
