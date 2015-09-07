//
//  WordListViewController.swift
//  Tiny Word Match
//
//  Created by Julio Nobrega on 9/6/15.
//  Copyright (c) 2015 Cassiano e Julio. All rights reserved.
//

import UIKit

class WordListViewController: UIViewController {
    var toPass:String!
    
    @IBOutlet weak var chosenWord: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        chosenWord.text = toPass
    }
}
