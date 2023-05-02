//
//  TempratureText.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct TempratureText: View {
    let degrees: Int
    let size: CGFloat
    
    init(degrees: Int, size: CGFloat = 100) {
        self.degrees = degrees
        self.size = size
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Text("\(degrees)")
                .boldFont(size:
                            size)
            HStack(alignment: .top) {
                Circle()
                    .stroke(AppColors.text)
                    .frame(maxWidth: 6)
                Text("C")
                    .regularFont(size: 14)
            }
            .offset(x: 15, y: 10)
        }
    }
}

struct InlineTempratureText: View {
    let degrees: Int
    let size: CGFloat
    
    init(degrees: Int, size: CGFloat = 14) {
        self.degrees = degrees
        self.size = size
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Text("\(degrees)°")
                .boldFont(size:
                            size)
        }
    }
}

struct TempratureText_Previews: PreviewProvider {
    static var previews: some View {
        TempratureText(degrees: 19)
            .orangeBackgound()
    }
}
