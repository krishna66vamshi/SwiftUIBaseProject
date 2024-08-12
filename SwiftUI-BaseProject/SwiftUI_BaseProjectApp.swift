//
//  SwiftUI_BaseProjectApp.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//

import SwiftUI
import FBSDKCoreKit

@main
struct SwiftUI_BaseProjectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
    var body: some Scene {
        WindowGroup {
//            NavigationView{
                ApplicationSwitcher()
                        .environment(\.managedObjectContext, CoreDataManager().container.viewContext)
//            BaseView(currentTab:"house")
//                .onOpenURL { url in
//                    ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
//                }
            
//            }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
           func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
               
               ApplicationDelegate.shared.application(
                   application,
                   didFinishLaunchingWithOptions: launchOptions
               )
                                
               
               return true
           }
           
           
           func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

               ApplicationDelegate.shared.application(
                   app,
                   open: url,
                   sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                   annotation: options[UIApplication.OpenURLOptionsKey.annotation]
               )
           }
       }
}

struct ApplicationSwitcher: View {

    var userName = UserDefaults.standard.object(forKey: "username") as? String ?? ""

    
    var body: some View {
        if (userName == "") {
            BaseView(currentTab:"house")
        } else {
            BaseView(currentTab:"bell")
        }
    }
}
