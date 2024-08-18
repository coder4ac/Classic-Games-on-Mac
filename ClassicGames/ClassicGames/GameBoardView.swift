//
//  GameBoardView.swift
//  ClassicGames
//
//  Created by sihang wang on 8/17/24.
//

import SwiftUI

struct GameBoardView: View {
    @ObservedObject var gameModel: SnakeGameModel
    
    var body: some View {
        GeometryReader { geometry in
            let cellSize = min(geometry.size.width / CGFloat(gameModel.boardWidth),
                               geometry.size.height / CGFloat(gameModel.boardHeight))
            
            ZStack {
                // Draw the snake
                ForEach(0..<gameModel.snake.count, id: \.self) { index in
                    let position = gameModel.snake[index]
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: cellSize, height: cellSize)
                        .position(
                            x: CGFloat(position.0) * cellSize + cellSize / 2,
                            y: CGFloat(position.1) * cellSize + cellSize / 2
                        )
                }
                
                // Draw the food
                Rectangle()
                    .fill(Color.red)
                    .frame(width: cellSize, height: cellSize)
                    .position(
                        x: CGFloat(gameModel.food.0) * cellSize + cellSize / 2,
                        y: CGFloat(gameModel.food.1) * cellSize + cellSize / 2
                    )
            }
        }
        .aspectRatio(CGFloat(gameModel.boardWidth) / CGFloat(gameModel.boardHeight), contentMode: .fit)
        .border(Color.white, width: 2)
    }
}

