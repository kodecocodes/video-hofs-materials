/// Sample code from the video course, Higher-Order Functions in Swift,
/// published at raywenderlich.com, Copyright (c) 2021 Razeware LLC.
/// See LICENSE for details. Thank you for supporting our work!

import Foundation

protocol Meowing {
  func meow(times: Int) -> String
}

struct Cat: Meowing {
  var name: String
  
  func meow(times: Int) -> String {
    String(repeating: "meow", count: times)
  }
}


// MARK: Format Sentences
let exampleSentences = [
  "this is an example",
  "Another example!!",
  "one more example, here",
  "what about this example?"
]

func format(_ sentence: String) -> String {
  guard !sentence.isEmpty else { return sentence }
  var formattedText = sentence.prefix(1).uppercased() + sentence.dropFirst()
  if let lastCharacter = formattedText.last,
     !lastCharacter.isPunctuation {
    formattedText += "."
  }
  return formattedText
}

for sentence in exampleSentences {
  let formatted = format(sentence)
  print(formatted)
}

print("------------------")

typealias FormatSentence = (String) -> String

extension Array where Element == String {
  func format(_ sentence: String) -> String {
    guard !sentence.isEmpty else { return sentence }
    var formattedText = sentence.prefix(1).uppercased() + sentence.dropFirst()
    if let lastCharacter = formattedText.last,
       !lastCharacter.isPunctuation {
      formattedText += "."
    }
    return formattedText
  }
  
//  func printFormatted() {
//  func printFormatted(format: ((String) -> String)) {
  func printFormatted(format: FormatSentence) {
    for string in self {
//      let formattedString = formatSentence(string)
      let formattedString = format(string)
      print(formattedString)
    }
  }
}

exampleSentences.printFormatted(format: format)

print("------------------")

let storedFormat: FormatSentence = format
exampleSentences.printFormatted(format: storedFormat)

print("------------------")

exampleSentences.printFormatted { text in
  text.capitalized
}

print("------------------")

exampleSentences.printFormatted { String.init(repeating: $0, count: 3) }
