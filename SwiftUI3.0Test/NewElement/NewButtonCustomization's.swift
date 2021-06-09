//
//  NewButtonCustomization's.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 09/06/21.
//

import SwiftUI

struct NewButtonCustomization_s: View {
    @State var isOn = false
    var body: some View {
        if #available(iOS 15.0, *){
            NavigationView {
                //                New controll Group...
                VStack{
                    Button {
                        
                    } label: {
                        Text("iJustine")
                    }
                    .buttonStyle(.bordered)
                    //                Large size...
                    .controlSize(.small)
                    //                Higher Prominence...
                    .controlProminence(.increased)
                    //                Changig tint...
                    .tint(.purple)
                    //                toggle
                    Toggle(isOn: $isOn) {
                        Image(systemName: "star.fill")
                    }
                    //                Button Style...
                    .toggleStyle(.button)
                    //                also Can be changed controlsize...
                    .controlSize(.large)
                    .tint(.purple)
                    
                    
                }
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ControlGroup{
                            Button {
                                
                            } label: {
                                Image(systemName: "person")
                            }
                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape")
                            }
                        }
                        .controlGroupStyle(.navigation)
                    }
                }
            }
        }
    }
}

struct NewButtonCustomization_s_Previews: PreviewProvider {
    static var previews: some View {
        NewButtonCustomization_s()
    }
}
