//
//  NewSheetDismiss.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 08/06/21.
// Customization For Sheet Dismiss
// untull IOS 14 a Sheet can also be dismissed when it is swiped down, whereas here we can avoid that by using InteractiveDismissDisable

import SwiftUI

struct NewSheetDismiss: View {
    @State var show = false
    var body: some View {
        if #available(iOS 15.0, *){
        VStack{
            Button("show Sheet"){
                show.toggle()
            }
        }
        .sheet(isPresented: $show){
            Text("I'm sheet View....")
//            Disabiling Gestire Dismiss..
//            Note use this in sheet Content...
                .interactiveDismissDisabled(true)
        }
        }else{
            Text("hola")
        }
    }
}

struct NewSheetDismiss_Previews: PreviewProvider {
    static var previews: some View {
        NewSheetDismiss()
    }
}
