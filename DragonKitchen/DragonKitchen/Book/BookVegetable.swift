//
//  BookMainView.swift
//  DinoDina
//
//  Created by David Goggins on 2023/05/04.
//

import SwiftUI

struct BookVegetable: View {
    let columns = [
        GridItem(.flexible(), spacing: 125),
        GridItem(.flexible(), spacing: 125),
        GridItem(.flexible(), spacing: 125),
        GridItem(.flexible(), spacing: 125)
    ]
    @State var isPresenting: Bool = false
    @State var selectedVegiName = ""
    @State var selectedVegiIllust = ""
    @State var selectedPictureName = "noPicture"

    var body: some View {
        NavigationView {
                VStack{
                    ScrollView(showsIndicators: false, content: {

                    HStack {
                        Text("야채")
                            .font(.system(size: 47, weight: .semibold))
                        Spacer()
                        NavigationLink(destination: MainView()){
                            Image("BackButton")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 64.42, height: 64.42, alignment: .center)
                                .foregroundColor(.blue)
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                        }
                    }
                    HStack {
                            VStack(alignment: .center){ // Collection Card
                                LazyVGrid(columns: columns, alignment: .leading) {
                                    ForEach(Vegetable.allVegetable, id: \.self) { vegi in
                                        ZStack {
                                            if vegi.picture != "noPicture" {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color(red: 65/255, green: 175/255, blue: 57/255, opacity: 0.15))
                                                    .overlay( // 뷰를 겹치게 하여 border 설정, 라운드 처리를 할 경우 overlay를 통해 border 처리를 해주어야 한다.
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 65/255, green: 175/255, blue: 57/255), lineWidth: 1.5)
                                                    )
                                                    .frame(width: 119, height: 140)
                                                    .padding(8)
                                                VStack {
                                                    Spacer()
                                                    Image(vegi.illust)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width:70, height: 70, alignment: .bottom)
                                                    Spacer()
                                                    Text(vegi.name)
                                                        .font(.system(size: 20))
                                                        .foregroundColor(.black)
                                                        .frame(width: 97, height: 31, alignment: .top)
                                                        .background(Color.white.opacity(0.75))
                                                        .cornerRadius(8)
                                                        .font(.subheadline)
                                                        .padding(16)
                                                }
                                            } else {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1.0))
                                                    .overlay( // 뷰를 겹치게 하여 border 설정, 라운드 처리를 할 경우 overlay를 통해 border 처리를 해주어야 한다.
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.25), lineWidth: 1.5)
                                                    )
                                                    .frame(width: 119, height: 140)
                                                    .padding(8)
                                                VStack {
                                                    Spacer()
                                                    Image(vegi.illust)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width:70, height: 70, alignment: .bottom)
                                                    Spacer()
                                                    Text(vegi.name)
                                                        .font(.system(size: 20))
                                                        .foregroundColor(.black)
                                                        .frame(width: 97, height: 31, alignment: .top)
                                                        .background(Color(red: 242/255, green: 242/255, blue: 242/255))
                                                        .cornerRadius(8)
                                                        .font(.subheadline)
                                                        .padding(16)
                                                }
                                            } // End: if
                                        } // End: ZStack
                                        .onTapGesture {
                                            print(type(of: Vegetable.allVegetable))
                                            selectedVegiName = vegi.name
//                                            selectedVegiIllust = Vegetable.allVegetable[VegetableNum.id-1].illust
////                                            Vegetable.allVegetable[8].picture = "name"
                                            selectedPictureName = vegi.picture
                                            if selectedPictureName != "noPicture" {
//                                                DispatchQueue.main.async {
                                                            isPresenting = true
//                                                }
                                            }
                                            print(vegi)
                                        }
                                    } // End: ForEach
                                }
                        } // End: VStack Collection Card

                        Spacer()
                        VStack() {
                            NavigationLink(destination: BookVegetable()){
                                Text("야채")
                                    .font(.system(size: 23, weight: .semibold))
                                    .foregroundColor(.black)
                                    .frame(width: 134, height: 42, alignment: .center)
                                    .background(Color(red: 65/255, green: 175/255, blue: 57/255))
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                            }
                            NavigationLink(destination: BookFruit()){
                                Text("과일")
                                    .font(.system(size: 23, weight: .semibold))
                                    .foregroundColor(.black)
                                    .frame(width: 134, height: 42, alignment: .center)
                                    .background(Color(red: 255/255, green: 186/255, blue: 0/255))
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                            }
                            NavigationLink(destination: BookMeat()){
                                Text("고기")
                                    .font(.system(size: 23, weight: .semibold))
                                    .foregroundColor(.black)
                                    .frame(width: 134, height: 42, alignment: .center)
                                    .background(Color(red: 226/255, green: 0/255, blue: 0/255))
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                            }
                            Spacer()
                        }// End VStack

                    } // End HStack
                    }) //End: ScrollView

                } // End: VStack
                .sheet(isPresented: $isPresenting){
                    Overlay(isPresenting: $isPresenting, selectedVegiIllust: $selectedVegiIllust, selectedVegiName: $selectedVegiName)
//                    VStack{
//                        Image(selectedVegiIllust)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                        HStack{
//                            Text("이엘이랑 \(selectedVegiName) 요리를 먹었어요!")
//                                .font(.title2)
//                            Image(systemName: "xmark") // 취소버튼
//                                .onTapGesture{
//                                    isPresenting = false
//                                }
//                        }
//                    } // ENd: VStack
                }
//                .padding(25)
        } //End: NavigationView
        .navigationBarBackButtonHidden()
    }
}

struct Overlay: View{
    @Binding var isPresenting: Bool
    @Binding var selectedVegiIllust: String
    @Binding var selectedVegiName: String
    var body: some View{
        VStack{
            Image(selectedVegiIllust)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                Text("이엘이랑 \(selectedVegiName) 요리를 먹었어요!")
                    .font(.title2)
                Image(systemName: "xmark") // 취소버튼
                    .onTapGesture{
                        isPresenting = false
                    }
            }
        } // ENd: VStack
    }
}
struct BookVegetable_Previews: PreviewProvider {
    static var previews: some View {
        BookVegetable()
    }
}

