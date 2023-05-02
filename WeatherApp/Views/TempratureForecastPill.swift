//
//  TempratureForecastPill.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct TempratureForecastPill: View {
    var body: some View {
        VStack {
            Text("13:00")
                .regularFont(size: 14, color: AppColors.disabledText)
            Image("sunny")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            InlineTempratureText(degrees: 20)
        }
        .padding()
        .background(AppColors.primary30)
        .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}

struct TempratureForecastPill_Previews: PreviewProvider {
    static var previews: some View {
        TempratureForecastPill()
            .orangeBackgound()
    }
}
