//
//  CustomPicker.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//

import SwiftUI

struct CustomPicker: View {
    var colors = ["Red", "Green", "Blue", "Tartan","Yellow","Orange","Apple"]
    
    var sports = ["Soccer", "Rugby", "Cricket", "Tennis"]

    @State private var selectedSport = 0

    @State private var selectedColor = "Blue"
    
    
    var body: some View {
        VStack {
            //If we don’t set a specific style, the default one is the menu style
            Picker("Please choose a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }.pickerStyle(WheelPickerStyle())
            Text("Wheel Selected : \(selectedColor)")
            
            Picker("Please choose a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }.pickerStyle(.menu)
            Text("Menu selected: \(selectedColor)")
            
            Picker("Please choose a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }.pickerStyle(.segmented)
            Text("Segmented selected: \(selectedColor)")
            
            Form {
                Section {
                    Picker(selection: $selectedSport, label: Text("Sport")) {
                        ForEach(0..<sports.count, id: \.self) {
                            Text(self.sports[$0])
                        }
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPicker()
    }
}
