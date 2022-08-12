//
//  WelcomeView.swift
//  AuthGoogleApple
//
//  Created by Apple on 07/08/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
           Image("galaxyImg")
                .resizable()
                .ignoresSafeArea()
            Button {
                
            } label: {
                Text("Logout")
                    .onTapGesture {
                        
                    }
            }

            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            UserDefaults.isNotFirstTime = true
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
