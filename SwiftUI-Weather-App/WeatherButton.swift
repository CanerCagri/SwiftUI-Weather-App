//
//  WeatherButton.swift
//  SwiftUI-Weather-App
//
//  Created by Caner Çağrı on 12.08.2022.
//

import SwiftUI

struct WeatherButton: View {
    
    var buttonText: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    
    var body: some View {
        
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
        
    }
}
