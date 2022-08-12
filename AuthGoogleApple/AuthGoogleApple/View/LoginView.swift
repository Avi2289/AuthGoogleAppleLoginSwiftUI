//
//  LoginView.swift
//  AuthGoogleApple
//
//  Created by Apple on 07/08/22.
//

import SwiftUI
import Firebase
import GoogleSignIn


struct LoginView: View {
  
    @StateObject var signInViewModel : SignInViewModel = SignInViewModel()
    var body: some View {
        NavigationView {
            VStack{
                ZStack {
                    Group{
                        NavigationLink(destination: WelcomeView(), isActive: $signInViewModel.navNextscreen) {
                            
                        }
                    }
                Image("pencils")
                        .resizable()
                        //.scaledToFill()
                        .ignoresSafeArea(.all)
                       
                    VStack {
                       
                        VStack {
                            Text("Login")
                                .font(.title2)
                                .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            Spacer()
                            
                            CustomTextField(title: "Email", placeholderText: "Enter your email", isSecuredField: false,  text: $signInViewModel.emailEnter, isActive: $signInViewModel.isEmailSelected, onCommit: {
                                
                            })
                            CustomTextField(title: "Password", placeholderText: "Enter your password", isSecuredField: true, text: $signInViewModel.passwordEnter, isActive: $signInViewModel.isPasswordSelected, onCommit: {
                                
                            })
                            
                            
                            CommonButton(title: "login", disabled: false, backgroundColor: .green, foregroundColor: .white, cornerradius: 16, fontSizes: 12, action: {
                                self.handleLogin()
                            })
                            .padding(.vertical , 25)
                            
                            SocialMediaView(action: {
                                self.handleLogin()
                            })
                                .padding(.top , 30)
                        Spacer()
                        }
                        .padding(.horizontal)
                        
                        
                    }
                    .padding(.horizontal)
                }
             
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func handleLogin(){
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            
            return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: GetRootView()) { user, err in
            if let error = err {
                // ...
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result , err in
                if let error = err {
                    print(error.localizedDescription)
                    return
                }
                guard let user = result?.user else {
                    return
                }
                self.signInViewModel.navNextscreen = true
                print(user.displayName ?? "Success")
                
                
            }
            
        }
    }
   
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
