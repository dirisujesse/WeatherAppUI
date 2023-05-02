//
//  HomeView.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Stockholm,\nSweden")
                        .mediumFont(size: 40)
                    Text("Tue, Jun 30")
                        .regularFont(size: 16, color: AppColors.secondaryText)
                    TempratureHighlight()
                    ForEach(WeatherMetricModel.mockData) {
                        WeatherMetricTile(data: $0)
                    }
                }
                .padding(.horizontal)
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(1..<10) { _ in
                            TempratureForecastPill()
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 20)
            }
        }
        .toolbar {
            NavigationLink(destination: ForecastView()) {
                HStack {
                    Text("Weather Forecast")
                        .regularFont(size: 15)
                    Image(systemName: "chevron.right")
                        .regularFont(size: 15)
                }
            }
        }
        .toolbarBackground(AppColors.orange, for: .navigationBar)
        .orangeBackgound()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
