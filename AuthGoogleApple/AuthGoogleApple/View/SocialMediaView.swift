//
//  orWithGoogleAppleCstomView.swift
//  Vegan Bowls
//
//  Created by differenz180 on 14/07/22.
//

import SwiftUI

struct SocialMediaView: View {
    var action : () -> Void
    var body: some View {
        VStack{
            HStack(spacing : 16){
                Rectangle()
                    .fill(.white)
                    .frame(height : 1)
                Text("Or With".uppercased())
                    .font( .title3)
                
                Rectangle()
                    .fill(.white)
                    .frame(height : 1)
            }
            
            HStack(spacing :20) {
                customButtonwithImage(text: "Google", imageName: "ic_google", action: {
                    print("Google Button Tap")
                    action()
                })
                
                customButtonwithImage(text: "Apple", imageName: "ic_apple", action: {
                    print("Google Button Tap")
                })
                
            }
            .padding(.top , 24)
        }
    }
}
struct orWithGoogleAppleCstomView_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaView(action: {})
            .previewDevice("iPhonr SE (2nd generation)")
    }
}

struct customButtonwithImage: View {
    
    //MARK: Variables
    @State var text: String
    @State var imageName : String
    
    var action : (() -> Void)
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack(alignment: .center, spacing: 5.0) {
                Image(imageName)
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                Text(text)
                    .font(.title3)
                    
                    .foregroundColor(.black)
                    .padding(.vertical , 16)
            }
        }
        .frame(maxWidth : .infinity)
        .background(Color.CustomColor.AppGreyColor)
        .cornerRadius(16)
    }
}
