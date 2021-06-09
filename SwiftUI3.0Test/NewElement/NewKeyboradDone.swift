//
//  NewKeyboradDone.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 09/06/21.
// Keyboard 'Done' Alternative Instead of using the 'Done' button on the keyboard, we can add a custom button like 'Search','Go',etch..


import SwiftUI

struct NewKeyboradDone: View {
    var body: some View {
        if #available(iOS 15.0, *){
        TextField("iJustine",text: .constant(""))
            .textFieldStyle(.roundedBorder)
            .submitLabel(.search)
            .padding()
            
        }else{
            Text("")
        }
    }
}

struct NewKeyboradDone_Previews: PreviewProvider {
    static var previews: some View {
        NewKeyboradDone()
    }
}
