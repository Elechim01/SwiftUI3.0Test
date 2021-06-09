//
//  NewCanvas.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 09/06/21.
// A canvas is used to draw using Graphics Context

import SwiftUI

struct NewCanvas: View {
    var body: some View {
        if #available(iOS 15.0, *){
        VStack{
//            We can draw using Graphics context...
//            from Core Graphics
            Canvas { context, size in
                context.draw(Text("Hello"),at: CGPoint(x: size.width/2, y: size.height/2))
                context.draw(Image(systemName: "house.fill"),at: CGPoint(x: size.width/1.8, y: size.height/1.5))
            }
            .frame(width: 300, height: 300)
            .background(Color.green,in: RoundedRectangle(cornerRadius: 15))
        }
        }else{
            Text("Ciao")
        }
    }
}

struct NewCanvas_Previews: PreviewProvider {
    static var previews: some View {
        NewCanvas()
    }
}
