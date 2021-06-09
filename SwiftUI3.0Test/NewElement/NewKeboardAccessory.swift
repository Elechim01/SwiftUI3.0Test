//
//  NewKeboardAccessory.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 09/06/21.
//

import SwiftUI

struct NewKeboardAccessory: View {
    var body: some View {
        if #available(iOS 15.0, *){
            NavigationView{
                VStack {
                    TextField("Type here",text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                        .padding()
                }
                .navigationTitle("Home")
                //            Keboard Accessory View...
                .toolbar(content: {
                    ToolbarItem(placement: .keyboard) {
                        HStack{
                            Button {
                                
                            } label: {
                                Image(systemName: "person")
                                    .foregroundColor(.red)
                            }
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack(spacing:15){
                                    ForEach(1...30,id:\.self){_ in
//                                        Dont' know its Bur or Not...
//                                        But it accpets only button..
//                                        Circle()
//                                            .fill()
//                                            .frame(width: 40, height: 40)
                                         Button {
                                            
                                        } label: {
                                            Circle()
                                                .fill()
                                                .frame(width: 40, height: 40)
                                        }

                                    }
                                }
                            }
                            
                        }
                    }
                })
                
            }
        }else{
            Text("Hola")
        }
    }
}

struct NewKeboardAccessory_Previews: PreviewProvider {
    static var previews: some View {
        NewKeboardAccessory()
    }
}
