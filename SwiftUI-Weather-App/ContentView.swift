//
//  ContentView.swift
//  SwiftUI-Weather-App
//
//  Created by Caner Çağrı on 11.08.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackGroundView(topColor: .blue, bottomColor: Color("LightBlueColor"))
            VStack {
                Text("Fatih, Istanbul")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("35°C")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 50)
                
                HStack(spacing: 20) {
                    WeatherDayView(day: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 33)
                    WeatherDayView(day: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 41)
                    WeatherDayView(day: "THU",
                                   imageName: "wind.snow",
                                   temperature: 9)
                    WeatherDayView(day: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 30)
                    WeatherDayView(day: "SAT",
                                   imageName: "snow",
                                   temperature: -5)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var day: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°C")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackGroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}
