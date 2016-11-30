//
//  ViewController.swift
//  Project7
//
//  Created by Jonathan Deguzman on 11/29/16.
//  Copyright © 2016 Jonathan Deguzman. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // This property represents an array of dictionaries, with each dictionary holding a string for its key and a string for its value
    var petitions = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NOTE: Downloading the data from the internet in our viewDidLoad() method will cause our app to lock up until all the data has been transferred. In later projects, I should avoid doing this.
        
        // We make urlString point to the whitehouse.gov server to get the json information
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        
        // We use if let to make sure the URL is valid
        if let url = URL(string: urlString) {
            // We make a Data object using the contentsOf method that returns a URL, but since this might throw an error we have to use 'try?'
            if let data = try? Data(contentsOf: url) {
                let json = JSON(data: data)
                
                // Check to see if the json status is 200, and if it is we're good to go
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    parse(json: json)
                }
            }
        }
    }
    
    // Parse the JSON data occording to the key and then store it in a dictionary. Append the dictionary obj to the array
    func parse(json: JSON) {
        // The arrayValue property returns either an array of objects or an empty array
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title, "body": body, "sigs": sigs]
            petitions.append(obj)
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition["title"]
        cell.detailTextLabel?.text = petition["body"]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

