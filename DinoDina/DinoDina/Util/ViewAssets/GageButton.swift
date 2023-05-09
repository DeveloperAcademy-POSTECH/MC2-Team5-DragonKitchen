//
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
                    
                    RoundedButton(widthScale: 0.3, heightScale: 0.1, content: "무엇", contentSize: 15, contentColor: .white, isActive: true)
                   
                }
            }
        }
    }



struct GageButton_Previews: PreviewProvider {
    static var previews: some View {
        GageButton()
    }
}
