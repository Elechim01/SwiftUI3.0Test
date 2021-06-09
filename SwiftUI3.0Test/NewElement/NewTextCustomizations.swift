//
//  NewTextCustomizations.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 09/06/21.
//

import SwiftUI

struct NewTextCustomizations: View {
    var body: some View {
        if #available(iOS 15.0, *){
            VStack{
//                Text Customization..
//                1.Mark Down.... **text**
//                2.italic.... ***text***
//                3.links... """text"""
                Text("""
                     Hello ***iJustine***
                     Subsribe to
                     [Michele](https://www.youtube.com/channel/UChFlufDTnOl_LPYHAEZ5EPQ)
                     """)
//                Custom formatter For Date..
                Text(Date().formatted(date: .abbreviated, time: .standard))
                    
                
            }
        }
    }
}

struct NewTextCustomizations_Previews: PreviewProvider {
    static var previews: some View {
        NewTextCustomizations()
    }
}
