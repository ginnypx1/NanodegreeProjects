//
//  ViewController.swift
//  Silly Song
//
//  Created by Ginny Pennekamp on 2/21/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField delegate
        nameField.delegate = self
    }
    
    // MARK: - Text Field Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    // MARK: - UI Actions

    @IBAction func reset(_ sender: Any) {
        // clear out the text of both the nameField and the lyricsView
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
        // takes the name entered in the name field, generate the personalized lyrics, and display the lyrics in the lyrics view
        
        guard let name = nameField.text, !name.isEmpty else {
            return
        }
        
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name)
    }
}

