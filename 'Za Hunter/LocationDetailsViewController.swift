//
//  LocationDetailsViewController.swift
//  'Za Hunter
//
//  Created by Ella Wickstrom on 3/4/20.
//  Copyright © 2020 Ella Wickstrom. All rights reserved.
//

import UIKit
import MapKit

class LocationDetailsViewController: UIViewController {
    
    var selectedMapItem = MKMapItem()
    
    @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var addressLabel: UILabel!
        @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedMapItem.name!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = selectedMapItem.placemark.name
        var address = selectedMapItem.placemark.subThoroughfare! + ""
        address += selectedMapItem.placemark.thoroughfare! + "\n"
        address += selectedMapItem.placemark.locality! + ", "
        address += selectedMapItem.placemark.administrativeArea! + " "
        address += selectedMapItem.placemark.postalCode!
        addressLabel.text = address
        phoneLabel.text = selectedMapItem.phoneNumber
    }
    
    
    @IBAction func onDirectionsButtonTapped(_ sender: Any) {
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
        MKMapItem.openMaps(with: [selectedMapItem], launchOptions: launchOptions)
    }
    
}
