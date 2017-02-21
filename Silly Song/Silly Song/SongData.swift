//
//  SongData.swift
//  Silly Song
//
//  Created by Ginny Pennekamp on 2/21/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation

// MARK: - Silly Song Templates

// template for the BananaFana Silly Song
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")


// MARK: - Silly Song Behavior Functions

// helper function to create a short name from the full name given
func shortNameFromName(name: String) -> String {
    // set name to lowercase
    let name = name.lowercased()
    
    // remove all consonants before first vowel, or don't remove
    let vowelSet = CharacterSet(charactersIn: "aeiouy")
    
    // adding folding includes with complicated accents
    if let index = name.folding(options: .diacriticInsensitive, locale: .current).rangeOfCharacter(from: vowelSet)?.lowerBound {
        return name.substring(from: index)
    }
    return name
}

// fills in the given template with the proper names
func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}
