//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct ForecastView: View {
    @Environment(\.dismiss) private var close
    @EnvironmentObject private var viewModel: WeatherDetailsViewModel
    
    var body: some View {
        ScrollView {
            ForecastBanner()
            ForEach(viewModel.current.dailyForecast) {
                ForecastTile(data: $0)
            }.padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Weather Forecast")
                    .regularFont(size: 20)
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    close()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                            .regularFont(size: 15)
                        Text("Home")
                            .regularFont(size: 15)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .foregroundColor(AppColors.text)
        .toolbarBackground(AppColors.orange, for: .navigationBar)
        .orangeBackgound()
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                ForecastView()
            }
        }
    }
}
