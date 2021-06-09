//
//  NewAppStorage.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 09/06/21.
// App Storage Raw Representale
//Using App Storage Raw representable now we can also store enum in the app storage

import SwiftUI

@available(iOS 15.0, *)
struct NewAppStorage: View {
    @AppStorage("deviceType") var device : Device?
    var body: some View {
        VStack{
            if let deviceType = device{
                Text(deviceType.rawValue)
            }
            Button {
                device = .iphone12
            } label: {
                Text("Select Iphone 12")
            }

        }
    }
}

//storing Enum in App Storage
enum Device: String{
    case iPhone8 = "8"
    case iphone11 = "11"
    case iphone12 = "12"
    
}
struct NewAppStorage_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            NewAppStorage()
        } else {
            // Fallback on earlier versions
        }
    }
}
