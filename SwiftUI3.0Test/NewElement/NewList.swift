//
//  NewList.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 08/06/21.
// Pull to refresh it's only available for list
// Search Bar it's only available when a view is embedded with a Navigaton View


import SwiftUI

struct NewList: View {
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    @State var users : [User] = []
    @State var searchText = ""
    var body: some View {
        NavigationView{
            if #available(iOS 15.0, *) {
                
                //                may be bug only working with for each...
                List{
                    ForEach(users){ user in
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.name)
                            Text(user.email)
                                .font(.caption)
                        }
//                    Row separator customization...
                        .listRowSeparatorTint(.red)
//                    Hiding Line...
                        .listRowSeparator(.hidden)
                    }
                }
                
                //            Adding Refresh Controll...
                //            Indicator will show untill async task finished...
                .refreshable(action: {
                    await FetchUsers()
                })
                //                Adding search bar
                //                Node only avaible with navigation view...
                .searchable("Search User ", text: $searchText, suggestions: {
                    //                    Suggestions...
                    //                    List of filtered content showed in a list format when search field is active
                    ForEach(users
                            
                                .filter{ user in
                        searchText == "" ? true :
                        user.email.lowercased().contains(searchText.lowercased())
                        
                    }
                    ){ user in
                        Text(user.email)
                        //                        we can even auto complete the text when its tapped...
                            .searchCompletion(user.name)
                    }
                })
                .navigationTitle("Pull to Refresh")
            } else {
                // Fallback on earlier versions
            }
        }
    }
    //    fetching user in async
    func FetchUsers() async{
        let session = URLSession(configuration: .default)
        do{
            if #available(iOS 15.0, *) {
                let task  = try await session.data(from: url)
                let user = try JSONDecoder().decode([User].self, from: task.0)
                self.users = user
            } else {
                // Fallback on earlier versions
            }
            //            decoding
            
            
        }catch{
            print("error")
        }
    }
}
struct User: Identifiable,Decodable{
    var id: Int
    var name: String
    var email: String
}
struct NewList_Previews: PreviewProvider {
    static var previews: some View {
        NewList()
    }
}
