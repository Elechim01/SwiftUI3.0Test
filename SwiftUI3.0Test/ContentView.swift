//
//  ContentView.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 08/06/21.
// prova

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 15.0, *){
        ZStack {
            Text("Ciao")
            NewCoreLocationUI()
        }
            
        }else{
            Text("Hola")
        }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
