//
//  AddMeetingDetailsViewController.swift
//  Little Black Book
//
//  Created by Jonathan T. Miles on 5/22/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import UIKit

class AddMeetingDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneWritingNotes(_ sender: Any) {
        // save/complete meeting record object
        
        // only needs saving methods; that should let the main contactController still find records from plist saving
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Properties
    
    var contactController: ContactController?
    
    @IBOutlet weak var prompt1TextView: UITextView!
    @IBOutlet weak var prompt1TextField: UILabel!
}
