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
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.enabled = false
    }
    
    @IBAction func valueChanged(sender: UITextField) {
        startButton.enabled = sender.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).characters.count >= 2
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "ShowWordList") {
            let wordListVC = segue.destinationViewController as! WordListViewController;

            wordListVC.toPass = word.text
        }
    }
}
