//
//  ViewController.swift
//  Navigation
//
//  Created by Webcash on 2019/11/07.
//  Copyright © 2019 Moon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let img1 = UIImage(named: "01.jpeg")
    let img2 = UIImage(named: "02.jpeg")
    var isOn = true

    @IBOutlet weak var txMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = img1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
            
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDoen(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = img1
            self.isOn = true
        } else {
            imgView.image = img2
            self.isOn = false
        }
    }
}

