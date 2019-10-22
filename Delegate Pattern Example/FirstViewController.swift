//
//  FirstViewController.swift
//  Delegate Pattern Example
//
//  Created by Antonio on 18/10/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var changeDateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.changeDateButton.layer.cornerRadius = 10
    }
    // Overriding func prepare() to pass data between the two viewcontrollers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let vc = segue.destination as! SecondViewController
            vc.delegate = self
        }
    }

}

// Actual implementation of the method in an extension of the class FirstViewController
extension FirstViewController: ExampleProtocolDelegate {
    func setDate(with date: Date) {
        
        // Formatting the date in order to extrapolate only day, month and year
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year: String = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "MMMM"
        let month: String = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "dd"
        let day: String = dateFormatter.string(from: date)
        
        self.dayLabel.text = "Day: " + day
        self.monthLabel.text = "Month: " + month
        self.yearLabel.text = "Year: " + year
    }
}
