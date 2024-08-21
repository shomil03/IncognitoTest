//
//  ProfileView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 14/08/24.
//

import SwiftUI

struct ProfileView: View {
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    var total : Double = 30
    var elapsed : Double = 15
    @Binding var viewmodel : ViewModel
    var width : CGFloat = 40
    var height : CGFloat = 40
    var image : String = "person.circle.fill"
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
            Label("", systemImage: image)
                .labelsHidden()
                .offset(x: 5, y: -2)
                
        }
        .onTapGesture {
            viewmodel.isProfileViewTapped = true
//            viewmodel.isShowingSideMenu = true
        }
    }
}

struct Arc : Shape{
    var startAngle : Angle
    var endAngle : Angle
    func path(in rect: CGRect) -> Path {
        let modifiedStartAngle = startAngle - Angle(degrees: 90)
        let modifiedEndAngle = endAngle - Angle(degrees: 90)
        
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: min(rect.width , rect.height)/2, startAngle: modifiedStartAngle, endAngle: modifiedEndAngle, clockwise: false)
        path.closeSubpath()
        return path
    }
    
    
}

#Preview {
    ProfileView(viewmodel: .constant(ViewModel()))
}
