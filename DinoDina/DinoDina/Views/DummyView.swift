//
//  DummyView.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/08.
//
import NavigationStack
import SwiftUI

struct DummyView: View {
    @StateObject var gageVar = gageVariables()

    @State var bubbleOn = false
    @State var vegeOn = false
    @State var gageWidthOut: CGFloat = UIScreen.width * 0.025
    @State var gageWidthIn: CGFloat = UIScreen.width * 0.02
    @State var gageHeightOut: CGFloat = UIScreen.width * 0.025
    @State var gageHeightIn: CGFloat = UIScreen.width * 0.02

    var body: some View {
        VStack{
            
                
            Text("Green gage Count is \(gageVar.greenCount)")
            Text("Red gage Count is \(gageVar.redCount)")
            Text("Orange gage Count is \(gageVar.orangeCount)")
            ButtonView()
                .environmentObject(gageVar)
            PopView{
                Text("go back")
            }
            }
        }
    }


struct ButtonView: View{
    @EnvironmentObject var gageVar : gageVariables
    var body: some View{
        Button{
            gageVar.greenCount += 1
            switch gageVar.greenCount {
            case 1: gageVar.turnGreen1 = true
            case 2: gageVar.turnGreen2 = true
            case 3: gageVar.turnGreen3 = true
            default:
                gageVar.greenCount = 3

        }
    } label: {
        ZStack{
            
            RoundedButton(widthScale: 0.3, heightScale: 0.05)
            Text("Green Up!")
                .foregroundColor(.white)
        }
    }
        Button{
            gageVar.redCount += 1
            switch gageVar.redCount {
            case 1: gageVar.turnRed1 = true
            case 2: gageVar.turnRed2 = true
            case 3: gageVar.turnRed3 = true
            default:
                gageVar.redCount = 3

        }
    } label: {
        ZStack{
            
            RoundedButton(widthScale: 0.3, heightScale: 0.05)
            Text("Red Up!")
                .foregroundColor(.white)
        }
    }
        Button{
            gageVar.orangeCount += 1
            switch gageVar.orangeCount {
            case 1: gageVar.turnOrange1 = true
            case 2: gageVar.turnOrange2 = true
            case 3: gageVar.turnOrange3 = true
            default:
                gageVar.orangeCount = 3
        }
    } label: {
        ZStack{
            
            RoundedButton(widthScale: 0.3, heightScale: 0.05)
            Text("Orange Up!")
                .foregroundColor(.white)
        }
    }
        }
    }

struct GageButton: View{
    @EnvironmentObject var gageVar : gageVariables
    @State var whatFood:String = "" 
    var body: some View{
        
        Button{
            
            if whatFood == "Vegi" {
                gageVar.greenCount += 1
                switch gageVar.greenCount {
                case 1: gageVar.turnGreen1 = true
                case 2: gageVar.turnGreen2 = true
                case 3: gageVar.turnGreen3 = true
                default:
                    gageVar.greenCount = 3
                }
            }
            else if whatFood == "Fruit" {
                
                gageVar.redCount += 1
                switch gageVar.redCount {
                case 1: gageVar.turnRed1 = true
                case 2: gageVar.turnRed2 = true
                case 3: gageVar.turnRed3 = true
                default:
                    gageVar.redCount = 3
                }
            }
            else if whatFood == "Meat" {
                    gageVar.orangeCount += 1
                    switch gageVar.orangeCount {
                    case 1: gageVar.turnOrange1 = true
                    case 2: gageVar.turnOrange2 = true
                    case 3: gageVar.turnOrange3 = true
                    default:
                        gageVar.orangeCount = 3
                    }
                }
            } label: {
                ZStack{
                    
                    RoundedButton(widthScale: 0.3, heightScale: 0.05)
                    Text("무엇일까요")
                        .foregroundColor(.white)
                }
            }
        }
    }



struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
    }
}
