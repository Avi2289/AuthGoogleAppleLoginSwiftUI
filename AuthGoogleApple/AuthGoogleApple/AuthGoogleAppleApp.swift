//
//  AuthGoogleAppleApp.swift
//  AuthGoogleApple
//
//  Created by Apple on 07/08/22.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn




class AppDelegate: NSObject, UIApplicationDelegate {
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()


    return true
  }
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}


@main
struct AuthGoogleAppleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            
            RootView()
        .environmentObject(viewRouter)
        }
    }
}


struct RootView: View {
    
    @EnvironmentObject private var viewRouter: ViewRouter
    
    var body: some View {
      
        VStack {
            if viewRouter.currentView == .Login {
              LoginView()
               
            }  else if viewRouter.currentView == .WelcomeScreen {
               WelcomeView()
            }
        }
        .onAppear {
            if !(UserDefaults.isNotFirstTime) {
                viewRouter.currentView = .Login
            }
            else {
                viewRouter.currentView = .WelcomeScreen
        }
          
//                if let user = User.getCurrentUserFromDefault() {
//                    appInstance.currentUser = user
//                } else {
//                    viewRouter.currentView = .
//                }
            }
       
    }
}



class ViewRouter: ObservableObject {
//    static let shared = ViewRouter()
    @Published var currentView: AppView = .Login

   
}
enum AppView {
    case WelcomeScreen, Login
}


