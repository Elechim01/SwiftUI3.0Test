//
//  NewBindings.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 09/06/21.
// Access to bindings for individual Elements within the collection..

import SwiftUI

struct NewBindings: View {
    @State var users : [User1] = [
        User1(username: "Michele"),
        User1(username: "Tim Cook"),
        User1(username: "Steve Jobs"),
        User1(username: "Linus"),
        User1(username: "Bill"),
    ]
    var body: some View {
        if #available(iOS 15.0, *){
        List{
//            Now in SwiftUI we can easily get Binding for items in Collection...
//            By usign $
            ForEach($users){ $user in
                TextField("Edit Name",text: $user.username)
            }
        }
        }else{
            Text("")
        }
    }
}
//Sample Model...
struct User1: Identifiable{
    var id = UUID().uuidString
    var username : String
}

struct NewBindings_Previews: PreviewProvider {
    static var previews: some View {
        NewBindings()
    }
}
