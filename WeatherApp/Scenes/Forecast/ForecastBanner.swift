//
//  ForecastBanner.swift
//  WeatherApp
//
//  Created by Dirisu on 04/05/2023.
//

import SwiftUI

struct ForecastBanner: View {
    @EnvironmentObject private var viewModel: WeatherDetailsViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            ForecastTile(data: viewModel.current.dailyForecast.first, background: .transparent)
            HStack(alignment: .center, spacing: 30) {
                ForEach(viewModel.current.metricsList) { data in
                    ForecastMetricColumn(data: data)
                }
            }
        }
        .background(.primary60)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}

struct ForecastBanner_Previews: PreviewProvider {
    static var previews: some View {
        ForecastBanner()
            .environmentObject(WeatherDetailsViewModel())
            .orangeBackgound()
    }
}
