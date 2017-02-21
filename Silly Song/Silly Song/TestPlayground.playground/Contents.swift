//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//The CharacterSet class will be useful for this function, since it holds a set of characters that you can search for in a string. In particular, look for the CharacterSet(charactersIn:) initializer. (Apple's documentation for CharacterSet)
//The Swift String struct includes the methods rangeOfCharacter(from:options:range:) and substring(from:). You may find these methods handy in conjunction with the first tip. (Apple's documentation for String)

var name = "Ginny"

func shortNameFromName(name: String) -> String {
    // set name to lowercase
    let name = name.lowercased()
    
    // remove all consonants before first vowel, or don't remove
    let vowelSet = CharacterSet(charactersIn: "aeiou")

    // adding folding includes with complicated accents
    if let index = name.folding(options: .diacriticInsensitive, locale: .current).rangeOfCharacter(from: vowelSet)?.lowerBound {
        return name.substring(from: index)
    }
    return name
}

let inny = shortNameFromName(name: "Ginny")
let inn = shortNameFromName(name: "Finn")
let ian = shortNameFromName(name: "Brian")
let anna = shortNameFromName(name: "Anna")
let oe = shortNameFromName(name: "Zöe")


let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

let GinnySong = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name)