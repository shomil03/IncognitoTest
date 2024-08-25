//
//  CircularTimerView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 23/08/24.
//

import SwiftUI

struct CircularTimerView: View {
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    @State var total : Double = 60
    @State var elapsed : Double = 0
    @Binding var viewmodel : ViewModel
    var width : CGFloat = 40
    var height : CGFloat = 40
    var image : String = "person.circle.fill"
        var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            //            Color(lightDark)
            //                .ignoresSafeArea()
            
            Circle()
                .frame(width: width, height: height)
                .foregroundStyle(
                    RadialGradient(colors: [Color(lightDark),Color(.white)], center: .center, startRadius: -10, endRadius: 100)
                )
            Arc(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: (360/(total / elapsed))))
                .fill(Color(.systemRed))
                .frame(width: width,height: height)
                .animation(.linear, value: elapsed)
                            .onReceive(timer){_ in
                                elapsed += 1
                            }
            Label("", systemImage: image)
                .labelsHidden()
                .offset(x: 5, y: -2)
            
        }
        .onAppear{
            print("bomber elapsed Time = \(elapsed)")
            if(elapsed < 0){
                total += abs(elapsed)
                elapsed = abs(elapsed)
            }
        }
    }
}

#Preview {
    CircularTimerView( viewmodel: .constant(ViewModel()))
}
