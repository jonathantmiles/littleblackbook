//
//  AddContactInfoViewController.swift
//  Little Black Book
//
//  Created by Jonathan T. Miles on 5/22/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import UIKit

class AddContactInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func chooseContactMethod(_ sender: Any) {
        // save contact name?
        
        // reveal buttons
    }
    
    @IBAction func showEmailField(_ sender: Any) {
    }
    
    @IBAction func showTwitterField(_ sender: Any) {
    }
    
    @IBAction func showPhoneField(_ sender: Any) {
    }
    
    @IBAction func showPhysicalAddressField(_ sender: Any) {
    }
    
    @IBAction func showAllFields(_ sender: Any) {
    }
    
    @IBAction func continueToNextVC(_ sender: Any) {
        // create new Contact from contactController
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // pass relevant controllers to next VC
    }
    
    // MARK: - Properties
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var twitterHandleField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var physicalAddressField: UITextField!
    
    
}
