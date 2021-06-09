//
//  NewTimeline.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 09/06/21.
// New timeline View Updating View for periodic Event's with animations

import SwiftUI

struct NewTimeline: View {
    var body: some View {
        if #available(iOS 15.0, *){
//          Timeline View for updating view for any periodc events...
//          Or for any animations...
//            customization ....
            TimelineView(.animation(minimumInterval: 0.01, paused: false)) { timeLine in
//                using timeling we can get date...
//                Text(timeLine.date.formatted(date: .omitted,time: .shortened  ))
//                Mostly Used for animation..
                Text("\(CGFloat.random(in: 0...1000))")
                
            }
        } else{
            Text("Ciao")
        }
    }
}

struct NewTimeline_Previews: PreviewProvider {
    static var previews: some View {
        NewTimeline()
    }
}
