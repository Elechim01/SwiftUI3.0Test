//
//  NewSwipeAction.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 08/06/21.
// A Swipe Action is only avaiable for the list View, it performs certain actions when ListRow swipped in the desired direction

import SwiftUI

struct NewSwipeAction: View {
    var body: some View {
        if #available(iOS 15.0, *){
        List{
            ForEach(1...20, id: \.self){ index in
             Text("User Task \(index)")
//                Swipe actions
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            
                        } label: {
                            Image(systemName: "house.fill")
                        }
//                        Chaging bg color..
                        .tint(.red)
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape")
                        }
//                        Chaging bg color..
                        .tint(.blue)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            
                        } label: {
                            Image(systemName: "photo")
                        }
                        .tint(.yellow)
                    }
            }
        }
        }else{
            Text("Hola")
        }
    }
}

struct NewSwipeAction_Previews: PreviewProvider {
    static var previews: some View {
        NewSwipeAction()
    }
}
