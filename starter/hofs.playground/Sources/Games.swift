import Foundation

// MARK: - Games

public let gameLibrary = [
  horrified,
  catLady,
  aTaleOfPirates,
  bobRossArtOfChill,
  welcomeToDinoWorld,
  canvas,
  kanagawa,
  isleOfCats,
  skullKing,
  draftosaurus,
  sunsetOverWater,
  cleocatra,
  deadMenTellNoTales,
  catCafe,
  abomination,
  jurassicParts,
  catRescue,
  raptor
]

public struct Game: Hashable, Equatable, CustomStringConvertible {

  public enum Theme: String {
    case art
    case cats
    case dinosaurs
    case horror
    case pirates
  
    public var image: String {
      let image: String
      switch self {
      case .art: image = "🎨"
      case .cats: image = "🐈"
      case .dinosaurs: image = "🦕"
      case .horror: image = "👻"
      case .pirates: image = "🏴‍☠️"
      }
      
      return image
    }
  }
  
  
  public let name: String
  public let theme: Theme
  public let designers: [String]
  public let artists: [String]
  public let playerCount: ClosedRange<Int>
  public let playTime: Int
  public var ozmaApproved = true
  public var rating: Int = 0
  
  public var description: String {
    "\(name): theme: \(theme.rawValue), designer: \(designers.joined(separator: ", ")), artist: \(artists.joined(separator: ", "))"
  }
  
  public var ratingDescription: String {
    "\(name) - rating: \(rating), Ozma-approved: \(ozmaApproved)"
  }
}

// MARK: - Art
public let bobRossArtOfChill = Game(
  name: "Bob Ross: Art of Chill",
  theme: .art,
  designers: ["Prospero Hall"],
  artists: ["Bob Ross"],
  playerCount: 2...4,
  playTime: 30,
  rating: 5
)

public let canvas = Game(
  name: "Canvas",
  theme: .art,
  designers: ["Jeff Chin", "Andrew Nerger"],
  artists: ["Luan Huynh"],
  playerCount: 1...5,
  playTime: 30,
  rating: 2
)

public let kanagawa = Game(
  name: "Kanagawa",
  theme: .art,
  designers: ["Bruno Cathala", "Charles Chevallier"],
  artists: ["Jade Mosch"],
  playerCount: 2...4,
  playTime: 45,
  rating: 4
)

public let sunsetOverWater = Game(
  name: "Sunset Over Water",
  theme: .art,
  designers: ["Eduardo Baraf", "Steve Finn", "Keith Matejka"],
  artists: ["Benjamin Schulman", "Beth Sobel", "Helen Zhu"],
  playerCount: 2...4,
  playTime: 30,
  ozmaApproved: false
)


// MARK: - Cats
public let catCafe = Game(
  name: "Cat Café",
  theme: .cats,
  designers: ["Lee Ju-Hwa", "Giung Kim"],
  artists: [],
  playerCount: 2...4,
  playTime: 30,
  ozmaApproved: false,
  rating: 3
)

public let catLady = Game(
  name: "Cat Lady",
  theme: .cats,
  designers: ["Josh Wood"],
  artists: ["Josh Wood"],
  playerCount: 2...4,
  playTime: 15,
  ozmaApproved: false,
  rating: 1
)

public let catRescue = Game(
  name: "Cat Rescue",
  theme: .cats,
  designers: ["Ta-Te Wu"],
  artists: ["Kaiami"],
  playerCount: 1...4,
  playTime: 15,
  ozmaApproved: false,
  rating: 5
)

public let cleocatra = Game(
  name: "Cleocatra",
  theme: .cats,
  designers: ["Ta-Te Wu"],
  artists: ["Kaiami"],
  playerCount: 2...4,
  playTime: 20,
  ozmaApproved: false,
  rating: 4
)

public let isleOfCats = Game(
  name: "The Isle of Cats",
  theme: .cats,
  designers: ["Frank West"],
  artists: ["Dragolisco", "Frank West"],
  playerCount: 2...4,
  playTime: 60,
  ozmaApproved: true,
  rating: 2
)


