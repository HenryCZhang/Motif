//
//  Recorder.swift
//  Motif
//
//  Created by Pan Weiheng on 2020/4/1.
//

import Foundation
import Combine
import CoreMotion

class Recorder: ObservableObject {
    
    struct RecordSetting {
        var samplingRate: Double = 200
        var useTimer: Bool = false
        var endTime: Date = Date()
        var accelerationToggle: Bool = true
        var rotationRateToggle: Bool = true
        var magneticFieldToggle: Bool = true
    }
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let manager = CMMotionManager()
    private var timerSubscription: AnyCancellable? = nil
    var samplingInterval: Double { 1.0 / setting.samplingRate }
    
    @Published var setting = RecordSetting()
    @Published var isRecording = false {
        willSet {
            newValue ? startRecording() : stopRecording()
        }
    }
    @Published var currentDataEntry = MotionDataEntry()
    private(set) var currentDataRecord: MotionDataSample?
    @Published var samples = [MotionDataSample]() {
        didSet {
            saveSampleListToDisk()
        }
    }
    
    private let sampleListFileName = "sampleList.json"
    private var sampleListFileURL: URL {
        FileManager.default.documentDirectoryURL(appending: sampleListFileName)
    }
    
    // MARK: - Initializer
    
    init() {
        loadSampleListFromDisk()
    }
    
    // MARK: - Methods
    
    private func startRecording() {
        
        guard manager.isDeviceAvailable == true else { return }
        
        // Set sampling intervals
        manager.accelerometerUpdateInterval = samplingInterval
//        manager.gyroUpdateInterval          = samplingInterval
//        manager.magnetometerUpdateInterval  = samplingInterval

        
        // Start data updates
        if (setting.accelerationToggle){
            manager.startAccelerometerUpdates()
        }
//        if (setting.rotationRateToggle){
//            manager.startGyroUpdates()
//        }
//        if (setting.magneticFieldToggle){
//            manager.startMagnetometerUpdates()
//        }
//        if (setting.extraDataToggle){
//            manager.startDeviceMotionUpdates(using: .xTrueNorthZVertical)
//        }
        
        // Initialize data storage
        currentDataRecord = MotionDataSample(startTime: Date(), samplingRate: setting.samplingRate)
        
        // Activate timer
        DispatchQueue.main.async {
            self.timerSubscription = Timer.publish(every: self.samplingInterval, on: .main, in: .common)
                .autoconnect()
                .sink { date in
                    
                    let accelerometerData = self.manager.accelerometerData
//                    let gyroData = self.manager.gyroData
//                    let magnetometerData = self.manager.magnetometerData
                    
                    self.currentDataEntry = MotionDataEntry(
                        accelerometerData: accelerometerData,
                        accelerationToggle: self.setting.accelerationToggle
//                        gyroData: gyroData,
//                        rotationRateToggle: self.setting.rotationRateToggle,
//                        magnetometerData: magnetometerData,
//                        magneticFieldToggle: self.setting.magneticFieldToggle
                    )
                    // Save motion data to entry and record
                    self.currentDataRecord?.addEntry(self.currentDataEntry)
                }
        }
    }
    
    private func stopRecording() {
        
        guard manager.isDeviceAvailable == true else { return }
        
        // Invalidate timer
        timerSubscription?.cancel()
        
        // Stop data updates
        manager.stopAccelerometerUpdates()
//        manager.stopGyroUpdates()
//        manager.stopMagnetometerUpdates()
//        manager.stopDeviceMotionUpdates()
        
        // Add new record to record list
        guard let record = currentDataRecord else { return }
        samples.insert(record, at: 0)
        
#if DEBUG
        print("Appended sample to samples. Samples count: \(samples.count)")
        
        // Print JSON of sample
        //        var data: Data
        //        do {
        //            data = try encoder.encode(samples)
        //        } catch {
        //            print("Failed to encode recordList.")
        //            return
        //        }
        //        let string = String(data: data, encoding: .utf8)!
        //        print(string)
#endif
        
        // Clear motion data
        currentDataEntry = MotionDataEntry()
        currentDataRecord = nil
    }
    
    private func saveSampleListToDisk() {
        
        // Encode samples to JSON data
        var data: Data
        do {
            data = try encoder.encode(samples)
        } catch {
            print("Failed to encode recordList.")
            return
        }
        
        // Write data to disk
        do {
            try data.write(to: sampleListFileURL)
        } catch {
            print("Failed to write recordList data to URL.")
        }
        
#if DEBUG
        print("Sample list saved to disk with \(samples.count) samples")
#endif
        
    }
    
    private func loadSampleListFromDisk() {
        
        // Read data from disk
        var data: Data
        do {
            data = try Data(contentsOf: sampleListFileURL)
        } catch {
#if DEBUG
            print("Failed to read recordList data from disk.")
#endif
            return
        }
        
        // Decode JSON data
        var list: [MotionDataSample]
        do {
            list = try decoder.decode([MotionDataSample].self, from: data)
        } catch {
            print("Failed to decode recordList data.")
            return
        }
        
        // Restore list
        samples = list
    }
    
}

extension CMMotionManager {
    
    var isDeviceAvailable: Bool {
        return isAccelerometerAvailable
//        && isGyroAvailable
//        && isMagnetometerAvailable
    }
}
