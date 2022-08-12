//
//  CustomTextField.swift
//  Vegan Bowls
//
//  Created by differenz148 on 13/07/22.
//

import SwiftUI

struct CustomTextField: View {
 
    //MARK: - Variables
    var title: String = ""
    var placeholderText: String = ""
    var isSecuredField = false
    
   
    @Binding var text: String
    @Binding var isActive: Bool
    @State private var hidePass: Bool = true
    
  
    var onCommit: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8.0) {
            
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
            HStack {
                ZStack {
                    TextField(placeholderText, text: $text, onCommit: {
                        self.onCommit()
                        
                    })
                        .opacity((isSecuredField && hidePass) ? 0 : 1)
                        .font(.title2)
                    
                    SecureField(placeholderText, text: $text, onCommit: {
                        self.onCommit()
                    })
                        .opacity((isSecuredField && hidePass) ? 1 : 0)
                        .font(.title2)
                }
                .padding(.all, 16)
                .disableAutocorrection(true)
                .foregroundColor(Color.black)
                
                Spacer()
                
                //Eye icon button
                if isSecuredField == true
                {
                    if text != "" { 
                    Button (action: {
                        hidePass.toggle()
                    }) {
                       
                        Image(hidePass ? "ic_hide": "ic_unhide")
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32)
                            .padding(.trailing)
                    }
                    }
                }
                else{
                    if text != "" {
                        Button (action: {
                            self.text = ""
                        }) {
                            Image("ic_clear")
                                .frame(width: 32, height: 32)
                                .padding(.trailing)
                        }
                    }

                }
            }
//            .frame(width: 327)
            .frame(height: 54)
            .background(RoundedRectangle(cornerRadius: 16))
            .foregroundColor(Color.CustomColor.AppGreyColor)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isActive ? .green :  Color.clear, lineWidth: 1)
            )


        
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(title: "Email", placeholderText: "Enter your email", isSecuredField: false, text: .constant(""), isActive: .constant(false), onCommit: {})
    
    }
}


extension Color {
    struct CustomColor {
        static let AppBackgroundColor           = Color(#colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1))   //#DDDDDD
        static let AppBlackTextColor            = Color(#colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1))   //#212121
        static let AppGreyColor                 = Color(#colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1))   //#F5F5F5
        static let AppLightGreyColor            = Color(#colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1))
    }
}
