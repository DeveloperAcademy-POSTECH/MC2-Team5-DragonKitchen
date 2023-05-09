////
////  Progress.swift
////  DinoDina
////
////  Created by 박상원 on 2023/05/09.
////
//
//import SwiftUI
//
//struct Progress: View {
//    @Binding var value: Float
//    var body: some View {
//        GeometryReader{ proxy in
//            ZStack{
//                Rectangle().frame(width: proxy.size.width, height: proxy.size.height)
//                    .opacity(0.3)
//                    .foregroundColor(.teal)
//                Rectangle().frame(width: min(CGFloat))
//            }
//        }
//    }
//}
//struct TestView: View {
//    @State var progressValue: Float = 0.0
//    var body: some View {
//        VStack{
//            Progress()
//        }
//    }
//}
//struct Progress_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
