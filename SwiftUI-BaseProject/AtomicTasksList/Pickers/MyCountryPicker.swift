//
//  MyCountryPicker.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 14/07/22.
//

import SwiftUI

struct MyCountryPicker: View {
    
    @State private var presentPicker = false
    @State private var selectedCountry:Country?
    
    
    var body: some View {
        VStack{
            NavigationLink(destination: ReusableCountryPicker(selectedCountry: $selectedCountry), isActive: $presentPicker) {
                CapsuleButton(text: "Pick a Country", backgroundColor: .blue, textColor: .black) {
                    self.presentPicker.toggle()
                }
            }
//            .fullScreenCover(isPresented: $presentPicker) {
//                ReusableCountryPicker(selectedCountry: $selectedCountry)
//            }
            
            if selectedCountry != nil{
                Text((selectedCountry?.flag ?? "") + (selectedCountry?.name ?? ""))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()

            }
        }
    }
}

struct ReusableCountryPicker:View{
    
    @StateObject private var countriesVM = CountryViewModel()
    @State private var country = ""
    @State private var searchText: String = ""
    @Binding var selectedCountry:Country?
    @Environment(\.presentationMode) var presentationMode
    
    var filteredCountries: [Country] {
        if searchText.count == 0 {
            return countriesVM.countries
        } else {
            return countriesVM.countries.filter { $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        List{
            ForEach(filteredCountries,id: \.self){ obj in
                HStack(spacing:20){
                    Text(obj.flag)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text(obj.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                }.onTapGesture {
                    selectedCountry = obj
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Select a country")
        .searchable(text: $searchText,placement: .sidebar)
        .onAppear{
            countriesVM.fetchCountries()
        }
    }
}
