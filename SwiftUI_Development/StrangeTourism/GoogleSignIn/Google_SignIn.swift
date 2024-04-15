//
//  Google_SignIn.swift
//  pmToolMobile
//
//  Created by Sachin on 16/08/23.
//

import SwiftUI
import Firebase
import GoogleSignIn


 class SignIn_withGoogle_VM: ObservableObject {
    @Published var isLoginSucessed = false
     @Published var signIn = false
     @Published var token:String=""
     
     func signInWithGoogle() {
        
       // get client ID
        guard let ClientId=FirebaseApp.app()?.options.clientID else{
            return
        }
        
        //Configuration Object
        let config = GIDConfiguration(clientID: ClientId)
        GIDSignIn.sharedInstance.configuration=config
        
        //SignIn Method
        GIDSignIn.sharedInstance.signIn(withPresenting: Application_utility.rootViewController){ user,error in
            if let error=error{
                print(error.localizedDescription)
                return
            }
            
            guard let user = user?.user,
                 let idToken = user.idToken else {
                return
                
            }
            
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken:idToken.tokenString,accessToken:accessToken.tokenString)
           
            Auth.auth().signIn(with: credential){ [self]
                res, erroe in
                if let error = error {
                    print("Errorr",error.localizedDescription)
                    return
                }
                guard let user = res?.user else{
                    self.isLoginSucessed=true
                    self.isLoginSucessed=true
                    return
                   
                    
                }
                token = idToken.tokenString  // This is the unique user ID
                print("Tokenn:", token)
                print("Userrrr",user.displayName)
                print("Userrrr",user.email)
                
                
                ViewModelFeeds().feedPosts(
                    token:"Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjlhNTE5MDc0NmU5M2JhZTI0OWIyYWE3YzJhYTRlMzA2M2UzNDFlYzciLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc3RyYW5nZS10b3VyaXNtIiwiYXVkIjoic3RyYW5nZS10b3VyaXNtIiwiYXV0aF90aW1lIjoxNjk2NDAwMjI2LCJ1c2VyX2lkIjoiblRYUTg3MzVhWWRQMHNNcVBzYWU0eE1hUG5UMiIsInN1YiI6Im5UWFE4NzM1YVlkUDBzTXFQc2FlNHhNYVBuVDIiLCJpYXQiOjE2OTY0NDE0MzQsImV4cCI6MTY5NjQ0NTAzNCwicGhvbmVfbnVtYmVyIjoiKzkxOTg3NjU0MzIxMCIsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsicGhvbmUiOlsiKzkxOTg3NjU0MzIxMCJdfSwic2lnbl9pbl9wcm92aWRlciI6InBob25lIn19.VR_3tg0dpVWGZfptg3vqjx7Z2TR-JQ9C_BXnnUzBkUpiQasI_7G5OHv0JsaqyXCzLox_liJAXKdOoKW6h_znZf9OnrWXq0tAJt-JQYyB0ygZVXwespg97Gs66JROu_0LvJlP5az5InvDS2ZMzEQDaMkMhCyRz5cxR_e8yQPOAZe3jaMMCm9TkeK5dNMQ8uAY_LuhHqS-XVR8V750yVSWSqzC6DS5oFEdztRhxxXnuRXJANnP9dbp5cgixNT4SC3vZMC0vtUpjgsg0Y7xi6jWxVLTlp8i86sGgpfm3S3orFiz1NDA_eDoYGHXxskyULUe3Xjtuy2bp58nfXGjOH44tQ"
                )
                
            }
        }
    }
    
}


