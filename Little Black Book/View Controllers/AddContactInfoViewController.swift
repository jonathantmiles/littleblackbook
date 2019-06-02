//
//  AddContactInfoViewController.swift
//  Little Black Book
//
//  Created by Jonathan T. Miles on 5/22/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import UIKit

class AddContactInfoViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupHideElements()
    }
    
    @IBAction func chooseContactMethod(_ sender: Any) {
        revealContactOptions()
        chooseContactMethodButton.isHidden = true
    }
    
    @IBAction func showEmailField(_ sender: Any) {
        emailStackView.isHidden = false
        hideContactButtons()
    }
    
    @IBAction func showTwitterField(_ sender: Any) {
        twitterStackView.isHidden = false
        hideContactButtons()
    }
    
    @IBAction func showPhoneField(_ sender: Any) {
        phoneStackView.isHidden = false
        hideContactButtons()
    }
    
    @IBAction func showPhysicalAddressField(_ sender: Any) {
        addressStackView.isHidden = false
        hideContactButtons()
    }
    
    @IBAction func showAllFields(_ sender: Any) {
        emailStackView.isHidden = false
        twitterStackView.isHidden = false
        phoneStackView.isHidden = false
        addressStackView.isHidden = false
        hideContactButtons()
        showAllBusinessCardButton.isHidden = false
    }
    
    @IBAction func continueToNextVC(_ sender: Any) {
        // create new Contact from contactController
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // pass relevant controllers to next VC
        guard let destVC = segue.destination as? AddMeetingInfoViewController else { return }
        
        // make a new contact; unwrapping sets values to ""
        guard let contactController = contactController,
            let name = nameField.text,
            let emailAddress = emailAddressField.text,
            let twitterHandle = twitterHandleField.text,
            let phoneNumber = phoneNumberField.text,
            let physicalAddress = physicalAddressField.text else { return }
        
        contactController.createNewContact(name: name, company: nil, roleOrField: nil, hobby: nil, emailAddress: emailAddress, phoneNumber: phoneNumber, twitterHandle: twitterHandle, physicalAddress: physicalAddress)
        
        destVC.contactController = contactController
    }
    
    // MARK: - Helpers and Algorithms
    
    private func setupHideElements() {
        emailStackView.isHidden = true
        twitterStackView.isHidden = true
        phoneStackView.isHidden = true
        addressStackView.isHidden  = true
        
        enterEmailButton.isHidden = true
        enterTwitter.isHidden = true
        enterPhone.isHidden = true
        enterAddressButton.isHidden = true
        showAllBusinessCardButton.isHidden = true
    }
    
    private func revealContactOptions() {
        // possible animation to stagger these so they cascade down
        enterEmailButton.isHidden = false
        enterTwitter.isHidden = false
        enterPhone.isHidden = false
        enterAddressButton.isHidden = false
        showAllBusinessCardButton.isHidden = false
    }
    
    private func hideContactButtons() {
        enterEmailButton.isHidden = true
        enterTwitter.isHidden = true
        enterPhone.isHidden = true
        enterAddressButton.isHidden = true
        showAllBusinessCardButton.titleLabel?.text = "Show Other Contacts"
    }
    
    // MARK: - Properties
    
//    var contact: Contact?
    var contactController: ContactController?
    
    // TextField Outlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var twitterHandleField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var physicalAddressField: UITextField!
    
    // Button Outlets
    @IBOutlet weak var chooseContactMethodButton: UIButton!
    @IBOutlet weak var enterEmailButton: UIButton!
    @IBOutlet weak var enterTwitter: UIButton!
    @IBOutlet weak var enterPhone: UIButton!
    @IBOutlet weak var enterAddressButton: UIButton!
    @IBOutlet weak var showAllBusinessCardButton: UIButton!
    
    // Stack Views
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var twitterStackView: UIStackView!
    @IBOutlet weak var phoneStackView: UIStackView!
    @IBOutlet weak var addressStackView: UIStackView!
    
}
