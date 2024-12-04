//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Anastasios Rigatos on 4/12/2024.
//

import SwiftUI

struct ContentView: View {
    
   @State var leftDice = 1
   @State var rightDice = 1
    
    
    var body: some View {
            ZStack {
                
                Image("GreenBackground").resizable().ignoresSafeArea(.all)
                
                
                VStack(spacing:50) {
                    Image("DiceeLogo")
                    
                    HStack{
                        DiceView(n:leftDice)
                        DiceView(n:rightDice)
                    }
                    .padding(.all,30)
                    Button("Roll Dice") {
                        self.leftDice = Int.random(in: 1...6)
                        self.rightDice = Int.random(in: 1...6)
                        if leftDice == rightDice {
                            leftDice = 1
                            rightDice = 2
                        }
                    }
                    .frame(width: 200, height: 50)
                    .background(Color(red: 0.541, green: 0.01, blue: 0.017))
                    .foregroundColor(Color.white)
                    .clipShape(Capsule()) // Ensure capsule shape
                    .overlay(
                        Capsule().stroke(.bar, lineWidth: 1) // Add border as an overlay
                    )
                    .padding()
                }
                .padding(.top, 20)
               
                }
            }
        
    }



//func numberToWords(_ number: Int) -> String {
//    let formatter = NumberFormatter()
//    formatter.numberStyle = .spellOut
//    guard let numberInWords = formatter.string(from: NSNumber(value: number)) else {
//        return "Unknown"
//    }
//    return numberInWords
//}




struct DiceView: View {
    var n : Int
    var body: some View {
        Image("Dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            
    }
}

#Preview {
    ContentView()
}
