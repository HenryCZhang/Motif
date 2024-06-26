//
//  SampleDetailView.swift
//  Motif
//
//  Created by Pan Weiheng on 2020/4/9.
//  Updated by Cao Zhang & Lunjie Li

import SwiftUI
import Surge
import SwiftUICharts //ChartView

struct SampleDetailView: View {
    var sample: MotionDataSample
    
    init(sample: MotionDataSample) {
        self.sample = sample
    }
    
    @State var showAccelerationFFT = false
    
    @State var isShowingShareActionSheet = false
    @State var isShowingShareActivitySheet = false
    @State var shareActivitySheetFileFormat: ShareSampleActivityView.FileFormat = .csv
    @State private var isLoading = false
    @State private var buttonHidden = false
    @State private var accFFT:[[(Double,Double)]] = []
    
    func getFFT(sample: MotionDataSample) {
        isLoading = true
        DispatchQueue.main.async {
            let x = sample.entries.enumerated().map { (index,element) in
                (element.accelerometerData.timeSinceBoot, Surge.fft(sample.entries.map {$0.accelerometerData.acceleration.x})[index]) }
            let y = sample.entries.enumerated().map { (index,element) in
                (element.accelerometerData.timeSinceBoot, Surge.fft(sample.entries.map {$0.accelerometerData.acceleration.y})[index]) }
            let z = sample.entries.enumerated().map { (index,element) in
                (element.accelerometerData.timeSinceBoot, Surge.fft(sample.entries.map {$0.accelerometerData.acceleration.z})[index]) }
            self.accFFT.append(contentsOf: [x,y,z])
            isLoading = false
        }
    }
    
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
                    NavigationLink(destination: PlotDetailView(data: sample.entries.map {
                        $0.accelerometerData.acceleration.x }, label: "Acceleration X",xLabel:"t(s)")) {
                            VStack {//testing
                                LineChart(
                                    data: sample.entries.map {
                                        ($0.accelerometerData.timeSinceBoot, $0.accelerometerData.acceleration.x) })
                                .frame(height: 100)
                                Text("x").font(.headline)
                            }.padding([.top, .bottom])
                        }

                    NavigationLink(destination: PlotDetailView(data: sample.entries.map {
                        $0.accelerometerData.acceleration.y }, label: "Acceleration Y", xLabel:"t(s)")) {
                            VStack {//testing
                                LineChart(
                                    data: sample.entries.map {
                                        ($0.accelerometerData.timeSinceBoot, $0.accelerometerData.acceleration.y) })
                                .frame(height: 100)
                                Text("y").font(.headline)
                            }.padding([.top, .bottom])
                        }

                    NavigationLink(destination: PlotDetailView(data: sample.entries.map {
                        $0.accelerometerData.acceleration.z }, label: "Acceleration Z",xLabel:"t(s)")) {
                            VStack {//testing
                                LineChart(
                                    data: sample.entries.map {
                                        ($0.accelerometerData.timeSinceBoot, $0.accelerometerData.acceleration.z) })
                                .frame(height: 100)
                                Text("z").font(.headline)
                            }.padding([.top, .bottom])
                        }


                    //Horizontally aligned FFT graphs
                    if (!buttonHidden){
                        Button("Show FFT"){
                            getFFT(sample: sample)
                            buttonHidden = true
                        }
                    }
                    if isLoading {
                        LoadingView()//code at  the bottom
                    }
                    if(!isLoading && accFFT.count == 3){

                        NavigationLink(destination: PlotDetailView(data: accFFT[0].enumerated().map{
                            (index,element) in(
                                element.1
                            )
                        }, label: "Acceleration FFT X",xLabel:"f(Hz)")) {
                            VStack {//testing
                                VStack {
                                    LineChart(
                                        data: accFFT[0] )
                                    .frame(height: 100)
                                    Text("x-FFT").font(.headline)
                                }.padding([.top, .bottom])
                            }
                        }

                        NavigationLink(destination: PlotDetailView(data: accFFT[0].enumerated().map{
                            (index,element) in(
                                element.1
                            )
                        }, label: "Acceleration FFT Y",xLabel:"f(Hz)")) {
                            VStack {//testing
                                VStack {
                                    LineChart(
                                        data: accFFT[1] )
                                    .frame(height: 100)
                                    Text("y-FFT").font(.headline)
                                }.padding([.top, .bottom])
                            }
                        }

                        NavigationLink(destination: PlotDetailView(data: accFFT[0].enumerated().map{
                            (index,element) in(
                                element.1
                            )
                        }, label: "Acceleration FFT Z",xLabel:"f(Hz)")) {
                            VStack {//testing
                                VStack {
                                    LineChart(
                                        data: accFFT[2] )
                                    .frame(height: 100)
                                    Text("z-FFT").font(.headline)
                                }.padding([.top, .bottom])
                            }
                        }

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
        if(isLoading){
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle())
                .font(.largeTitle)
                .blur(radius: 25)
        }
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

struct LoadingView: View{
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(2)
        }
    }
}
