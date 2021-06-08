//
//  NewSubmit.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 08/06/21.
//On submit will fire the action block when  serach field or a Text Field is Submitted


import SwiftUI

struct NewSubmit: View {
    var body: some View {
        
        if #available(iOS 15.0, *){
        NavigationView{
            VStack{
                Text("OnTrigger...")
//                Also Be used with textfields....
                TextField("Type Here",text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .searchable(text: .constant(""))
            .navigationTitle("Home")
        }
        .onSubmit(of: [.search,.text]){
            print("filed submitted...")
        }
        }else{
            Text("Hola")
        }
    }
}

struct NewSubmit_Previews: PreviewProvider {
    static var previews: some View {
        NewSubmit()
    }
}
