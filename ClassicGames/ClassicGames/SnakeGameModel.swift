//
//  SnakeGameModel.swift
//  ClassicGames
//
//  Created by sihang wang on 8/16/24.
//

import Foundation
import SwiftUI

class SnakeGameModel: ObservableObject {
    
    // Game area size
    let boardWidth = 50
    let boardHeight = 30
    
    // Snake properties
    @Published var snake: [(Int, Int)] = [(10, 10)]
    @Published var direction: Direction = .right
    
    // Food properties
    @Published var food: (Int, Int) = (0, 0)
    
    // Game state
    @Published var isGameOver = false
    @Published var score = 0
    @Published var highScore = UserDefaults.standard.integer(forKey: "HighScore")
    
    // Timer for game updates
    var gameTimer: Timer?
    
    enum Direction {
        case up, down, left, right
    }
    
    init() {
        placeFood()
    }
    
    func startGame() {
        resetGame()
        gameTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            self.updateGame()
        }
    }
    
    func resetGame() {
        snake = [(10, 10)]
        direction = .right
        isGameOver = false
        score = 0
        placeFood()
    }
    
    func updateGame() {
        guard !isGameOver else { return }
        
        // Move the snake
        var newHead = snake.first!
        switch direction {
        case .up:
            newHead.1 -= 1
        case .down:
            newHead.1 += 1
        case .left:
            newHead.0 -= 1
        case .right:
            newHead.0 += 1
        }
        
        // Check for collisions
        if newHead.0 < 0 || newHead.0 >= boardWidth || newHead.1 < 0 || newHead.1 >= boardHeight || snake.contains(where: { $0 == newHead }) {
            endGame()
            return
        }
        
        // Move the snake
        snake.insert(newHead, at: 0)
        
        // Check if food was eaten
        if newHead == food {
            score += 1
            placeFood()
        } else {
            snake.removeLast()
        }
    }
    
    func placeFood() {
        var newFood: (Int, Int)
        repeat {
            newFood = (Int.random(in: 0..<boardWidth), Int.random(in: 0..<boardHeight))
        } while snake.contains { $0 == newFood }
        food = newFood
    }
    
    func changeDirection(_ newDirection: Direction) {
        let opposites: [Direction: Direction] = [.up: .down, .down: .up, .left: .right, .right: .left]
        if opposites[newDirection] != direction {
            direction = newDirection
        }
    }
    
    func endGame() {
        isGameOver = true
        gameTimer?.invalidate()
        if score > highScore {
            highScore = score
            UserDefaults.standard.set(highScore, forKey: "HighScore")
        }
    }
}
