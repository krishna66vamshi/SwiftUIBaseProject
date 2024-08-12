//
//  GOBTSummaryScreen.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//

import SwiftUI

struct GOBTSummaryScreen: View {
    
    let appThemeColor = Color(#colorLiteral(red: 0.1334040463, green: 0.4403859973, blue: 0.7215221524, alpha: 1))
    let appBGColor = Color(#colorLiteral(red: 0.9604147077, green: 0.9617733359, blue: 0.9750575423, alpha: 1))
    
    @State var low = ""
    
    var body: some View {
        ScrollView {
            ZStack{
                Color(#colorLiteral(red: 0.9604147077, green: 0.9617733359, blue: 0.9750575423, alpha: 1))
                    .ignoresSafeArea(.all)
                
                VStack(spacing:5){
                    RoundedRectangle(cornerRadius: 35.0)
                        .foregroundColor(appThemeColor)
                        .frame(width: nil, height: 130, alignment: .top)
                        .offset(CGSize(width: 0.0, height: -60.0))
                        .padding(.bottom,0)
                        .overlay(
                            Text("Summary")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: nil, height: 50, alignment: .center)
                                .offset(CGSize(width: 0.0, height: -50.0))
                        )
                    
                    VStack(spacing:30){
                        VStack(alignment:.leading){
                            Text("5100077364")
                                .foregroundColor(appThemeColor)
                                .fontWeight(.semibold)
                                .font(.title2)
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(height: 190, alignment: .leading)
                                .background(Color.white)
                                .overlay(
                                    VStack(alignment: .leading, spacing: 10){
                                        HStack(alignment: .center, spacing: 20){
                                            Text("Ambient Range:")
                                                .fontWeight(.medium)
                                            Spacer()
                                            HStack(alignment: .center, spacing: 5){
                                                Text("Low:")
                                                    .fontWeight(.medium)
                                                    .frame(width: 40, height: 40, alignment: .center)
                                                TextField("-30", text: $low)
                                                    .font(.headline)
                                                    .frame(width: 40, height: 40, alignment: .leading)
                                                    .background(RoundedRectangle(cornerRadius: 5).stroke(Color.blue, lineWidth: 1))
                                                
                                                
                                                Text("High:")
                                                    .fontWeight(.medium)
                                                    .frame(width: 50, height: 40, alignment: .center)
                                                TextField("-10", text: $low)
                                                    .font(.headline)
                                                    .cornerRadius(10)
                                                    .frame(width: 40, height: 40, alignment: .leading)
                                                    .border(Color.gray, width: 1)
                                            }
                                            
                                        }.padding(5)
                                        
                                        HStack(spacing:20){
                                            Text("Shipment Name:")
                                                .fontWeight(.medium)
                                            Spacer()
                                            TextField("Shipment Name ", text: $low)
                                                .font(.headline)
                                                .cornerRadius(10)
                                                .frame(width: nil, height: 40, alignment: .leading)
                                                .border(Color.gray, width: 1)
                                            
                                        }.padding(5)
                                        
                                        HStack(alignment:.center){
                                            Spacer()
                                            Button(action: {}, label: {
                                                Text("Save")
                                                    .foregroundColor(.white)
                                                    .frame(width: 110, height: 40, alignment: .center)
                                                    .background(Capsule().fill(appThemeColor))
                                            })
                                            Spacer()
                                        }
                                    }
                                )
                        }
                        
                        VStack(alignment:.leading){
                            Text("Timing Information")
                                .foregroundColor(appThemeColor)
                                .fontWeight(.semibold)
                                .font(.title2)
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(height: 130, alignment: .leading)
                                .background(Color.white)
                                .overlay(
                                    VStack(alignment: .leading, spacing: 10){
                                        HStack{
                                            Text("Active Timestamp:")
                                                .fontWeight(.medium)
                                            Spacer()
                                            Text("Mar 29,2021 03:43:21 AM")
                                                .fontWeight(.medium)
                                        }
                                        HStack{
                                            Text("Read Timestamp:")
                                                .fontWeight(.medium)
                                            Spacer()
                                            Text("Mar 29,2021 03:43:21 AM")
                                                .fontWeight(.medium)
                                        }
                                        HStack{
                                            Text("Trip Duration:")
                                                .fontWeight(.medium)
                                            Spacer()
                                            Text("Mar 29,2021 03:43:21 AM")
                                                .fontWeight(.medium)
                                        }
                                    }.padding(10)
                                )
                        }
                        
                        VStack(alignment:.leading){
                            Text("Ambient Statistics")
                                .foregroundColor(appThemeColor)
                                .fontWeight(.semibold)
                                .font(.title2)
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(height: 130, alignment: .leading)
                                .background(Color.white)
                                .overlay(
                                    VStack(alignment: .leading, spacing: 10){
                                        HStack{
                                            Text("Min:")
                                                .fontWeight(.medium)
                                            Spacer()
                                            Text("10")
                                                .fontWeight(.medium)
                                        }
                                        HStack{
                                            Text("Max:")
                                                .fontWeight(.medium)
                                            Spacer()
                                            Text("10")
                                                .fontWeight(.medium)
                                        }
                                        HStack{
                                            Text("MKT:")
                                                .fontWeight(.medium)
                                            Spacer()
                                            Text("30")
                                                .fontWeight(.medium)
                                        }
                                        HStack{
                                            Text("Average:")
                                                .fontWeight(.medium)
                                            Spacer()
                                            Text("44")
                                                .fontWeight(.medium)
                                        }
                                    }.padding(10)
                                )
                        }
                    }.offset(CGSize(width: 0.0, height: -50.0))
                    .padding()
                    
                }.padding(.top,0)
                
            }
            .background(Color(#colorLiteral(red: 0.9604147077, green: 0.9617733359, blue: 0.9750575423, alpha: 1)))
        }
    }
}

struct GOBTSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        GOBTSummaryScreen()
    }
}
