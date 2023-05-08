//
//  TempratureHighlight.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct TempratureHighlight: View {
    struct TemperatureHighlightData {
        let image: String
        let temp: String
    }
    
    let data: TemperatureHighlightData
    
    init(image: String, temp: String) {
        self.data = TemperatureHighlightData(image: image, temp: temp)
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Image(data.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: vw(40), maxHeight: vw(40))
            TempratureText(degrees: data.temp)
        }
        .padding(.horizontal)
    }
}

struct TempratureHighlight_Previews: PreviewProvider {
    static var previews: some View {
        TempratureHighlight(image: "sunny", temp: "19")
            .orangeBackgound()
    }
}
