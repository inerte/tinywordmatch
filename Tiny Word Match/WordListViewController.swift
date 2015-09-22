//
//  WordListViewController.swift
//  Tiny Word Match
//
//  Created by Julio Nobrega on 9/6/15.
//  Copyright (c) 2015 Cassiano e Julio. All rights reserved.
//

import UIKit

class WordListViewController: UIViewController, NSXMLParserDelegate {
    var toPass:String!
    
    
    @IBOutlet weak var chosenWord: UILabel!
    
    @IBOutlet weak var wordListLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        chosenWord.text = toPass
        
        let url = "http://api.wolframalpha.com/v2/query?input=\(toPass)+rhyme&appid=75JR3G-A8R54WGRH6"
        
        // create the request & response
        let request = NSMutableURLRequest(URL: NSURL(string: url)!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 5)
        var response: NSURLResponse?
        var error: NSError?
        
        request.HTTPMethod = "GET"
        // send the request
        let data: NSData = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
        
        let xml = SWXMLHash.parse(data)
        
        if let resultWords = xml["queryresult"]["pod"].withAttr("title", "Result")["subpod"]["plaintext"].element?.text {
            
            let wordList = resultWords.characters.split {$0 == "|"}.map { String($0) }.map{$0.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())}

            print("wordList \(wordList)")
            
            wordListLabel.text = wordList.joinWithSeparator(", ")
        }
    }
}
