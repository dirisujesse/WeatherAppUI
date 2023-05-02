//
//  TempratureHighlight.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct TempratureHighlight: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image("sunny_cloudy")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 150, maxHeight: 150)
            TempratureText(degrees: 19)
        }
        .padding(.horizontal)
    }
}

struct TempratureHighlight_Previews: PreviewProvider {
    static var previews: some View {
        TempratureHighlight()
            .orangeBackgound()
    }
}
