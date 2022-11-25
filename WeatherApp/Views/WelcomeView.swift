//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Muktar Hussein on 23/11/2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to the weather App")
                    .bold()
                    .font(.title2)
                
                Text("Share location to get weather updates in your area")
                    .padding()
                    .font(.headline)
            }
            .padding()
            .multilineTextAlignment(.center)
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestUserLocation()
            }
            .cornerRadius(20)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
//        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
