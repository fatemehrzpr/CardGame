//
//  ContentView.swift
//  CardGame
//
//  Created by Mohammad Razipour on 6/27/1401 AP.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card2"
    @State private var cpuCard = "card3"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var showingAlert = false
    
    var alertTitle: String {
        if playerScore > cpuScore {
            return "Player Win!"
        } else {
            return "CPU Win!"
        }
    }
    
    var body: some View {
        ZStack {
            Image("background")
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                Button {
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    if playerRand > cpuRand {
                        playerScore += 1
                    } else if cpuRand > playerRand {
                        cpuScore += 1
                    }
                    
                    if (cpuScore == 10) || (playerScore  == 10){
                        showingAlert = true
                    }
                    
                } label: {
                    Image("dealbutton")
                }
                
                Spacer()
                HStack{
                    Spacer()
                    
                    VStack(spacing: 10){
                        Text("Player")
                            .foregroundColor(.white)
                        Text(String(playerScore))
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 10){
                        Text("CPU")
                            .foregroundColor(.white)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            .padding([.leading, .trailing], 15)
            .padding([.top, .bottom], 50)
            
            .alert(self.alertTitle, isPresented: $showingAlert) {
                Button("Play Again!") {
                    cpuScore = 0
                    playerScore = 0
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
