//
//  ContentView.swift
//  SwiftUI-Weather-App
//
//  Created by Caner Çağrı on 11.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    let weatherDays = [WeatherModel(day: "TUE", imageName: "cloud.sun.fill", temperature: 33),
    WeatherModel(day: "WED", imageName: "sun.max.fill", temperature: 41),
    WeatherModel(day: "THU", imageName: "wind.snow", temperature: 9),
    WeatherModel(day: "FRI", imageName: "sunset.fill", temperature: 30),
    WeatherModel(day: "SAT", imageName: "snow", temperature: -5)]
    
    var body: some View {
        ZStack {
            BackGroundView(isNight: isNight)
            VStack {
                CityName(cityName: "Fatih, Istanbul")
                WeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 35)
                
                HStack(spacing: 20) {
                    ForEach (weatherDays, id: \.id) { weather in
                        WeatherDayView(day: weather.day, imageName: weather.imageName, temperature: weather.temperature)
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonText: "Change Day Time",
                                  backgroundColor: Color.white,
                                  foregroundColor: Color.blue)
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
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.pink, .cyan, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°C")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackGroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("LightBlueColor")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityName: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}
