//
//  NewBadge.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 08/06/21.
// A badge can only be used in the Tab View. It Display's badge count on tab item

import SwiftUI

struct NewBadge: View {
    @State var heartbadgeSeen = false
    var body: some View {
        
        if #available(iOS 15.0, *) {
        
        TabView{
            Color.red
                .tabItem{
                    Image(systemName: "house.fill")
                }
//            Badges..
                .badge("10")
            
            Color.green
                .onAppear(perform: {
                    heartbadgeSeen = true
                })
                .tabItem{
                    Image(systemName: "suit.heart")
                }
//            String is showing Empty circle...
//            May be it will get updated...
//            But init is working...
                .badge(heartbadgeSeen ? "": "New")
            
            Color.yellow
                .tabItem{
                    Image(systemName: "gearshape")
                }
        }
        }else{
            Text("")
        }
    }
}

struct NewBadge_Previews: PreviewProvider {
    static var previews: some View {
        NewBadge()
    }
}
