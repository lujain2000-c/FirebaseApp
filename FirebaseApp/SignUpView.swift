//
//  SignUpView.swift
//  FirebaseApp
//
//  Created by لجين إبراهيم الكنهل on 16/11/1444 AH.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct SignUpView: View {
    @State var email = ""
    @State var fullName = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var userIsAuth = false
    @State var tag : Int? = nil
    var body: some View {
        if userIsAuth{
            
        }else{
            content
        }
    }
    
    var content: some View {
        NavigationStack{
            
            ZStack {
                Color("Gray")
              
                    VStack{
                        Text("Sign up")
                            .bold()
                            .padding(.trailing,275)
                            .padding(.top,10)
                        
                        HStack{
                            Text("Hi,")
                            Text("Welcom!")
                                .foregroundColor(Color("Blue"))
                        }
                            .font(.largeTitle)
                            .bold()
                            .padding(.trailing,145)
                            .padding(.top)
                        Text("Please sign up to continue")
                            .font(.footnote)
                            .padding(.trailing,170)
                            .padding(.bottom,30)
                        ScrollView {
                            VStack(spacing: 15){
                                ZStack{
                                    Color(.white)
                                        .frame(width: 330,height: 55)
                                        .shadow(radius: 7)
                                   // Form{
                                    VStack(spacing: 5){
                                        Text("Full name")
                                            .font(.footnote)
                                            .bold()
                                            .padding(.trailing,260)
                                            .padding(.leading,10)
                                        TextField("Enter a Full name",text: $fullName)
                                            .textContentType(.username)
                                        //.keyboardType(.emailAddress)
                                            .foregroundColor(.gray)
                                            .font(.footnote)
                                        
                                            .foregroundColor(.gray)
                                            .padding(.leading,40)
                                    }//.padding(.leading,10)
                                }
                                ZStack{
                                    Color(.white)
                                        .frame(width: 330,height: 55)
                                        .shadow(radius: 7)
                                    
                                    VStack(spacing: 5){
                                        Text("Email")
                                            .font(.footnote)
                                            .bold()
                                            .padding(.trailing,290)
                                            .padding(.leading,10)
                                        TextField("Enter a Email",text: $email)
                                            .textContentType(.emailAddress)
                                        //.keyboardType(.emailAddress)
                                        //.font(.footnote)
                                            .foregroundColor(.gray)
                                            .padding(.leading,40)
                                        
                                    }//.padding(.leading,10)
                                }
                                
                                ZStack{
                                    Color(.white)
                                        .frame(width: 330,height: 55)
                                        .shadow(radius: 7)
                                    
                                    VStack(spacing: 5){
                                        Text("Password")
                                            .font(.footnote)
                                            .bold()
                                            .padding(.trailing,247)
                                        SecureField("Enter a password", text: $password)
                                            .textContentType(.password)
                                            .font(.footnote)
                                            .foregroundColor(.gray)
                                            .foregroundColor(.gray)
                                            .padding(.leading,40)
                                        
                                    }
                                }
                                
                                ZStack{
                                    Color(.white)
                                        .frame(width: 330,height: 55)
                                        .shadow(radius: 7)
                                    
                                    VStack(spacing: 5){
                                        Text("Confirm password")
                                            .font(.footnote)
                                            .bold()
                                            .padding(.trailing,190)
                                        SecureField( "Enter a Confirm password",text: $confirmPassword)
                                            .textContentType(.password)
                                            .font(.footnote)
                                            .foregroundColor(.gray)
                                        
                                            .foregroundColor(.gray)
                                            .padding(.leading,44)
                                    }
                                }
                                
                            }
                        }
                        ZStack{
                            Color("Blue")
                            
                                .frame(width: 100,height: 30)
                            HStack(spacing: 7){
                                Button("SIGN UP"){
                                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                                        if  error != nil {
                                            print(error!.localizedDescription)
                                            
                                        }
                                               
                                            //                                            if  password == "" || email == "" || fullName == "" || confirmPassword == "" || confirmPassword != password {
                                            //
                                            //                                                SignUpView()
                                            //
                                            //                                            }}else {
                                            //                                            ContentView()
                                            //                                        }
                                            //
                                            //                                    }
                                            //
                                        if  password == "" || email == "" || fullName == "" || confirmPassword == "" || confirmPassword != password {
                                            HapticManager.instance.impact (style: .heavy)
                                        }
                                        
                                    }
                                    // ...
                                }.font(.footnote)
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .frame(width: 10,height: 10)
                            }.foregroundColor(.white)
                                .bold()
                            
                        }.padding(.bottom,30)
                            .padding(.leading,240)
                        .foregroundColor(.white)
                        HStack{
                            Text("Already have account?")
                            NavigationLink("sign in", destination: LogInView())
                                .foregroundColor(Color("Blue"))
                        }.padding(.bottom,150)
                        
                            .onAppear(){
                                Auth.auth().addStateDidChangeListener { auth, user in
                                    if Auth.auth().currentUser != nil {
                                        userIsAuth.toggle()
                                        self.tag = 1
                                       
                                                     //  .NavigationLink(destination: ContentView(), tag: 1, selection: $tag) { /*this is where i'm getting my error*/
                                                       //    ContentView()
                                                       //}.disabled(true)
                                                   
                                      // ...
                                    } else {
                                       // content
                                    }
                                            }
                                
                                
                                            
                            }
                    }.padding(.top,150)
                
                
                //                            Text("You entered: \(password)")
            }.ignoresSafeArea()
        }
    }
            
        }
        
        
    
   
        
    

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


class HapticManager {
static let instance = HapticManager ()

func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
let generator = UIImpactFeedbackGenerator(style: style)
generator.impactOccurred()
}
}
