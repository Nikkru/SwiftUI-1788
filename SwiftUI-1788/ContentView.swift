//
//  ContentView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 20.04.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    private let keyboardIsOnPublisher = Publishers.Merge (NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
        .map { _ in true }, NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in false }
    )
        .removeDuplicates()
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    @State private var showIncorrectCredentialsWarning: Bool = false
    
//    MARK: - метод вызова ALERT
    func verifyLoginData() {
        if login.elementsEqual("111") && password.elementsEqual("222") {
            
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
                            .font(.largeTitle)
                            .padding(.top, 32)
                    }
                    VStack {
                        HStack {
                            Text("login:")
                                .frame(maxWidth: 150)
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .fill(.tertiary)
                                    .shadow(radius: 5)
                                )
                                .foregroundColor(.white)
                                .font(.title)
                            Spacer()
                            TextField("login", text: $login)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        //                        .border(Color.black)
                        HStack {
                            Text("password:")
                                .frame(maxWidth: 150)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.tertiary)
                                    .shadow(radius: 5)
                                )
                                .foregroundColor(.white)
                                .font(.title)
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
                    //                    .frame(maxWidth: 260)
                    //                    .modifier(CornerRadiusWithShadow(shadowColor: .blue, shadowRadius: 5, cornerRadius: 8))
                    .padding(.top, 50)
                    .padding(.bottom, 20)
//                    .disabled(login.isEmpty || password.isEmpty)
                    .modifier(VisibilityStyle(hidden: (login.isEmpty || password.isEmpty)))

                }
                .debug()
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
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
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
