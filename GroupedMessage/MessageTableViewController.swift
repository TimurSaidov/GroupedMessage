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
        [
            ChatMessage(text: "Here's my first message", isIncoming: true, date: Date.dateFromCustomString(customString: "01/01/2019")),
            ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: false, date: Date.dateFromCustomString(customString: "01/01/2019")),
            ChatMessage(text: "That's my third message and I'm going to message another long message that will word wrap", isIncoming: true, date: Date.dateFromCustomString(customString: "01/01/2019"))],
        [
            ChatMessage(text: "Yo, dawg, whaddup!", isIncoming: false, date: Date.dateFromCustomString(customString: "01/02/2019")),
            ChatMessage(text: "This message should appear on the right side with a dark gray background bubble", isIncoming: false, date: Date.dateFromCustomString(customString: "01/02/2019"))],
        [
            ChatMessage(text: "And this is my answer on the left side", isIncoming: true, date: Date.dateFromCustomString(customString: "01/03/2019"))]
    ]

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
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            let label = DateHeaderLabel()
            label.backgroundColor = .black
            label.text = dateString
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.textColor = .white
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            let containerView = UIView()
            
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            return dateString
        }
        
        return "Section \(section)"
    }
     */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MessageTableViewCell
        
        cell.backgroundColor = .clear

        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage
        
        return cell
    }
}

