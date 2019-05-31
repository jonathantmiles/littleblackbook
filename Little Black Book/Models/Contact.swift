//
//  Contact.swift
//  Little Black Book
//
//  Created by Jonathan T. Miles on 5/22/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import Foundation
import Photos

struct Contact: Encodable {
    var name: String
    var company: String?
    var roleOrField: String?
    var hobby: String?
//    var picture: UIImage?
    
    var emailAddress: String?
    var phoneNumber: String?
    var twitterHandle: String? // social media framework object?
    var physicalAddress: String?
    
    // characterization properties go here
}
