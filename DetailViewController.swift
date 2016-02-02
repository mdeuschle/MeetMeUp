//
//  DetailViewController.swift
//  MeetMeUpSwift
//
//  Created by Matt Deuschle on 2/1/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var rsvpLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextView!

    // dictionary from root vc
    var event:NSDictionary?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = event?.objectForKey("name") as? String
        let rsvpCount:NSNumber = event?.objectForKey("yes_rsvp_count") as! NSNumber
        let rsvpCountAsString:String = String(format:"%@", rsvpCount)
        let eventDescription:String = (event?.objectForKey("description") as? String)!
        rsvpLabel.text = rsvpCountAsString
        descriptionTextField.text = eventDescription
        infoLabel.text = event?.objectForKey("venue")?.objectForKey("name") as? String
    }
}
