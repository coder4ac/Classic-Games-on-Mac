//
//  snakeMainView.swift
//  ClassicGames
//
//  Created by sihang wang on 8/16/24.
//

import SwiftUI

struct SnakeGameView: View {
    
    @StateObject private var gameModel = SnakeGameModel()
    var highestScore: Int { gameModel.highScore }
    var currentScore: Int { gameModel.score }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    // High Score Window
                    VStack {
                        Text("High Score")
                            .font(.caption)
                            .foregroundColor(.white)
                        Text("\(gameModel.highScore)")
                            .font(.title2)
                            .foregroundColor(.yellow)
                    }
                    .frame(width: 80, height: 50)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    
                    Spacer()
                    
                    // Game Title
                    Text("Snake Game")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // Start Button and Current Score
                    HStack(spacing: 10) {
                        Button(action: {
                            gameModel.startGame()
                        }) {
                            Image(systemName: "play.fill")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                                .background(Color.green)
                                .clipShape(Circle())
                        }
                    }
                    VStack {
                        Text("Score")
                            .font(.caption)
                            .foregroundColor(.white)
                        Text("\(gameModel.score)")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                    .frame(width: 80, height: 50)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    
                    Spacer()
                }
                .padding()
                
                // Game Board
                GameBoardView(gameModel: gameModel)
                    .frame(width: 500, height: 300)
                
                // Game Controls
                HStack {
                    ForEach(["←", "↑", "↓", "→"], id: \.self) { direction in
                        Button(action: {
                            switch direction {
                            case "←": gameModel.changeDirection(.left)
                            case "↑": gameModel.changeDirection(.up)
                            case "↓": gameModel.changeDirection(.down)
                            case "→": gameModel.changeDirection(.right)
                            default: break
                            }
                        }) {
                            Text(direction)
                                .font(.title)
                                .frame(width: 50, height: 50)
                                .background(Color.gray.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
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
