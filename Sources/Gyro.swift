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
    open func observe(_ observer: @escaping (_ roll: Double, _ pitch: Double, _ yaw: Double) -> Void) {
        guard isDeviceMotionAvailable else { return }
        deviceMotionUpdateInterval = 1 / 60
        startDeviceMotionUpdates(to: queue) { data, error in
            guard let data = data else { return }
            var pitch = data.attitude.pitch
            if data.gravity.z > 0 {
                if pitch > 0 {
                    pitch = .pi - pitch
                } else {
                    pitch = -(.pi + pitch)
                }
            }
            DispatchQueue.main.sync {
                observer(data.attitude.roll, pitch, data.attitude.yaw)
            }
        }
    }
}

public extension FloatingPoint {
    var degrees: Self { return self * 180 / .pi }
}
