//
//  LocationPreviewView.swift
//  MapSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 13/02/2023.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject var vm : LocationViewModel
    let location : Location
    var body: some View {
        
            HStack(alignment : .bottom){
                VStack(alignment: .leading){
                    imageSection
                    titleSection
                }
                VStack(spacing : 8){
                    learnMoreButton
                    nextButton
                }
                
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .offset(y : 60)
            )
            .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.purple.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
    }
}


extension LocationPreviewView{
    
    private var imageSection : some View {
        ZStack{
        if let imageName = location.imageNames.first! {
           
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100 , height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection : some View {
        VStack(alignment: .leading){
            Text(location.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity , alignment: .leading)
    }
    
    private var learnMoreButton : some View {
        Button {
            
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125 , height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    
    private var nextButton : some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125 , height: 35)
        }
        .buttonStyle(.bordered)
    }
}
