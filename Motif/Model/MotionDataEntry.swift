//
//  MotionDataEntry.swift
//  Motif
//
//  Created by Pan Weiheng on 2020/4/1.
//

import CoreMotion

struct MotionDataEntry: Codable, Equatable, Hashable, Identifiable {
    
    var id = UUID()
    var accelerometerData: AccelerometerData! = nil
//    var gyroData:          GyroData!          = nil
//    var magnetometerData:  MagnetometerData!  = nil
    
    static let acc: [(PartialKeyPath<MotionDataEntry>, String)] = [
        /* Accelerometer */
        
        (\MotionDataEntry.accelerometerData?.timestamp,                             "accelerometerTimestamp"),
        (\MotionDataEntry.accelerometerData?.timeSinceBoot,                         "accelerometerTimeSinceBoot"),
        
        (\MotionDataEntry.accelerometerData?.acceleration.x,                        "rawAccelerationX"),
        (\MotionDataEntry.accelerometerData?.acceleration.y,                        "rawAccelerationY"),
        (\MotionDataEntry.accelerometerData?.acceleration.z,                        "rawAccelerationZ")
    ]
    
//    static let gyro: [(PartialKeyPath<MotionDataEntry>, String)] = [
//        /* Gyroscope */
//
//        (\MotionDataEntry.gyroData?.timestamp,                                      "gyroscopeTimestamp"),
//        (\MotionDataEntry.gyroData?.timeSinceBoot,                                  "gyroscopeTimeSinceBoot"),
//
//        (\MotionDataEntry.gyroData?.rotationRate.x,                                 "rawRotationRateX"),
//        (\MotionDataEntry.gyroData?.rotationRate.y,                                 "rawRotationRateY"),
//        (\MotionDataEntry.gyroData?.rotationRate.z,                                 "rawRotationRateZ")
//    ]
//
//    static let magnet: [(PartialKeyPath<MotionDataEntry>, String)] = [
//        /* Magnetometer */
//
//        (\MotionDataEntry.magnetometerData?.timestamp,                              "magnetometerTimestamp"),
//        (\MotionDataEntry.magnetometerData?.timeSinceBoot,                          "magnetometerTimeSinceBoot"),
//        (\MotionDataEntry.magnetometerData?.magneticField.x,                        "rawMagneticFieldX"),
//        (\MotionDataEntry.magnetometerData?.magneticField.y,                        "rawMagneticFieldY"),
//        (\MotionDataEntry.magnetometerData?.magneticField.z,                        "rawMagneticFieldZ"),
//    ]
    

    static var keyPathsAndTitles: [(PartialKeyPath<MotionDataEntry>, String)] = []
    
    init(accelerometerData: CMAccelerometerData?, accelerationToggle: Bool) {
        if (accelerationToggle){
            MotionDataEntry.keyPathsAndTitles.append(contentsOf: MotionDataEntry.acc)
            self.accelerometerData = AccelerometerData(fromData: accelerometerData!)
        }
//        if (rotationRateToggle){
//            MotionDataEntry.keyPathsAndTitles.append(contentsOf: MotionDataEntry.gyro)
//            self.gyroData = GyroData(fromData: gyroData!)
//        }
//        if(magneticFieldToggle){
//            MotionDataEntry.keyPathsAndTitles.append(contentsOf: MotionDataEntry.magnet)
//            self.magnetometerData = MagnetometerData(fromData: magnetometerData!)
//        }
    }
    
    init() {}
    
}
