//
//  ContactsByNameTableViewController.swift
//  Little Black Book
//
//  Created by Jonathan T. Miles on 5/22/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import UIKit

class ContactsByNameTableViewController: UITableViewController {

    // MARK: - Life Cycle methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactController.contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)

        let contact = contactController.contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        
        return cell
    }

  

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? AddContactInfoViewController else { return }
        destVC.contactController = self.contactController
    }
    
    // MARK: - Private
    
    private func updateViews() {
        tableView.reloadData()
    }
    
    // MARK: - Properties
    
    let contactController = ContactController()

}
