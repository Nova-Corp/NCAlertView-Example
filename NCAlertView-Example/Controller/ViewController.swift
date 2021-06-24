//
//  ViewController.swift
//  NCAlertView-Example
//
//  Created by ADMIN on 24/06/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let message = "Hello vnsvns snvklsnlv vsnvls vsvnsl vsvnslv vflsnvs vsv vs vsvs vs svs. vsv s vsvs vsvssv ssgsgs sgbg."
    
    let btn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Hello", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    
    let btn1: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("OK", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.addTarget(self, action: #selector(hideAlert), for: .touchUpInside)
        return btn
    }()
    
    @IBAction func alertButtonTapped(_ sender: UIButton) {
        let buttons = [btn, btn1]
        makeAlert(message: message,
                  actionButtons: buttons,
                  animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
    }
}

