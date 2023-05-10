//
//  BounceAnimationView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/08.
//

import SwiftUI

// struct BounceAnimationView: View {
//    @State var test = false
//    @Namespace private var smooth
//    var body: some View {
//        VStack {
//            Rectangle()
//                .frame(width: 200, height: test ? 300 : 200)
//                .offset(y: test ? 0 : -UIScreen.height*1.8)
//                .matchedGeometryEffect(id: "morph", in: smooth)
//            Button(action: {
//                withAnimation(.interpolatingSpring(mass: 1, stiffness: 200, damping: 10, initialVelocity: 0.9)) {
//                    self.test.toggle()}
//            }) {
//                Text("Animate")
//            }
//        }
//    }
// }
//
// struct BounceAnimationView_Previews: PreviewProvider {
//    static var previews: some View {
//        BounceAnimationView()
//    }
// }

import SwiftUI

struct PhotoZoom: View {
    @State private var zoomed = false
    @Namespace private var smooth
    @State var heights: CGFloat = 200
    var body: some View {
        VStack {
            if !zoomed {
                ZStack {
                    Image("paprika")
                        .resizable()
                        .matchedGeometryEffect(id: "morph", in: smooth)
//                        .frame(height: heights)
                        .offset(y: zoomed ? 0 : -UIScreen.height * 1.8)
                }
            } else {
                ZStack {
                    Image("paprika")
                        .resizable()
                        .matchedGeometryEffect(id: "morph", in: smooth)
                        .scaledToFit()
                        .frame(height: heights)
                        .offset(y: zoomed ? 0 : -UIScreen.height * 1.8)
                }
            }
            Text("tap!")
                .onTapGesture {
                    withAnimation(
                        .interpolatingSpring(mass: 1, stiffness: 200, damping: 15, initialVelocity: 0)
                    ) {
                        zoomed.toggle()
                        //                        heights = 300
                    }
                }
        }
    }
}

struct PhotoZoom_Previews: PreviewProvider {
    static var previews: some View {
        PhotoZoom()
    }
}
