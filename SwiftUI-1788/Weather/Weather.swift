//
//  Weather.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 23.04.2022.
//

import SwiftUI

struct Weather: View {
    
    var body: some View {
        ZStack {
//            VStack {
                Text("Today is 23 april")
                    .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom]})
                    .alignmentGuide(HorizontalAlignment.center, computeValue:  { $0[.trailing]})
            WeatherImage {
                Image("sun")
            }
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                    .border(Color.green)
//                    .background(Circle().fill(Color.white).shadow(radius: 5))
//                    .modifier(CircelShadow(shadowColor: .blue, shadowRadius: 5))
                    .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom]})
                    .alignmentGuide(HorizontalAlignment.center, computeValue:  { $0[.leading]})
                Text("The Weather is perfect, 15C, no cloud, sunny, soft wind 3 m/s")
                    .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.top]})
                
//                VStack(alignment: .center,
//                       spacing: 0) {
//                    Text("Today is 23 april")
//                        .layoutPriority(1)
//                    Image("sun")
//                        .resizable()
//                        .frame(width: 100, height: 100)
//                    Text("The Weather is perfect, 15C, no cloud, sunny, soft wind 3 m/s")
//                        .multilineTextAlignment(.center)
//                        .fixedSize(horizontal: false,
//                                   vertical: true)
//                }
                //               .lineLimit(1)
                       .debug()
            }
//        }
    }
}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        Weather()
    }
}
//
//extension View {
//func debug() -> Self {
//print(Mirror(reflecting: self).subjectType)
//return self
//} }
