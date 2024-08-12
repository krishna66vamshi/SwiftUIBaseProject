//
//  AlertActionSheet.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//

import SwiftUI
import ExytePopupView

struct AlertActionSheet: View {
    @State var showingPopup = false
    
    @State private var isPresent = false
    @State private var showingOptions = false
    @State private var showingBelowiOS15Options = false
    
    @State private var selection = "None"
    
    @State private var userName = UserDefaults.standard.object(forKey: "username") as? String ?? ""
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    
    var body: some View {
        VStack(spacing:20) {
            CapsuleButton(text: "Show Alert",backgroundColor: .black,textColor: .white) {
                self.isPresent.toggle()
            }
            //            .alert("Important message", isPresented: $isPresent) {
            //                Button("First") { }
            //                Button("Second") { }
            //                Button("Third") { }
            //            }
            .alert(isPresented: $isPresent, content: {
                Alert(
                    title: Text("Unable to Save Workout Data"),
                    message: Text("The connection to the server was lost."),
                    primaryButton: .default(
                        Text("Try Again"),
                        action: {
                            print("Try Again Click")
                        }
                    ),
                    secondaryButton: .destructive(
                        Text("Delete"),
                        action: {
                            print("Delete Click")
                        }
                    )
                )
            })
            
            CapsuleButton(text: "Show Action Sheet using iOS15 code",backgroundColor: .red,textColor: .black) {
                self.showingOptions.toggle()
            }.confirmationDialog("Select a color", isPresented: $showingOptions, titleVisibility: .visible) {
                ForEach(["Red", "Green", "Blue"], id: \.self) { color in
                    Button(color) {
                        selection = color
                    }
                }
            }
            
            CapsuleButton(text: "Show Action Sheet using below iOS15 code",backgroundColor: .green,textColor: .black) {
                self.showingBelowiOS15Options.toggle()
            }
            .actionSheet(isPresented: $showingBelowiOS15Options) {
                ActionSheet(
                    title: Text("Select a color"),
                    buttons: [
                        .default(Text("Red")) {
                            selection = "Red"
                        },
                        .default(Text("Green")) {
                            selection = "Green"
                        },
                        .default(Text("Blue")) {
                            selection = "Blue"
                        },
                        .cancel({
                            
                        })
                    ]
                )
            }
            
            CapsuleButton(text: "Open Share Sheet",backgroundColor: .green,textColor: .black) {
                guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
                let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
                UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
            }
          
            Group{
                CapsuleButton(text: "Show Toast",backgroundColor: .red,textColor: .black) {
                    showingPopup.toggle()
                }
                
                DisclosureGroup("Items", isExpanded: $topExpanded) {
                    Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
                    Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
                    DisclosureGroup("Sub-items") {
                        Text("Sub-item 1")
                    }
                }.padding()
            }
            
            Form {
                Section(header: Text("PROFILE")) {
                    TextField("Enter Username", text: $userName)
                    CapsuleButton(text: "Save username",backgroundColor: .green,textColor: .black) {
                        UserDefaults.standard.set(userName, forKey: "username")
                    }
                    Button("Tap count: \(tapCount)") {
                        tapCount += 1
                        UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                    }
                }
            }
            
           
            
        }
        .popup(isPresented: $showingPopup, type: .floater(verticalPadding: 50, useSafeAreaInset: true), position: .bottom, animation: .easeInOut, autohideIn: 3, dragToDismiss: true, closeOnTap: true, closeOnTapOutside: false, dismissCallback: {
            print("Toast dismiss CallBack called")
        }, view: {
           ReusableToast()
        })
    }
    
    
    @State private var toggleStates = ToggleStates()
    @State private var topExpanded: Bool = true

}

struct AlertActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        AlertActionSheet()
    }
}

struct ToggleStates {
    var oneIsOn: Bool = false
    var twoIsOn: Bool = true
}
