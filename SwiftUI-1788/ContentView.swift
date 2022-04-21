//
//  ContentView.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 20.04.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge (NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
        .map { _ in true }, NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in false }
    ).removeDuplicates()
    
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
                .background(.tertiary)
                .foregroundColor(.white)
                .font(.title)
            Spacer()
            TextField("login", text: $login)
                .frame(maxWidth: 150)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        HStack {
            Text("password:")
                .frame(maxWidth: 150)
                .background(.tertiary)
                .foregroundColor(.white)
                .font(.title)
            Spacer()
            SecureField("password", text: $password)
                .frame(maxWidth: 150)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        }.frame(maxWidth: 260)
            .padding(.top, 50)
        Button(action: { print("Hello") }) {
            Text("Log in")
                .foregroundColor(.white)
                .bold()
                .fontWeight(.heavy)
                .font(.title)
        }
        .padding(.top, 50)
        .padding(.bottom, 20)
        .disabled(login.isEmpty || password.isEmpty)
    }
        }
        .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                self.shouldShowLogo = !isKeyboardOn
            }
        }
        }.onTapGesture {
            UIApplication.shared.endEditing()
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
