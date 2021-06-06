/// Sample code from the course, Higher-Order Functions in Swift,
/// published at raywenderlich.com, Copyright (c) 2021 Razeware LLC.
/// See LICENSE for details. Thank you for supporting our work!

import SwiftUI

struct ContentView: View {
  let games: [Game]
  
  var body: some View {
    GameShelf(games: games.sorted { $0.theme.rawValue < $1.theme.rawValue }) { game in
      GameView(game: game)
    }
  }
}

struct GameShelf<Content>: View where Content: View {
  let games: [Game]
  let content: (Game) -> Content

  init(
    games: [Game],
    @ViewBuilder content: @escaping (Game) -> Content
  ) {
    self.games = games
    self.content = content
  }

  var body: some View {
    ScrollView {
      VStack {
        ForEach(games, id: \.name) { game in
          content(game)
        }
      }
      .padding(.horizontal)
    }
  }
}

struct GameView: View {
  let game: Game
  
  var body: some View {
    HStack {
      Text(game.theme.image)
        .font(.largeTitle)

      VStack(alignment: .leading) {
        Text(game.name)
          .font(.title2)
        
        HStack {
          if game.playerCount.lowerBound == game.playerCount.upperBound {
            Text("Players: \(game.playerCount.upperBound)")
          } else {
            Text("Players: \(game.playerCount.lowerBound) - \(game.playerCount.upperBound)")
          }
          
          Spacer()
          
          Text("Play Time: \(game.playTime)")
        }
      }
    }
    .padding(.vertical)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(games: gameLibrary)
  }
}


