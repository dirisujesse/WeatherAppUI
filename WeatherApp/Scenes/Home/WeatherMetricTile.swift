//
//  WeatherMetricTile.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct WeatherMetricTile: View {
    let data: WeatherMetricModel;
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(data.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: vw(10), maxHeight: vw(10))
            Text(data.title)
                .regularFont(size: 14)
            Spacer()
            Text(data.value)
                .regularFont(size: 14)
        }
        .padding(.horizontal, 11)
        .padding(.vertical)
        .background(.primary30)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 1)
        )
    }
}

struct WeatherMetricTile_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMetricTile(data: WeatherMetricModel.mockData[0])
            .padding()
            .orangeBackgound()
    }
}
