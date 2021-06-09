//
//  NewForegroudStyles.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 09/06/21.
//

import SwiftUI

struct NewForegroudStyles: View {
    var body: some View {
//        Fore ground Style...
        if #available(iOS 15.0, *){
        VStack{
//           there are four foregorund styles avalable...
//            Diference id Just Opacity for each leel..
            Text("Steve")
                .foregroundStyle(.primary)
            Text("Tim")
                .foregroundStyle(.secondary)
            Text("Bill")
                .foregroundStyle(.tertiary)
            Text("iJustine")
                .foregroundStyle(.quaternary)
        }
//            we can chagne whole foregorund style colors....
        .foregroundStyle(.pink)
        }else{
            Text("")
        }
    }
}

struct NewForegroudStyles_Previews: PreviewProvider {
    static var previews: some View {
        NewForegroudStyles()
    }
}
