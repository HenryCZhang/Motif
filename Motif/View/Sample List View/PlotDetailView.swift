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
    let chartStyle = ChartStyle(backgroundColor: Color.white, accentColor: Colors.OrangeStart, secondGradientColor: Colors.OrangeEnd, textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.white)
    
    init(data: [Double], label:String, xLabel: String) {
        self.data = data
        self.label = label
        self.xLabel = xLabel
    }
    
    var body: some View {
        VStack {
            VStack{
                LineView(data: data, title: label, legend: "X(f)",       style: chartStyle)
                
                HStack{
                    Text("0")
                        .position(x: 35, y: 170)
                    Text("5")
                        .position(x: 48, y: 170)
                    Text("10")
                        .position(x: 63, y: 170)
                    Text("15")
                        .position(x: 77, y: 170)
                }
            }.frame(height: 390)
            
            //x scale 0-15
            
            
            
            Text(xLabel).padding(.bottom)
        }
    }
}


struct PlotDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlotDetailView(data: [1,3,4,2,1], label:"Acceleration X", xLabel: "f(Hz)")
    }
}
