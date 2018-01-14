//
//  ViewController.swift
//  Example
//
//  Created by Lasha Efremidze on 1/12/18.
//  Copyright © 2018 Lasha Efremidze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Gyro.observe { [weak self] roll, pitch, yaw in
            guard let `self` = self else { return }
            print("roll \(roll)")
            print("pitch \(pitch)")
            print("yaw \(yaw)")
        }
    }

}

