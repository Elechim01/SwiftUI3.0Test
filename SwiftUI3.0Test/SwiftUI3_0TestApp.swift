//
//  SwiftUI3_0TestApp.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 08/06/21.
//

import SwiftUI
import Firebase

@main
struct SwiftUI3_0TestApp: App {
//    if you want to just intialize firebase..
//    then use this method...
//    else use delegate asaptor
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
