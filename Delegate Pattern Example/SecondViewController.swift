//
//  SecondViewController.swift
//  Delegate Pattern Example
//
//  Created by Antonio on 18/10/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import UIKit

protocol ExampleProtocolDelegate: class {
    func setDate(with date: Date)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: ExampleProtocolDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
    }
    
    func showDatePicker() {
        datePicker.datePickerMode = .date
    }

    // Sets the date when it chages
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        delegate?.setDate(with: self.datePicker.date)
    }
}
