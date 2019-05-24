//
//  ContactController.swift
//  Little Black Book
//
//  Created by Jonathan T. Miles on 5/23/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import Foundation
import UIKit

class ContactController {
    
    // Create
    func createNewContact(name: String, company: String, roleOrField: String, hobby: String, picture: UIImage, emailAddress: String, phoneNumber: String, twitterHandle: String, physicalAddress: String) {
        
        // TODO: must be able to handle blank fields
        let contact = Contact(name: name, company: company, roleOrField: roleOrField, hobby: hobby, picture: picture, emailAddress: emailAddress, phoneNumber: phoneNumber, twitterHandle: twitterHandle, physicalAddress: physicalAddress)
        
        contacts.append(contact)
        
        // save
    }
    
    // Update
    
    func updateContact(contact: Contact, name: String, company: String, roleOrField: String, hobby: String, picture: UIImage, emailAddress: String, phoneNumber: String, twitterHandle: String, physicalAddress: String) {
        
        // TODO: must be able to handle blank fields
        let newContact = Contact(name: name, company: company, roleOrField: roleOrField, hobby: hobby, picture: picture, emailAddress: emailAddress, phoneNumber: phoneNumber, twitterHandle: twitterHandle, physicalAddress: physicalAddress)
        
        let contactIndex = contacts.firstIndex { (contact) -> Bool in
            fatalError("Error with finding element in read array")
        }
        
        contacts.remove(at: contactIndex.hashValue) // does this work?
        contacts.insert(newContact, at: contactIndex.hashValue)
        
        // TODO: consider editing properties directly, e.g. contacts[index].company = "newCompany" ; I know there's some trick to it, supposedly
    }
    
    // Delete
    
    func deleteContact(contact: Contact) {
        let contactIndex = contacts.firstIndex { (contact) -> Bool in
            fatalError("Error with finding element in read array")
        }
        contacts.remove(at: contactIndex.hashValue)
        // again -- does this work, actually? hashValue and the throwing firstIndex
    }
    
    // MARK: - Properties
    
    // Read
    var contacts: [Contact] = []
    
    // TODO: must be superceded by load/save functions
}
