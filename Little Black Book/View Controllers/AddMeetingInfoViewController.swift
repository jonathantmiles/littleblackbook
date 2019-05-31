//
//  AddMeetingInfoViewController.swift
//  Little Black Book
//
//  Created by Jonathan T. Miles on 5/22/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import UIKit

class AddMeetingInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Settable properties
    
    // pickers for category
    
    @IBAction func changeMeetingCategory(_ sender: Any) {
        // present a modal popover?
    }
    
    // date
    
    // map interface kit or new textField
    
    
    @IBAction func continueToNextVC(_ sender: Any) {
        // these functions may not need to exist; put all their code in the prepare(for segue:)
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? AddMeetingDetailsViewController else { return }
        
        destVC.contactController = self.contactController
    }

    
    // MARK : - Properties
    
    var contactController: ContactController?

}
