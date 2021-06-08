//
//  SafeAreaInsect.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 08/06/21.
// Safe area insect a new view that is displayed above, bleow, leading or trailing of the contet view, making space formthe content view either horizontally or vertically

import SwiftUI

struct SafeAreaInsect: View {
    var body: some View {
        
        if #available(iOS 15.0, *){
            ScrollView(.horizontal){
            HStack(spacing: 18){
                ForEach(1...25,id : \.self){_ in
                    HStack{
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 45, height: 45)
                        VStack(alignment: .leading, spacing: 5){
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 15)
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 15)
                                .padding(.trailing,50)
                            
                        }
                    }
                }
            }
            .padding()
        }
        .safeAreaInset(edge: .leading) {
//            it will automatically padding for  the main content...
            Capsule()
                .fill(Color.red)
                .frame(width: 55)
                .padding(.horizontal)
        }
        }else{
            Text("Hola")
        }
    }
}

struct SafeAreaInsect_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaInsect()
    }
}
