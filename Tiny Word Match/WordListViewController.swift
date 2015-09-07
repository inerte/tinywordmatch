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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        chosenWord.text = toPass
        
        let url = "http://api.wolframalpha.com/v2/query?input=cat+rhyme&appid=75JR3G-A8R54WGRH6"
        
        // create the request & response
        var request = NSMutableURLRequest(URL: NSURL(string: url)!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 5)
        var response: NSURLResponse?
        var error: NSError?
        
        request.HTTPMethod = "GET"
        // send the request
        let data: NSData = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &error)!
        
        let xml = SWXMLHash.parse(data)
        
        println("queryresult.pod.withAttr")
        println(xml["queryresult"]["pod"].withAttr("title", "Result")["subpod"]["plaintext"].element?.text)
    }
}
