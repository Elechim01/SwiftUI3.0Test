//
//  NewImageasync.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 08/06/21.
// Async Image, using Async Image we can fetch and display images from the internet
// using image Url
// material is the same as the UIVisualEffect view from the UI kit

import SwiftUI

struct NewImageasync: View {
    let url = URL(string: "https://www.monterosaskymarathon.com/wp-content/uploads/2018/06/AMA-5_dirtto.jpg")
    var body: some View {
        NavigationView{
            VStack{
                if #available(iOS 15.0, *) {
                    AsyncImage(url: url, scale: 1.0) { phase in
                        if let image = phase.image{
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .cornerRadius(10)
//                            Blur Effects
//                            AKA UIVisualEffet View...
//                            We can directly apply shaes in overlay or backgorunds...
                                .overlay(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                        }else{
//                            Error Ol Loaging...
                            Image(systemName: "house.fill")
                                .font(.largeTitle)
                                .foregroundColor(.yellow)
                        }
                    }
//                    there is not asoect ration working directly...
//                    only frame is working with embedded with clipped...
//                        .frame(width: 100, height: 100)
//                        .clipped()
//                    To  get origina dowloaded image...
                    
                } else {
                    // Fallback on earlier versions
                    Text("Ciao")
                }
            }
            .navigationTitle("Async Image")
        }
    }
}

struct NewImageasync_Previews: PreviewProvider {
    static var previews: some View {
        NewImageasync()
    }
}
