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
    
    init(data: [Double], label:String) {
        self.data = data
        self.label = label
    }

    var body: some View {
        LineView(data: data, title: label, legend: "Full screen")
    }
}


struct PlotDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlotDetailView(data: [1,3,4,2,1], label:"Acceleration X")
    }
}
