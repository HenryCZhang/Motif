//
//  SampleDetailView.swift
//  Motif
//
//  Created by Pan Weiheng on 2020/4/9.
//

import SwiftUI
import Surge

struct SampleDetailView: View {
    var sample: MotionDataSample
    
    init(sample: MotionDataSample) {
        self.sample = sample
    }
    
    @State var isShowingShareActionSheet = false
    @State var isShowingShareActivitySheet = false
    @State var shareActivitySheetFileFormat: ShareSampleActivityView.FileFormat = .csv
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        return formatter
    }()
    let dateComponentsFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
    
    var dateString: String { dateFormatter.string(from: sample.firstTimestamp!) }
    
    var body: some View {
        List {
            
            Section(header: Text("Metadata").font(.subheadline).bold()) {
                ItemRow(name: "Start time",
                        value: self.dateString)
                ItemRow(name: "Duration",
                        value: dateComponentsFormatter.string(from: sample.duration!)!)
                ItemRow(name: "Sampling rate",
                        value: "\(Int(sample.samplingRate)) Hz")
                ItemRow(name: "No. of entries",
                        value: "\(sample.entries.count)")
            }
            
            if(sample.entries.first?.accelerometerData?.acceleration.x != nil){
                Section(header: Text("Raw Acceleration").font(.subheadline).bold()) {
                    HStack{
                        VStack {
                            LineChart(
                                data: sample.entries.map {
                                    ($0.accelerometerData.timeSinceBoot, $0.accelerometerData.acceleration.x) })
                            .frame(height: 100)
                            Text("x").font(.headline)
                        }.padding([.top, .bottom])
                        VStack {
                            LineChart(
                                data: sample.entries.enumerated().map { (index,element) in
                                    (element.accelerometerData.timeSinceBoot, element.accelerometerData.acceleration.y) })
                            .frame(height: 100)
                            Text("y").font(.headline)
                        }.padding([.top, .bottom])
                        VStack {
                            LineChart(
                                data: sample.entries.enumerated().map { (index,element) in
                                    (element.accelerometerData.timeSinceBoot, element.accelerometerData.acceleration.z) })
                            .frame(height: 100)
                            Text("z").font(.headline)
                        }.padding([.top, .bottom])
                    }
                    //Horizontally aligned FFT graphs
                    HStack {
                        VStack {
                            LineChart(
                                data: sample.entries.enumerated().map { (index,element) in
                                    (element.accelerometerData.timeSinceBoot, Surge.fft(sample.entries.map {$0.accelerometerData.acceleration.x})[index]) })
                            .frame(height: 100)
                            Text("x-FFT").font(.headline)
                        }.padding([.top, .bottom])
                        VStack {
                            LineChart(
                                data: sample.entries.enumerated().map { (index,element) in
                                    (element.accelerometerData.timeSinceBoot, Surge.fft(sample.entries.map {$0.accelerometerData.acceleration.y})[index]) })
                            .frame(height: 100)
                            Text("y-FFT").font(.headline)
                        }.padding([.top, .bottom])
                        VStack {
                            LineChart(
                                data: sample.entries.enumerated().map { (index,element) in
                                    (element.accelerometerData.timeSinceBoot, Surge.fft(sample.entries.map {$0.accelerometerData.acceleration.z})[index]) })
                            .frame(height: 100)
                            Text("z-FFT").font(.headline)
                        }.padding([.top, .bottom])
                    }
                    //Vertically aligned FFT graphs
//                    HStack {
//                        LineChart(
//                            data: sample.entries.enumerated().map { (index,element) in
//                                (element.accelerometerData.timeSinceBoot, Surge.fft(sample.entries.map {$0.accelerometerData.acceleration.x})[index]) })
//                        .frame(height: 100)
//                        Text("x-FFT").font(.headline)
//                    }.padding([.top, .bottom])
//                    HStack {
//                        LineChart(
//                            data: sample.entries.enumerated().map { (index,element) in
//                                (element.accelerometerData.timeSinceBoot, Surge.fft(sample.entries.map {$0.accelerometerData.acceleration.y})[index]) })
//                        .frame(height: 100)
//                        Text("y-FFT").font(.headline)
//                    }.padding([.top, .bottom])
//                    HStack {
//                        LineChart(
//                            data: sample.entries.enumerated().map { (index,element) in
//                                (element.accelerometerData.timeSinceBoot, Surge.fft(sample.entries.map {$0.accelerometerData.acceleration.z})[index]) })
//                        .frame(height: 100)
//                        Text("z-FFT").font(.headline)
//                    }.padding([.top, .bottom])
                }
            }
            
            if(sample.entries.first?.gyroData?.rotationRate.x != nil){
                Section(header: Text("Raw Rotation Rate").font(.subheadline).bold()) {
                    HStack {
                        VStack {
                            LineChart(
                                data: sample.entries.map { ($0.gyroData.timeSinceBoot, $0.gyroData.rotationRate.x) })
                            .frame(height: 100)
                            Text("x").font(.headline)
                        }.padding([.top, .bottom])
                        VStack {
                            LineChart(
                                data: sample.entries.map { ($0.gyroData.timeSinceBoot, $0.gyroData.rotationRate.y) })
                            .frame(height: 100)
                            Text("y").font(.headline)
                        }.padding([.top, .bottom])
                        VStack {
                            LineChart(
                                data: sample.entries.map { ($0.gyroData.timeSinceBoot, $0.gyroData.rotationRate.z) })
                            .frame(height: 100)
                            Text("z").font(.headline)
                        }.padding([.top, .bottom])
                    }
                }
            }
            
            if(sample.entries.first?.magnetometerData?.magneticField.x != nil){
                Section(header: Text("Raw Magnetic Field").font(.subheadline).bold()) {
                    HStack {
                        HStack {
                            LineChart(
                                data: sample.entries.map { ($0.magnetometerData.timeSinceBoot, $0.magnetometerData.magneticField.x) })
                            .frame(height: 100)
                            Text("x").font(.headline)
                        }.padding([.top, .bottom])
                        HStack {
                            LineChart(
                                data: sample.entries.map { ($0.magnetometerData.timeSinceBoot, $0.magnetometerData.magneticField.y) })
                            .frame(height: 100)
                            Text("y").font(.headline)
                        }.padding([.top, .bottom])
                        HStack {
                            LineChart(
                                data: sample.entries.map { ($0.magnetometerData.timeSinceBoot, $0.magnetometerData.magneticField.z) })
                            .frame(height: 100)
                            Text("z").font(.headline)
                        }.padding([.top, .bottom])
                    }
                }
            }
            
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(Text(self.dateString), displayMode: .inline)
        .navigationBarItems(trailing:
                                Button(action: {
            self.isShowingShareActionSheet.toggle()
        }) {
            Image(systemName: "square.and.arrow.up")
                .actionSheet(isPresented: $isShowingShareActionSheet, content: { self.shareActionSheet })
        })
        .sheet(isPresented: $isShowingShareActivitySheet, content: {
            ShareSampleActivityView(fileFormat: self.shareActivitySheetFileFormat, samples: [self.sample])
        })
    }
    
    private var shareActionSheet: ActionSheet {
        ActionSheet(title: Text("Share sample as..."), message: nil, buttons: [
            .default(Text("CSV")) {
                self.isShowingShareActivitySheet.toggle()
                self.shareActivitySheetFileFormat = .csv
            },
            .default(Text("JSON")) {
                self.isShowingShareActivitySheet.toggle()
                self.shareActivitySheetFileFormat = .json
            },
            .cancel()
        ])
    }
    
}

struct SampleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SampleDetailView(sample: MotionDataSample.previewSamples[2])
            SampleDetailView(sample: MotionDataSample.previewSamples[2])
                .colorScheme(.dark)
        }
    }
}
