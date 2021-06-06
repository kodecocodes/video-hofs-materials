/// Sample code from the video course, Higher-Order Functions in Swift,
/// published at raywenderlich.com, Copyright (c) 2021 Razeware LLC.
/// See LICENSE for details. Thank you for supporting our work!

import Algorithms

/// ------------------------------------------------------
/// starter data
/// ------------------------------------------------------

let artists = gameLibrary.flatMap(\.artists)
/// ------------------------------------------------------


// MARK: - filter
print("-------- Solo Games --------")

let soloGames = gameLibrary.filter {
  $0.playerCount.lowerBound == 1
}
soloGames.forEach { print($0.description) }

// MARK: - sorted
print("-------- Sorted by Ratings --------")

func rankGames(_ game1: Game, _ game2: Game) -> Bool {
  (game1.rating, game2.ozmaApproved.comparable, game2.name) < (game2.rating, game1.ozmaApproved.comparable, game1.name)
}

let sortedGames = gameLibrary.sorted(by: rankGames)
sortedGames.forEach { print($0.ratingDescription) }

// MARK: - Uniqued
let uniqueArtists = Array(artists.uniqued())
print("artists: \(uniqueArtists.joined(separator: ", "))")

let oneOfEachRating = sortedGames.uniqued(on: \.rating)
oneOfEachRating.forEach { print($0.ratingDescription) }

// MARK: - reduce vs. reductions
let totalPlaytime = gameLibrary.reduce(0) { runningTotal, game in
  runningTotal + game.playTime
}

gameLibrary.map(\.playTime).reductions(+)


// MARK: - Dictionaries
print("-------- Play Time by Category --------")

let groupedGames = Dictionary(grouping: gameLibrary, by: \.theme)

let categoryPlayTime = groupedGames.mapValues { games in
  games.reduce(0) { runningTotal, game in
    runningTotal + game.playTime
  }
}

print(categoryPlayTime)
