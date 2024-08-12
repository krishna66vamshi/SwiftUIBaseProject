//
//  BMICalcDesigns.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//


import SwiftUI
import WebKit
 

enum Gender {
    case Male
    case Female
}

struct BMICalcDesigns: View {
    
    @State var height = 80.0
    @State var weight = 80.0
    @State var age = 30
    @State var selectedGender:Gender = .Male
    @State private var isShowingDetailView = false
    
    
    var body: some View {
        
        NavigationView {
            ScrollView{
                VStack(alignment:.center,spacing:25) {
                    
                    HStack(spacing:20) {
                        VStack{
                            Image("male")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50, alignment: .center)
                            Text("Male")
                                .font(.title2)
                        }
                        .frame(width: 120, height: 150, alignment: .center)
                        .onTapGesture {
                            selectedGender = .Male
                        }
                        .padding()
                        .background(selectedGender == .Male ? Color.green : Color.red)
                        .cornerRadius(10)
                        
                        VStack{
                            Image("male")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50, alignment: .center)
                            Text("Female")
                                .font(.title2)
                        }
                        .frame(width: 120, height: 150, alignment: .center)
                        .onTapGesture {
                            selectedGender = .Female
                        }
                        .padding()
                        .background(selectedGender == .Female ? Color.green : Color.red)
                        .cornerRadius(10)
                    }
                    
                    VStack(spacing:10){
                        Text("Height")
                            .font(.title2)
                        HStack(alignment:.bottom,spacing:2){
                            Text(String(format: "%.f", height))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("cm")
                                .font(.title2)
                        }
                        Slider(value: $height, in: 10...100) { b in
                            
                        }.accentColor(Color.red)
                        
                    }.frame(width: 300, height: 150, alignment: .center)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                    
                    
                    HStack(spacing:20) {
                        VStack{
                            Text("WEIGHT")
                                .font(.title2)
                            Text(String(format: "%.f", weight))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            HStack {
                                Button(action: {
                                    weight += 1
                                }, label: {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color.red)
                                    
                                })
                                Button(action: {
                                    weight -= 1
                                    
                                }, label: {
                                    Image(systemName: "minus.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color.red)
                                })
                            }
                        }
                        .frame(width: 120, height: 150, alignment: .center)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                        
                        VStack{
                            Text("AGE")
                                .font(.title2)
                            Text(String(format: "%.d", age))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            HStack {
                                Button(action: {
                                    age += 1
                                }, label: {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color.red)
                                    
                                })
                                Button(action: {
                                    age -= 1
                                }, label: {
                                    Image(systemName: "minus.circle.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .foregroundColor(Color.red)
                                })
                            }
                        }
                        .frame(width: 120, height: 150, alignment: .center)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                        
                    }
                    
                    Button(action: {
                        isShowingDetailView = true
                    }, label: {
                        Text("Calculate")
                            .frame(width: 200, height: 40, alignment: .center)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(15)
                    })
                    .sheet(isPresented: $isShowingDetailView) {
                        MyWebView(url: URL(string: "https://www.google.com")!)
                    }
//                    .fullScreenCover(isPresented: $isShowingDetailView) {
//                        WebView(url: URL(string: "https://www.google.com")!)
//                    }
                }
            }.navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }
    }
}


struct BMICalcDesigns_Previews: PreviewProvider {
    static var previews: some View {
        BMICalcDesigns()
    }
}
