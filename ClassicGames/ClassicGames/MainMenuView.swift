//
//  ContentView.swift
//  ClassicGames
//
//  Created by sihang wang on 8/16/24.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Classic Games")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: SnakeGameView()) {
                    Text("Snake")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
