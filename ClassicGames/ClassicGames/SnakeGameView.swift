//
//  snakeMainView.swift
//  ClassicGames
//
//  Created by sihang wang on 8/16/24.
//

import SwiftUI

struct SnakeGameView: View {
    @State private var highestScore = 0
    @State private var currentScore = 0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    // High Score Window
                    Spacer(minLength: 20)
                    VStack {
                        Text("Highest Score")
                            .font(.caption)
                            .foregroundColor(.white)
                        Text("\(highestScore)")
                            .font(.title2)
                            .foregroundColor(.yellow)
                    }
                    .frame(width: 80, height: 50)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    
                    Spacer(minLength: 20)
                    
                    Text("Snake Game")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    Button(action: {
                        // Start game action here
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            .background(Color.green)
                            .clipShape(Circle())
                    }
                    Spacer(minLength: 20)
                    
                    VStack {
                        Text("Score")
                            .font(.caption)
                            .foregroundColor(.white)
                        Text("\(currentScore)")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                    .frame(width: 80, height: 50)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    Spacer()
                    // Placeholder for game area
                    
                }
                Rectangle()
                    .fill(Color.gray.opacity(0.7))
                    .frame(width: 500, height: 300)
                Spacer(minLength: 20)
            }
        }
        .navigationTitle("Snake")
        .navigationBarBackButtonHidden(false)
    }
}

struct SnakeGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SnakeGameView()
        }
    }
}
