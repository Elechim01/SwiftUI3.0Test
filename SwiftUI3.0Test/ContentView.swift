//
//  ContentView.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 08/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Text("Ciao")
            NewTextCustomizations()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
