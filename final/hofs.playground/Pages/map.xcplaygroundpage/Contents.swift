/// Sample code from the video course, Higher-Order Functions in Swift,
/// published at raywenderlich.com, Copyright (c) 2021 Razeware LLC.
/// See LICENSE for details. Thank you for supporting our work!

import Algorithms
import Foundation

extension Array {
  func forLoopify<Transformed>(_ transform: (Element) -> Transformed) -> [Transformed] {
    var transformedArray: [Transformed] = []
    for element in self {
      let transformed = transform(element)
      transformedArray.append(transformed)
    }
    return transformedArray
  }
}

var gameNames: [String] = []
for game in gameLibrary {
  let name = game.name
  gameNames.append(name)
}

gameNames = gameLibrary.forLoopify { game in
  game.name
}

// MARK: - map
// https://github.com/apple/swift/blob/main/stdlib/public/core/Sequence.swift

gameLibrary.map { $0.name }
gameLibrary.map { $0.playerCount.upperBound }

gameLibrary.map(\.name)
gameLibrary.map(\.playerCount.lowerBound)

// MARK: - flatMap

let designers = gameLibrary.flatMap(\.designers)

// MARK: - compactMap
print("-------- Artists --------")

let artists = gameLibrary.flatMap(\.artists)
  .compactMap(PersonNameComponentsFormatter().personNameComponents)


