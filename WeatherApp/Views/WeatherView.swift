//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Muktar Hussein on 23/11/2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold()
                        .font(.title2)
                        
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .font(.caption)
                        .fontWeight(.light)
                }
//                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "cloud")
                                .font(.system(size: 50))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2016/06/28/17/55/maligne-river-1485060_1280.jpg")){
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                            .cornerRadius(30)
                        
                    }placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Min temp", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(.mint)
                .background(Color.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("Background"))
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}

