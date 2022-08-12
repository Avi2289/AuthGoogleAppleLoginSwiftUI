//
//  CommonButton.swift
//  AuthGoogleApple
//
//  Created by Apple on 07/08/22.
//

import SwiftUI

struct CommonButtonStyle: ButtonStyle {

    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    var cornerRadius : CGFloat = 16
    var fontsize : CGFloat =  16
  
    func makeBody(configuration: Self.Configuration) -> some View {

        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(currentForegroundColor, lineWidth: 1)
            )
            .font(.title2)
    }
}

struct CommonButton: View {
    private static let buttonHorizontalMargins: CGFloat = 20
    var backgroundColor: Color =  .blue
    var foregroundColor: Color = Color.white
    var cornerRadius : CGFloat = 16
    var fontsize : CGFloat =  16
  
    private let title: String
    private let action: () -> Void
    private let disabled: Bool
    
    init(title: String,
         disabled: Bool = false,
         backgroundColor: Color =  .blue ,
         foregroundColor: Color = Color.white,
         cornerradius:CGFloat = 16,
         fontSizes : CGFloat =  16,
       
         action: @escaping () -> Void) {
        
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.action = action
        self.disabled = disabled
        self.cornerRadius = cornerradius
        self.fontsize = fontSizes
      
    }
    
    var body: some View {
        
        HStack {
            
            Button(action:self.action) {
                Text(self.title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(maxWidth:.infinity)
            }
            .buttonStyle(CommonButtonStyle(backgroundColor: backgroundColor, foregroundColor: foregroundColor, isDisabled: disabled, cornerRadius: cornerRadius, fontsize: fontsize))
            .disabled(self.disabled)
            
        }
        .frame(maxWidth:.infinity)
    }
}


