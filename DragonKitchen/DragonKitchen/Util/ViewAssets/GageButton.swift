
//  DummyView.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/08.
//
import NavigationStack
import SwiftUI



struct GageButton: View{
    @EnvironmentObject var gageVar : gageVariables
    @State var whatFood:String = ""
    var body: some View{
        VStack{
            HStack{
                Button{
                    whatFood = "Vegi"
                }label: {
                    Text("Vegi")
                }
                Button{
                    whatFood = "Fruit"
                }label: {
                    Text("Fruit")
                }
                Button{
                    whatFood = "Meat"
                }label: {
                    Text("Meat")
                }
            }
           

            Button{
                
                if whatFood == "Vegi"
                {
                    if  ((gageVar.greenCount == 2) && (gageVar.redCount == 3) && (gageVar.orangeCount == 3)) {
                        gageVar.greenCount += 1
                        gageVar.turnGreen3 = true
                        if gageVar.evolutionCount == 0 {
                            gageVar.isEvolution = true
                            gageVar.evolutionCount += 1
                        }
                        else{
                            gageVar.isEvolution2 = true
                        }
                        
                        
                    }
                    else {
                        gageVar.greenCount += 1
                        switch gageVar.greenCount {
                        case 1: gageVar.turnGreen1 = true
                        case 2: gageVar.turnGreen2 = true
                        case 3: gageVar.turnGreen3 = true
                        default:
                            gageVar.greenCount = 3
                        }
                    }
                }
                else if whatFood == "Fruit"{
                    if  ((gageVar.greenCount == 3) && (gageVar.redCount == 2) && (gageVar.orangeCount == 3)) {
                        gageVar.redCount += 1
                        gageVar.turnRed3 = true
                        if gageVar.evolutionCount == 0 {
                            gageVar.isEvolution = true
                            gageVar.evolutionCount += 1
                        }
                        else{
                            gageVar.isEvolution2 = true
                        }
                    }
                    else{
                        gageVar.redCount += 1
                        switch gageVar.redCount {
                        case 1: gageVar.turnRed1 = true
                        case 2: gageVar.turnRed2 = true
                        case 3: gageVar.turnRed3 = true
                        default:
                            gageVar.redCount = 3
                        }
                    }
                }
                else if whatFood == "Meat" {
                    if  ((gageVar.greenCount == 3) && (gageVar.redCount == 3) && (gageVar.orangeCount == 2)) {
                        gageVar.orangeCount += 1
                        gageVar.turnOrange3 = true
                        if gageVar.evolutionCount == 0 {
                            gageVar.isEvolution = true
                            gageVar.evolutionCount += 1
                        }
                        else{
                            gageVar.isEvolution2 = true
                        }
                    }
                    else {
                        gageVar.orangeCount += 1
                        switch gageVar.orangeCount {
                        case 1: gageVar.turnOrange1 = true
                        case 2: gageVar.turnOrange2 = true
                        case 3: gageVar.turnOrange3 = true
                        default:
                            gageVar.orangeCount = 3
                        }
                    }
                }
            } label: {
                ZStack{
                    
                    RoundedButton(widthScale: 0.3, heightScale: 0.1, content: "무엇", contentSize: 15, contentColor: .white, isActive: true)
                    
                }
            }
            PopView{Text("Escape")}
            Button{
                
                gageVar.turnGreen1 = true
                gageVar.turnGreen2 = true
                gageVar.turnGreen3 = true
                gageVar.turnRed1 = true
                gageVar.turnRed2 = true
                gageVar.turnRed3 = true
                gageVar.turnOrange1 = true
                gageVar.turnOrange2 = true
                gageVar.turnOrange3 = true
                gageVar.greenCount = 3
                gageVar.redCount = 3
                gageVar.orangeCount = 3
                if gageVar.evolutionCount == 0{
                    gageVar.isEvolution = true
                    gageVar.evolutionCount += 1
                }
                else {
                    gageVar.isEvolution2 = true
                }
                
            } label: {
                Text("Full")
            }
        }
        }
    }



struct GageButton_Previews: PreviewProvider {
    static var previews: some View {
        GageButton()
    }
}
