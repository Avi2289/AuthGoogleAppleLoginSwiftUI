//
//  SignInViewModel.swift
//  Vegan Bowls
//
//  Created by differenz180 on 14/07/22.
//

import Foundation
import SwiftUI
import Firebase
import GoogleSignIn

//: MARK: -SignInViewModel



final class SignInViewModel: ObservableObject {
    
    
    @Published  var emailEnter : String = ""
    @Published  var passwordEnter : String = ""
    @Published  var isEmailSelected: Bool = false
    @Published  var isPasswordSelected: Bool = false
    @Published  var isEmailValid: Bool = true
    @Published  var isPasswordValid: Bool = true
    @Published var alertMessage : String = ""
    @Published var navNextscreen : Bool = false
    ///validation
 

    //MARK: - Validation Methods
    
  
}


extension View {
    func GetRootView() -> UIViewController {
        guard let screen  = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .init() }
        guard let rootView = screen.windows.first?.rootViewController else {
            return .init()
        }
        return rootView
    }
}
