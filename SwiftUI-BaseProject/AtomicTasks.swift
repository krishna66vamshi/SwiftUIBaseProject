//
//  AtomicTasks.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//

import SwiftUI

struct AtomicTasks: View {
    
    @Binding var showMenu:Bool

    @State private var isShowingFileManager:Bool = false
    @State private var isShowingfblogin:Bool = false
    @State private var isShowingAPIListView = false
    @State private var isShowingDateTimeView = false
    @State private var isShowingSingleImageView = false
    @State private var isShowingMultipleImageView = false
    @State private var isShowingCustomPickerView = false
    @State private var isShowingAfrica = false
    @State private var isShowingHungryHub = false
    @State private var isShowingPushPresent = false
    @State private var isShowingBMIView = false
    @State private var isShowingSampleProfileView = false
    @State private var isShowingDarkLightView = false
    @State private var isShowingGOBTView = false
    @State private var isShowingAlertView = false
    @State private var isShowingMiscellaneous = false
    @State private var isShowingViewModifiers = false
    @State private var isShowingDocumentPicker = false
    @State private var isShowingCountryPicker = false
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment:.leading,spacing: 30){
                    pickersGroup
                    designsGroup
                    miscelleneousGroup
                }.frame(maxWidth: .infinity)
            }
            .padding(.vertical,25)
            .navigationTitle("Atomic Tasks")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    withAnimation {
                        showMenu.toggle()
                    }
                } label: {
                    Text("Show Menu")
                }
                }
            }
        }
    }
    
    var miscelleneousGroup:some View{
        Group{
            NavigationLink(destination: FacebookLogin(), isActive: $isShowingfblogin) {
                CapsuleButton(text: "Facebook Login",backgroundColor: .blue,textColor: .white) {
                    self.isShowingfblogin.toggle()
                }
            }
            
            NavigationLink(destination: PushPresent(), isActive: $isShowingPushPresent) {
                CapsuleButton(text: "Push Present",backgroundColor: .black,textColor: .white) {
                    self.isShowingPushPresent.toggle()
                }
            }
            
            NavigationLink(destination: FileManagerView(), isActive: $isShowingFileManager) {
                CapsuleButton(text: "File Manager",backgroundColor: .orange,textColor: .black) {
                    self.isShowingFileManager.toggle()
                }
            }
            
            NavigationLink(destination: Miscellaneous(), isActive: $isShowingMiscellaneous) {
                CapsuleButton(text: "Miscellaneous",backgroundColor: .blue,textColor: .black) {
                    self.isShowingMiscellaneous.toggle()
                }
            }
            NavigationLink(destination: DarkLightMode(), isActive: $isShowingDarkLightView) {
                CapsuleButton(text: "Dark Light Mode",backgroundColor: .cyan,textColor: .black) {
                    self.isShowingDarkLightView.toggle()
                }
            }
            NavigationLink(destination: ViewModifiers(), isActive: $isShowingViewModifiers) {
                CapsuleButton(text: "View Modifiers",backgroundColor: .orange,textColor: .black) {
                    self.isShowingViewModifiers.toggle()
                }
            }
        }
    }
    
    var pickersGroup:some View{
        Group{
            NavigationLink(destination: APIListView(), isActive: $isShowingAPIListView) {
                CapsuleButton(text: "API ListView",backgroundColor: .pink,textColor: .black) {
                    self.isShowingAPIListView.toggle()
                }
            }
            
            NavigationLink(destination: DateTimePickerView(), isActive: $isShowingDateTimeView) {
                CapsuleButton(text: "Date Time Picker View",backgroundColor: .red,textColor: .black) {
                    self.isShowingDateTimeView.toggle()
                }
            }
            
            NavigationLink(destination: SingleImagePicker(), isActive: $isShowingSingleImageView) {
                CapsuleButton(text: "Single Image Picker",backgroundColor: .cyan,textColor: .black) {
                    self.isShowingSingleImageView.toggle()
                }
            }
            
            NavigationLink(destination: MultiplePhotoPicker_View(), isActive: $isShowingMultipleImageView) {
                CapsuleButton(text: "Multiple Image Picker",backgroundColor: .cyan,textColor: .black) {
                    self.isShowingMultipleImageView.toggle()
                }
            }
            
            NavigationLink(destination: CustomPicker(), isActive: $isShowingCustomPickerView) {
                CapsuleButton(text: "Custom Picker",backgroundColor: .cyan,textColor: .black) {
                    self.isShowingCustomPickerView.toggle()
                }
                
            }
            
            NavigationLink(destination: AlertActionSheet(), isActive: $isShowingAlertView) {
                CapsuleButton(text: "Alert Action Sheet",backgroundColor: .yellow,textColor: .black) {
                    self.isShowingAlertView.toggle()
                }
            }
            
            NavigationLink(destination: MyCountryPicker(), isActive: $isShowingCountryPicker) {
                CapsuleButton(text: "Country Picker",backgroundColor: .orange,textColor: .black) {
                    self.isShowingCountryPicker.toggle()
                }
            }
            
            NavigationLink(destination: DocumentPicker(), isActive: $isShowingDocumentPicker) {
                CapsuleButton(text: "Document Picker",backgroundColor: .blue,textColor: .black) {
                    self.isShowingDocumentPicker.toggle()
                }
            }
        }
    }
    
    var designsGroup:some View{
        Group{
            
            NavigationLink(destination: MainView(), isActive: $isShowingAfrica) {
                CapsuleButton(text: "Africa Designs",backgroundColor: .pink,textColor: .black) {
                    self.isShowingAfrica.toggle()
                }
            }
            
            NavigationLink(destination: HungryHub(), isActive: $isShowingHungryHub) {
                CapsuleButton(text: "Hungry Hub",backgroundColor: .pink,textColor: .black) {
                    self.isShowingHungryHub.toggle()
                }
            }
            
            NavigationLink(destination: GOBTSummaryScreen(), isActive: $isShowingGOBTView) {
                CapsuleButton(text: "Go-BT Summary Screen",backgroundColor: .blue,textColor: .black) {
                    self.isShowingGOBTView.toggle()
                }
            }
            NavigationLink(destination: BMICalcDesigns(), isActive: $isShowingBMIView) {
                CapsuleButton(text: "BMI Calc Designs",backgroundColor: .green,textColor: .black) {
                    self.isShowingBMIView.toggle()
                }
            }
            
            NavigationLink(destination: SampleProfileScreen(), isActive: $isShowingSampleProfileView) {
                CapsuleButton(text: "Sample Profile Screen",backgroundColor: .orange,textColor: .black) {
                    self.isShowingSampleProfileView.toggle()
                }
            }
        }
    }
}


struct AtomicTasks_Previews: PreviewProvider {
    static var previews: some View {
        AtomicTasks(showMenu: .constant(false))
    }
}
