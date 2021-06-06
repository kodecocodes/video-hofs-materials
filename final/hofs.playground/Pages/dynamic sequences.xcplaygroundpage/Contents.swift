/// Sample code from the video course, Higher-Order Functions in Swift,
/// published at raywenderlich.com, Copyright (c) 2021 Razeware LLC.
/// See LICENSE for details. Thank you for supporting our work!

public extension UnsignedInteger {
  /// The digits that make up this number.
  /// - Parameter radix: The base the result will use.
  func digits(radix: Self = 10) -> [Self] {
    sequence(state: self) { quotient in
      guard quotient > 0
      else { return nil }

      let division = quotient.quotientAndRemainder(dividingBy: radix)
      quotient = division.quotient
      return division.remainder
    }
    .reversed()
  }
}


(867_5309 as UInt).digits()

(0x00_F0 as UInt).digits(radix: 0b10)

(0xA0_B1_C2_D3_E4_F5 as UInt).digits(radix: 0x10)

(0o00707 as UInt).digits(radix: 0o10)




public struct CircularSequence<Iterator: IteratorProtocol>: Sequence {
  public init<Sequence: Swift.Sequence>(_ sequence: Sequence)
  where Sequence.Iterator == Iterator {
    makeIterator = sequence.makeIterator
    iterator = makeIterator()
  }

  private var iterator: Iterator
  private let makeIterator: () -> Iterator
}

// MARK: IteratorProtocol
extension CircularSequence: IteratorProtocol {
  public mutating func next() -> Iterator.Element? {
    if let next = iterator.next() {
      return next
    }
    else {
      iterator = makeIterator()
      return iterator.next()
    }
  }
}

let catGames = gameLibrary.filter { $0.theme == .cats }
var circularCatGames = CircularSequence(catGames)

circularCatGames.next()
circularCatGames.next()
circularCatGames.next()
circularCatGames.next()
circularCatGames.next()
circularCatGames.next()
circularCatGames.next()
circularCatGames.next()

