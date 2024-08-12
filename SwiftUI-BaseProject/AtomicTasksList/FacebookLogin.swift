//
//  FacebookLogin.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 22/07/22.
//

import SwiftUI
import FBSDKCoreKit
import FBSDKLoginKit

struct FacebookLogin: View {
    
    
    @AppStorage("logged") var logged = false
    @AppStorage("email") var email = ""
    @AppStorage("name") var name = ""
    @AppStorage("url") var profileUrl = ""
    
    
    @State var manager =  LoginManager()
    
    var body: some View {
        VStack{
            
            Button {
                if logged{
                    handleLogout()
                }else{
                    let loginPermissions = ["public_profile","email"]
                    manager.logIn(permissions: loginPermissions, from: nil) { result, err in
                        if result?.grantedPermissions == nil{
                            print("Permissions not granted")
                            print(err!.localizedDescription)
                            return
                        }
                        
                        if err != nil{
                            print("ERROR WHILE FB Login")
                            print(err!.localizedDescription)
                            return
                        }
                        
                        let graphRequestPermissions = ["fields":"id,name,picture.type(large), email"]
                        let request = GraphRequest(graphPath: "me", parameters: graphRequestPermissions)
                        request.start { _, res, err in
                            if err != nil{
                                print("ERROR WHILE FB Graph Request")
                                print(err!.localizedDescription)
                                return
                            }
                            logged = true
                            guard let profileData = res as? [String:Any] else {return}
                            print("ProfileData -> \(profileData)")
                            handleProfileData(profileData)
                        }
                    }
                }
            } label: {
                Text(logged ? "LogOut" : "Facebook Login")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .padding(.horizontal,35)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
            
            VStack(spacing:20){
                if profileUrl != "" {
                    ReusableAsyncImage(imageUrl: profileUrl)
                }
                Text(email)
                    .fontWeight(.bold)
                Text(name)
                    .fontWeight(.bold)
            }
            .padding()
            
        }
    }
    
    
    func handleProfileData(_ profileData:[String:Any]){
        let accessToken = AccessToken.current?.tokenString
        print("accessToken -> \(String(describing: accessToken))")
        if let email = profileData["email"] as? String{
            self.email = email
        }
        if let name = profileData["name"] as? String{
            self.name = name
        }
        if let fbId = profileData["id"] as? String{
            print("fbId  is -->>>",fbId)
        }
        if let fbpic = profileData["picture"] as? [String:Any],
           let data = fbpic["data"] as? [String:Any],
           let profilePicUrl = data["url"] as? String{
            print("profilePicUrl is -->>>",profilePicUrl)
            profileUrl = profilePicUrl
        }
    }
    
    func handleLogout(){
        manager.logOut()
        email = ""
        name = ""
        profileUrl = ""
        logged = false
    }
}

struct FacebookLogin_Previews: PreviewProvider {
    static var previews: some View {
        FacebookLogin()
    }
}
