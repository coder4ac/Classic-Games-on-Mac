//
//  SnakeStruct.swift
//  ClassicGames
//
//  Created by sihang wang on 8/16/24.
//

import Foundation

struct Snake {
    // Body array that stores the coordinates
    var body: [(Int, Int)] = [(0, 0)]
    var direction: Direction = .right
    
    enum Direction {
        case up, down, left, right
    }
}
