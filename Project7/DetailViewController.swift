//
//  DetailViewController.swift
//  Project7
//
//  Created by Jonathan Deguzman on 11/29/16.
//  Copyright © 2016 Jonathan Deguzman. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var webView: WKWebView!
    var detailItem: [String: String]!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // If there is no value, the guard statement will cause our code to immediately exit if any critical data is missing. It's useful for when you have a really long value
        guard detailItem != nil else { return }
        
        // All the HTML will be combined with the body value from our dictionary
        if let body = detailItem["body"] {
            var html = "<html>"
            html += "<head>"
            html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
            html += "<style> body { font-size: 150%; } </style>"
            html += "</head>"
            html += "<body>"
            html += body
            html += "</body>"
            html += "</html>"
            webView.loadHTMLString(html, baseURL: nil)
        }
    }
}
