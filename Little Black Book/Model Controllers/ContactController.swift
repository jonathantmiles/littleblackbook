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
    
    // MARK: - Life Cycle
    
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: - C_UD
    
    /// Creates new contact, inserts it into the read array, sets currentContact property to this contact, and saves to plist.
    func createNewContact(name: String, company: String?, roleOrField: String?, hobby: String?, /*picture: UIImage?, */emailAddress: String?, phoneNumber: String?, twitterHandle: String?, physicalAddress: String?) {
        
        let contact = Contact(name: name, company: company, roleOrField: roleOrField, hobby: hobby, /*picture: picture, */emailAddress: emailAddress, phoneNumber: phoneNumber, twitterHandle: twitterHandle, physicalAddress: physicalAddress)
        
        currentContact = contact
        contacts.append(contact)
        
        saveToPersistentStore()
    }
    
    func updateContact(contact: Contact, name: String, company: String?, roleOrField: String?, hobby: String?, /*picture: UIImage?, */emailAddress: String?, phoneNumber: String?, twitterHandle: String?, physicalAddress: String?) {
        
        let newContact = Contact(name: name, company: company, roleOrField: roleOrField, hobby: hobby, /*picture: picture, */emailAddress: emailAddress, phoneNumber: phoneNumber, twitterHandle: twitterHandle, physicalAddress: physicalAddress)
        
        let contactIndex = contacts.firstIndex { (contact) -> Bool in
            fatalError("Error with finding contact element in read array")
        }
        
        contacts.remove(at: contactIndex.hashValue) // does this work?
        contacts.insert(newContact, at: contactIndex.hashValue)
        
        // TODO: consider editing properties directly, e.g. contacts[index].company = "newCompany" ; I know there's some trick to it, supposedly
        
        saveToPersistentStore()
    }
    
    func deleteContact(contact: Contact) {
        let contactIndex = contacts.firstIndex { (contact) -> Bool in
            fatalError("Error with finding element in read array")
        }
        contacts.remove(at: contactIndex.hashValue)
        // again -- does this work, actually? hashValue and the throwing firstIndex
        
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    
    private func saveToPersistentStore() {
        guard let url = contactListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(contacts)
            try data.write(to: url)
        } catch {
            NSLog("Contacts not encoded: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = contactListURL, fm.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedContacts = try decoder.decode([Contact].self, from: data)
            contacts = decodedContacts
        } catch {
            NSLog("Contacts not decoded: \(error)")
        }
    }
    
    // MARK: - Properties
    
    var currentContact: Contact?
    var contacts: [Contact] = []
    
    private var contactListURL: URL? {
        let fm = FileManager.default
        guard let documentsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentsDir.appendingPathComponent("ContactList.plist")
    }
    
}
