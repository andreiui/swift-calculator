//
//  CircleImage.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/23/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
	var body: some View {
		Image("kauai")
			.resizable()
			.frame(width: 256, height: 256, alignment: .center)
			.clipShape(Circle())
			.overlay(
				Circle().stroke(Color.white, lineWidth: 4)
			)
			.shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
	static var previews: some View {
		CircleImage()
			.previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
			.previewDisplayName("iPhone 11 Pro")
	}
}
