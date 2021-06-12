//
//  NewAsyncFirebase.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 10/06/21.
// Adding Sample User For Email Login & Samle Data
//Old Completition Handler Method

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct NewAsyncFirebase: View {
//    Users
    @State var users : [Utenti] = []
//    Error
    @State var errorMsg = ""
    @State var showError = false
    var body: some View {
        if #available(iOS 15.0, *){
        NavigationView{
            List{
                ForEach(users){ user in
                    HStack(alignment: .top,spacing: 15){
                        AsyncImage(url: URL(string: user.imageUrl)){ phase in
                            if let image = phase.image{
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(12)
                            }else{
                                ProgressView()
                                    .frame(maxHeight: .infinity, alignment: .center)
                            }
                        }
                        VStack(alignment: .leading, spacing: 6) {
                            Text(user.username)
                                .font(.title2.bold())
                            Text("Apple Sheep")
                        }
                    }
                }
            }
            .navigationTitle("async/await")
//            Pull to refresh..
            .refreshable {
                await fetchData(email: "michele@apple.com", password: "12345678")
            }
//            Alert..
            .alert(errorMsg,isPresented: $showError){
                Button("Close",role: .cancel){
                    
                }
            }
        }
        }else{
            Text("Hola")
        }
    }
//    Fetching Data using Old completion Hanlder method...
//    I Already wrote Function for that
//    Just Copyng Those....
    
////    This will sign in and return UID for user...
//    func authUser(email: String, password: String , completition: @escaping (Result<String,AuthError>)->()){
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//            if let _ = error{
//                completition(.failure(.falliedToLogin))
//                return
//            }
//            guard let user = result else{
//                completition(.failure(.falliedToLogin))
//                return
//            }
//            completition(.success(user.user.uid))
//        }
//    }
////    This will return User Data From Firebase...
//    func fetchUserData(userID : String, completion : @escaping(Result<[Utenti],DatabaseError>)-> ()){
//        Firestore.firestore().collection("User").document(userID).getDocument { snap, error in
//            if let _ = error{
//                completion(.failure(.failed))
//                return
//            }
//            guard let userData = try? snap?.data(as: Utenti.self)else{
//                completion(.failure(.failed))
//                return
//            }
//            completion(.success([userData]))
//        }
//    }
////    this will use those to get and set data...
//    func fetchData(){
//        authUser(email: "michele@apple.com", password: "12345678") { result in
//            switch result{
//            case .success(let userID):
//                print("🤖\(userID)")
//                fetchUserData(userID: "3MIXqTg6RctjBLIMk2Vp") { result in
//                    switch result{
//                    case .success(let user):
//                        self.users = user
//                    case .failure(let error):
//                        self.errorMsg = error.rawValue
//                        self.showError.toggle()
//                    }
//                }
//            case .failure(let error):
//                self.errorMsg = error.rawValue
//                self.showError.toggle()
//
//            default: break
//            }
//
//        }
//    }
    
    
//    ------------------------------------------
//    New Asyc/await Mthod..
    func fetchData(email: String, password: String)async{
//        That's all simple...
        do{
//            Auth..
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            let userID = authResult.user.uid
//            Getting User data...
            let doc = try await Firestore.firestore().collection("User").document(userID).getDocument().data(as: Utenti.self)
            guard let userData = doc else {
//                else throwing Erro...
                throw DatabaseError.failed
            }
//            Adding Data......
            self.users = [userData]
            
            
        }catch{
            errorMsg = error.localizedDescription
            showError.toggle()
        }
    }
    
    
}

struct NewAsyncFirebase_Previews: PreviewProvider {
    static var previews: some View {
        NewAsyncFirebase()
    }
}
//Error type
enum DatabaseError: String,Error{
    case failed = "Fallied to Fetch From Database"
}
enum AuthError : String,Error{
    case falliedToLogin = "Falied to Login"
}

//use Struct...

struct Utenti : Identifiable,Codable{
    var id = UUID().uuidString
    var imageUrl : String
    var username : String
    
    enum CodingKeys : String,CodingKey{
        case imageUrl
        case username
    }
}




