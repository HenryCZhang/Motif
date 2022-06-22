//
//  PlotDetailView.swift
//  Motif
//
//  Created by Zhang Cao on 2022-06-17.
//  Copyright © 2022 PAN Weiheng. All rights reserved.
//

import SwiftUI
import SwiftUICharts 

struct PlotDetailView: View {
    
    var data: [Double]
    var label: String
    var xLabel: String
    
    init(data: [Double], label:String, xLabel: String) {
        self.data = data
        self.label = label
        self.xLabel = xLabel
    }

    var body: some View {
        VStack {
            VStack{
                LineView(data: data, title: label, legend: "X(f)")
            }.frame(height: 350)
            
            Text(xLabel).padding(.bottom)
        }
    }
}


struct PlotDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlotDetailView(data: [1,3,4,2,1], label:"Acceleration X", xLabel: "f(Hz)")
    }
}
