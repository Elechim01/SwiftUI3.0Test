//
//  FocusedKeyboard.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 09/06/21.
// Focused Keyboard Begin/resing First Responder

import SwiftUI

@available(iOS 15.0, *)
struct FocusedKeyboard: View {
    @FocusState var showKeyBoard: Bool
    var body: some View {
        VStack {
            TextField("Type Here", text: .constant(""))
                .textFieldStyle(.roundedBorder)
                .padding()
    //        Openinf And Dismissing Keyboard
    //        Natively in swiftUI.....
            .focused($showKeyBoard)
            Text(showKeyBoard ? "Showing":"Hidden")
            Button {
                showKeyBoard.toggle() 
            } label: {
                Text("Toggle Keyboard")
            }

        }
        
    }
}

struct FocusedKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            FocusedKeyboard()
        } else {
            // Fallback on earlier versions
        }
    }
}
