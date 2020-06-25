//
//  MapView.swift
//  SimpleCalculator
//
//  Created by Andrei Pascu on 6/23/20.
//  Copyright © 2020 Andrei Pascu. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
	func makeUIView(context: Context) -> MKMapView {
		MKMapView(frame: .zero)
	}
	
	func updateUIView(_ uiView: MKMapView, context: Context) {
		let coordinate = CLLocationCoordinate2D(
			latitude: 22.0964, longitude: -159.5261
		)
		let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 0.75)
		let region = MKCoordinateRegion(center: coordinate, span: span)
		uiView.setRegion(region, animated: true)
	}
}

struct MapView_Previews: PreviewProvider {
	static var previews: some View {
		MapView()
			.previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
			.previewDisplayName("iPhone 11 Pro")
	}
}
