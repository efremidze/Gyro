//
//  Gyro.swift
//  Example
//
//  Created by Lasha Efremidze on 1/12/18.
//  Copyright © 2018 Lasha Efremidze. All rights reserved.
//

import UIKit
import CoreMotion

let Gyro = GyroManager.shared

class GyroManager: CMMotionManager {
    static let shared = GyroManager()
    private let queue = OperationQueue()
    func observe(_ observer: @escaping (CGFloat, CGFloat, CGFloat) -> Void) {
        guard isDeviceMotionAvailable else { return }
        deviceMotionUpdateInterval = 0.1
        startDeviceMotionUpdates(to: queue) { data, error in
            guard let data = data else { return }
            DispatchQueue.main.sync {
                let roll = CGFloat(data.attitude.roll.degrees)
                var pitch = CGFloat(data.attitude.pitch.degrees)
                let yaw = CGFloat(data.attitude.yaw.degrees)
                if data.gravity.z > 0 {
                    if pitch > 0 {
                        pitch = 180 - pitch
                    } else {
                        pitch = -(180 + pitch)
                    }
                }
                observer(roll, pitch, yaw)
            }
        }
    }
}

extension FloatingPoint {
    var degrees: Self { return self * 180 / .pi }
}
