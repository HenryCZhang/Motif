//
//  RecorderView.swift
//  Motif
//
//  Created by Pan Weiheng on 2020/3/29.
//  Updated by Cao Zhang & Lunjie Li

import Combine
import SwiftUI

struct RecorderView: View {
    
    @EnvironmentObject var recorder: Recorder
    var entry: MotionDataEntry { recorder.currentDataEntry }
        
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        return formatter
    }()
    
    init() {
        // Remove top empty space
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
    }
    
    var body: some View {
        
         NavigationView {
            
            Form {
                if recorder.isRecording == false {
                    
                    // MARK: Record Settings
                    
                    Section {
                        ItemRow(
                            nameView: HStack {
                                Image(systemName: "speedometer")
                                Text("Sampling Rate")
                            },
                            valueView: Text("\(Int(recorder.setting.samplingRate)) Hz"))
                        Slider(value: $recorder.setting.samplingRate, in: 1 ... 200, step: 1)
                    }
                    
                    Section{
                        Toggle(isOn: $recorder.setting.accelerationToggle.animation()) {
                            Text("Acceleration")
                        }
//                        Toggle(isOn: $recorder.setting.rotationRateToggle.animation()) {
//                            Text("Rotation Rate")
//                        }
//                        Toggle(isOn: $recorder.setting.magneticFieldToggle.animation()) {
//                            Text("Magnetic Field")
//                        }
                    }
                    
                    
                } else {
                    
                    // MARK: Data Display
                    
                    Section(header: Text("Time").font(.subheadline).bold()) {
                        ItemRow(name: "Start Time", value: dateFormatter.string(from: recorder.currentDataRecord!.startTime))
                        ItemRow(name: "Time Elapsed", value: "\(Int(Date().timeIntervalSince(recorder.currentDataRecord!.startTime)))s")
                    }
                    
                    if entry.accelerometerData != nil && recorder.setting.accelerationToggle {
                        Section(header: Text("Acceleration").font(.subheadline).bold()) {
                            ItemRow(name: "timestamp", value: dateFormatter.string(from: entry.accelerometerData.timestamp))
                            ItemRow(name: "x", value: "\(entry.accelerometerData.acceleration.x) G")
                            ItemRow(name: "y", value: "\(entry.accelerometerData.acceleration.y) G")
                            ItemRow(name: "z", value: "\(entry.accelerometerData.acceleration.z) G")
                        }
                    }
                
                }
                
                // MARK: Start/Stop Button
                
                HStack {
                    Spacer()
                    
                    Toggle(isOn: $recorder.isRecording.animation()) {
                        Text(recorder.isRecording ? "Stop" : "Start")
                            .bold()
                            .animation(nil)
                    }
                    .toggleStyle(CircularToggleStyle(sideLength: 60))
                    .padding(10)
                    .disabled(!(recorder.setting.accelerationToggle || recorder.setting.rotationRateToggle || recorder.setting.magneticFieldToggle))
                    
                    Spacer()
                }
            }
            .navigationTitle(recorder.isRecording ? "Recording" : "Record")
            .navigationBarItems(trailing:
                Button(self.recorder.isRecording ? "Stop" : "") {
                    self.recorder.isRecording = false
                    #if DEBUG
                    print("set")
                    #endif
            })
        }
    }
}

struct CircularToggleStyle: ToggleStyle {
    var sideLength: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: sideLength, height: sideLength)
            .padding()
            .foregroundColor(.white)
            .background(configuration.isOn ? Color.red : Color.accentColor)
            .cornerRadius(sideLength)
            .onTapGesture {
                configuration.$isOn.wrappedValue.toggle()
        }
    }
}

struct RecorderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecorderView()
                .environmentObject(Recorder())
            
            RecorderView()
                .environmentObject(Recorder())
                .colorScheme(.dark)
        }
    }
}
