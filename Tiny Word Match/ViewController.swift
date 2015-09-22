//
//  ViewController.swift
//  Tiny Word Match
//
//  Created by Julio Nobrega on 9/6/15.
//  Copyright (c) 2015 Cassiano e Julio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var word: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "ShowWordList") {
            let wordListVC = segue.destinationViewController as! WordListViewController;

            wordListVC.toPass = word.text
        }
    }
}
