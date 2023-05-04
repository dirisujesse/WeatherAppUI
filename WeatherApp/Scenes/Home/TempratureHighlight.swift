//
//  TempratureHighlight.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct TempratureHighlight: View {
    @EnvironmentObject private var viewModel: WeatherDetailsViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(viewModel.current.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 150, maxHeight: 150)
            TempratureText(degrees: viewModel.current.formattedTemp)
        }
        .padding(.horizontal)
    }
}

struct TempratureHighlight_Previews: PreviewProvider {
    static var previews: some View {
        TempratureHighlight()
            .environmentObject(WeatherDetailsViewModel())
            .orangeBackgound()
    }
}
