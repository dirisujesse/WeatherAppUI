//
//  HomeLocationHeader.swift
//  WeatherApp
//
//  Created by Dirisu on 04/05/2023.
//

import SwiftUI

struct HomeLocationHeader: View {
    @EnvironmentObject private var viewModel: WeatherDetailsViewModel;
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(viewModel.currentCity),\n\(viewModel.currentCountry)")
                .mediumFont(size: 40)
            Text(viewModel.currentTime)
                .regularFont(size: 16, color: AppColors.secondaryText)
        }
    }
}

struct HomeLocationHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeLocationHeader()
            .environmentObject(WeatherDetailsViewModel())
            .orangeBackgound()
    }
}
