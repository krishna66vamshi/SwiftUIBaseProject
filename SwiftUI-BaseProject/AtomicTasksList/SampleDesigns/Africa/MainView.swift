//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com 
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            Picker("What is your favorite color?", selection: $selectedTab) {
                Text("Browse").tag(0)
                Text("Gallery").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal,50)
            
            if selectedTab == 0{
                AfricaContentView()
            }else{
                GridTab()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 12 Pro")
    }
}
