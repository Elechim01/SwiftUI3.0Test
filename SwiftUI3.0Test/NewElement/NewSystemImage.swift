//
//  NewSystemImage.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 09/06/21.
// System Image Rendeting Models & variant with Multi Color's

import SwiftUI

struct NewSystemImage: View {
    var body: some View {
        if #available(iOS 15.0, *){
            
//            We can also apply circle square variant in SwiftUI itself...
            VStack {
                Spacer()
                Image(systemName: "person")
                    .font(.system(size: 55))
                    .symbolVariant(.fill)
                
                Spacer()
                Image(systemName: "brain.head.profile")
                    .font(.largeTitle)
    //            for system rendering mode..
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.orange,.purple,.red)
                Spacer()
            }
            
            
     
        }
    }
}

struct NewSystemImage_Previews: PreviewProvider {
    static var previews: some View {
        NewSystemImage()
    }
}
