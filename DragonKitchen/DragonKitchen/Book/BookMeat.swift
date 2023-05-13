//
//  BookMeat.swift
//  DragonKitchen
//
//  Created by David Goggins on 2023/05/04.
//

import SwiftUI

struct BookMeat: View {
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
                        Text("고기")
                            .font(.system(size: 47, weight: .semibold))

                        Spacer()

                        NavigationLink(destination: MainView()) {
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
                        VStack(alignment: .center) {
                            LazyVGrid(columns: columns, alignment: .leading) {
                                ForEach(Ingredient.meats, id: \.self) { meat in
                                    ZStack {
                                        if meat.picture != "noPicture" {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color(red: 226/255, green: 0/255, blue: 0/255, opacity: 0.15))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color(red: 226/255, green: 0/255, blue: 0/255), lineWidth: 1.5)
                                                )
                                                .frame(width: 119, height: 140)
                                                .padding(8)
                                            VStack {
                                                Spacer()

                                                Image(meat.illust)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width:70, height: 70, alignment: .bottom)

                                                Spacer()

                                                Text(meat.name)
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
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.25), lineWidth: 1.5)
                                                )
                                                .frame(width: 119, height: 140)
                                                .padding(8)
                                            VStack {
                                                Spacer()

                                                Image(meat.illust)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width:70, height: 70, alignment: .bottom)

                                                Spacer()

                                                Text(meat.name)
                                                    .font(.system(size: 20))
                                                    .foregroundColor(.black)
                                                    .frame(width: 97, height: 31, alignment: .top)
                                                    .background(Color(red: 242/255, green: 242/255, blue: 242/255))
                                                    .cornerRadius(8)
                                                    .font(.subheadline)
                                                    .padding(16)
                                            }
                                        }
                                    }
                                    .onTapGesture {
                                        selectedVegiName = meat.name
                                        selectedPictureName = meat.picture
                                        if selectedPictureName != "noPicture" {
                                            isPresenting = true
                                        }
                                    }
                                }
                            }
                        }

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
                        }
                    }
                })
            }
            .sheet(isPresented: $isPresenting){
                Overlay(isPresenting: $isPresenting, selectedVegiIllust: $selectedVegiIllust, selectedVegiName: $selectedVegiName)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct BookMeat_Previews: PreviewProvider {
    static var previews: some View {
        BookVegetable()
    }
}

