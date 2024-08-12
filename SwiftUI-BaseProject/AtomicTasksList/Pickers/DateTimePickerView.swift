//
//  DateTimePickerView.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//

import SwiftUI

struct DateTimePickerView: View {
    @State private var birthDate = Date()
    @State private var birthTime = Date()
    @State private var birthDateTime = Date()
    
    @State private var date = Date()
    
    
    var body: some View {
        
        List {
            VStack(alignment: .leading, spacing: 20) {
                Text("Only Date Picker")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .background(Capsule().fill(.red))
                
                DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                    Text("Select a date")
                }
                
                Text("Selected Date is \(birthDate.formatted(date: .long, time: .omitted))")
                    .padding(.all,10)
                    .background(Capsule().fill(.cyan))
                
                Text("Only Time Picker")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .background(Capsule().fill(.green))
                
                DatePicker(selection: $birthTime, in: ...Date(), displayedComponents: .hourAndMinute) {
                    Text("Select a Time")
                }
                
                Text("Selected Time is \(birthTime.formatted(date: .omitted, time: .shortened))")
                    .padding(.all,10)
                    .background(Capsule().fill(.cyan))
                
                
                DatePicker("Enter your birthday", selection: $birthDateTime)
                    .datePickerStyle(.graphical)
                    .frame(maxHeight: 400)
                Text("Selected DateTime is \(birthDateTime.formatted(date: .long, time: .shortened))")
                    .padding(.all,10)
                    .background(Capsule().fill(.cyan))
                
                Text("Open Datepicker on button click")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .background(Capsule().fill(.green))
                
                ZStack {
                    DatePicker("", selection: $date, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                    SwiftUIWrapper {
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 32, height: 32, alignment: .topLeading)
                    }.allowsHitTesting(false)
                }.padding()
                
            }.padding()
        }
        
        
    }
    
    
}

struct SwiftUIWrapper<T: View>: UIViewControllerRepresentable {
    let content: () -> T
    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: content())
    }
    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {}
}

struct DateTimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimePickerView()
    }
}

