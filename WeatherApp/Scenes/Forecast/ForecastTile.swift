//
//  ForecastTile.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct ForecastTile: View {
    let data: WeatherDailyForcast?
    let background: Color

    init(data: WeatherDailyForcast?, background: Color = AppColors.primary30) {
        self.data = data
        self.background = background
    }

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(data?.formattedDate ?? "")
                .boldFont(size: 14)
            Spacer()
            Text(data?.formattedTemp ?? "0")
                .boldFont(size: 14)
            Image(data?.image ?? "")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 70, maxHeight: 70)
                .offset(x: 0, y: 5)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        .background(background)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }
}
