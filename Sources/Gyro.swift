//
//  Gyro.swift
//  Gyro
//
//  Created by Lasha Efremidze on 1/12/18.
//  Copyright © 2018 Lasha Efremidze. All rights reserved.
//

import UIKit
import CoreMotion

public let Gyro = GyroManager.shared

open class GyroManager: CMMotionManager {
    open static let shared = GyroManager()
    private let queue = OperationQueue()
    open func observe(_ observer: @escaping (CGFloat, CGFloat, CGFloat) -> Void) {
        guard isDeviceMotionAvailable else { return }
        deviceMotionUpdateInterval = 0.1
        startDeviceMotionUpdates(to: queue) { data, error in
            guard let data = data else { return }
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
            DispatchQueue.main.sync {
                observer(roll, pitch, yaw)
            }
        }
    }
}

extension FloatingPoint {
    var degrees: Self { return self * 180 / .pi }
}
