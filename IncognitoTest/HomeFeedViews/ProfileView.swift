//
//  ProfileView.swift
//  IncognitoTest
//
//  Created by Shomil Singh on 14/08/24.
//

import SwiftUI

struct ProfileView: View {
    var lightDark = Color(red: 32/255, green: 32/255, blue: 32/255)
    var body: some View {
        ZStack{
//            Color(lightDark)
//                .ignoresSafeArea()
            
            Circle()
                .frame(width: 40, height: 40)
                .foregroundStyle(
                    RadialGradient(colors: [Color(lightDark),Color(.white)], center: .center, startRadius: -10, endRadius: 100)
                )
            Arc(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90))
                .fill(Color(.systemRed))
                .frame(width: 40,height: 40)
            Label("", systemImage: "person.circle.fill")
                .labelsHidden()
                .offset(x: 5, y: -2)
                
        }
    }
}

struct Arc : Shape{
    var startAngle : Angle
    var endAngle : Angle
    func path(in rect: CGRect) -> Path {
        var modifiedStartAngle = startAngle - Angle(degrees: 90)
        var modifiedEndAngle = endAngle - Angle(degrees: 90)
        
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: min(rect.width , rect.height)/2, startAngle: modifiedStartAngle, endAngle: modifiedEndAngle, clockwise: false)
        path.closeSubpath()
        return path
    }
    
    
}

#Preview {
    ProfileView()
}
