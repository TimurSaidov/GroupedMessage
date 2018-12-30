//
//  ViewController.swift
//  GroupedMessage
//
//  Created by Timur Saidov on 30/12/2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

class MessageTableViewController: UITableViewController {
    
    let chatMessages = [
        ChatMessage(text: "Here's my first message", isIncoming: true),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: false),
        ChatMessage(text: "That's my third message and I'm going to message another long message that will word wrap", isIncoming: true),
        ChatMessage(text: "Yo, dawg, whaddup!", isIncoming: false),
        ChatMessage(text: "This message should appear on the right side with a dark gray background bubble", isIncoming: false)]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MessageTableViewCell
        
        cell.backgroundColor = .clear

        let chatMessage = chatMessages[indexPath.row]
        
        cell.chatMessage = chatMessage
        
        return cell
    }
}