// MARK: - Dinosaurs
public let welcomeToDinoWorld = Game(
  name: "Welcome to Dino World",
  theme: .dinosaurs,
  designers: ["James O’Conner"],
  artists: ["Sabrina Miramon", "Beth Sobel"],
  playerCount: 1...75,
  playTime: 40,
  ozmaApproved: false,
  rating: 4
)

public let raptor = Game(
  name: "Raptor",
  theme: .dinosaurs,
  designers: ["Bruno Cathala", "Bruno Faidutti"],
  artists: ["Vincent Dutrait"],
  playerCount: 2...2,
  playTime: 30,
  ozmaApproved: true,
  rating: 5
)

public let jurassicParts = Game(
  name: "Jurassic Parts",
  theme: .dinosaurs,
  designers: ["Kevin Lanzing"],
  artists: ["Andrew Bosley", "Crimzon Studio"],
  playerCount: 2...5,
  playTime: 20,
  ozmaApproved: false,
  rating: 3
)

public let draftosaurus = Game(
  name: "Draftosaurus",
  theme: .dinosaurs,
  designers: ["Antoine Bauza", "Corentin Lebrat", "Ludovic Maublanc", "Théo Rivièra"],
  artists: ["Jiahui Eva Gao", "Roman Kucharski", "Vipin Alex Jacob"],
  playerCount: 2...5,
  playTime: 15,
  ozmaApproved: false,
  rating: 1
)

// MARK: - Pirates
public let skullKing = Game(
  name: "Skull King",
  theme: .pirates,
  designers: ["Brent Beck"],
  artists: ["Eckhard Freytag", "Apryl Stott"],
  playerCount: 2...6,
  playTime: 30,
  ozmaApproved: false,
  rating: 1
)

public let aTaleOfPirates = Game(
  name: "A Tale of Pirates",
  theme: .pirates,
  designers: ["Asger Harding Granerud", "Daniel Skjold Pedersen", "Daniele Tascini"],
  artists: ["Ruslan Audia"],
  playerCount: 2...4,
  playTime: 30,
  ozmaApproved: true,
  rating: 5
)

public let deadMenTellNoTales = Game(
  name: "Dead Mean Tell No Tales",
  theme: .pirates,
  designers: ["Kane Klenko"],
  artists: ["Jason D. Kingsley", "Chris Ostrowski"],
  playerCount: 2...5,
  playTime: 60,
  ozmaApproved: true,
  rating: 1
)


// MARK: - Horror
public let horrified = Game(
  name: "Horrified",
  theme: .horror,
  designers: ["Prospero Hall"],
  artists: ["Prospero Hall"],
  playerCount: 1...5,
  playTime: 60,
  ozmaApproved: true,
  rating: 4
)

public let abomination = Game(
  name: "Abomination",
  theme: .horror,
  designers: ["Dan Blanchett"],
  artists: ["Mikhail Palamarchuk", "Tony Sart"],
  playerCount: 2...4,
  playTime: 90,
  ozmaApproved: true,
  rating: 2
)



// MARK: - Custom Name Formatter
public class NameFormatter: PersonNameComponentsFormatter {
  public override func string(from components: PersonNameComponents) -> String {
    if style == .short {
      if let given = components.givenName {
        if let family = components.familyName,
           let familyInitial = family.first {
          return "\(given) \(familyInitial)."
        }
        
        return given
      }
      
      if let family = components.familyName {
        return family
      }
      
      return "Ozma C."
      
    } else {
      return super.string(from: components)
    }
  }
}


// MARK: - Comparable
public extension Bool {
  /// A way to compare `Bool`s.
  ///
  /// Note: `false` is "less than" `true`.
  enum Comparable: CaseIterable, Swift.Comparable {
    case `false`, `true`
  }

  /// Make a `Bool` `Comparable`, with `false` being "less than" `true`.
  var comparable: Comparable { .init(booleanLiteral: self) }
}

extension Bool.Comparable: ExpressibleByBooleanLiteral {
  public init(booleanLiteral value: Bool) {
    self = value ? .true : .false
  }
}

