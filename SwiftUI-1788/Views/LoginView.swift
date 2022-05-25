//
//  ContentView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 20.04.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    private let keyboardIsOnPublisher = Publishers.Merge (NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
        .map { _ in true }, NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in false }
    )
        .removeDuplicates()
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    @State private var showIncorrectCredentialsWarning: Bool = false
    
    @Binding var isUserLoggedIn: Bool
    
//    MARK: - метод вызова ALERT
    func verifyLoginData() {
        if (login.elementsEqual("111") && password.elementsEqual("222")) || (login.elementsEqual("bar") && password.elementsEqual("foo"))  {
            isUserLoggedIn = true
        } else {
            showIncorrectCredentialsWarning = true
        }
        password = ""
    }
    
    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                Image("backgroundflowers")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame( maxWidth: geometry.size.width,
                            maxHeight: geometry.size.height)
            }
            ScrollView(showsIndicators: false) {
                VStack {
                    if shouldShowLogo {
                        Text("VK")
                            .foregroundColor(.white)
//                            .font(.largeTitle)
                            .font(.system(size: 100))
                            .bold()
                            .padding(.top, 8)
                            .opacity(0.7)
                            .shadow(color: .black, radius: 3, x: -2, y: -2)
                    }
                    VStack {
                        HStack {
                            LabelForTextfield {
                                Text("login")
                            }
                            Spacer()
                            TextField("login", text: $login)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            LabelForTextfield {
                                Text("password")
                            }
                            Spacer()
                            SecureField("password", text: $password)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }.frame(maxWidth: 260)
                        .padding(.top, 50)
                    //                   MARK: - Button Log In
                    Button(action: verifyLoginData) {
                        Text("Log in")
                            .foregroundColor(.white)
                            .bold()
                            .fontWeight(.heavy)
                            .font(.title)
                    }
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                    .modifier(VisibilityStyle(hidden: (login.isEmpty || password.isEmpty)))

                }
//                .debug()
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    self.shouldShowLogo = !isKeyboardOn
                }
            }
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }.alert(isPresented: $showIncorrectCredentialsWarning) {
            Alert(title: Text("Error"), message: Text("Incorrect Login"))
        }
    }
    
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            LoginView(isUserLoggedIn: Binding<Any>)
//        }
//    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
