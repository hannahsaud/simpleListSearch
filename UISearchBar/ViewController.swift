//
//  ViewController.swift
//  UISearchBar
//
//  Created by Hannah AlAhmed on 9/18/19.
//  Copyright © 2019 Hannah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let cellContents = ["312", "312", "Apple", "Bucket", "Pinapple", "Zoo"]
    var filteredContents: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "List_Cell")
        searchBar.delegate = self
        
        filteredContents = cellContents
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "List_Cell", for: indexPath)
        cell.textLabel?.text = filteredContents[indexPath.row]
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let predicate = NSPredicate.init(format: "self contains[cd] %@", searchText)
        
        filteredContents = searchText.isEmpty ? cellContents : cellContents.filter {predicate.evaluate(with: $0)}
        tableView.reloadData()
    }
}

