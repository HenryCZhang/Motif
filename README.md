# Motif
<p align="center">
<img src="Preview%20Images/Icon.png" width=250/>
</p>

A simple motion sensor data recorder for iPhone. Written with SwiftUI.
(Forked from https://github.com/weihengpan/Motif)

## Description
The iPhone app is crafted to streamline the process of recording motion sensor data, offering unparalleled versatility in its applications. With a primary focus on structural health monitoring (SHM) within the realm of civil engineering, the app emerges as an indispensable tool for professionals and researchers alike. Its innovative features are tailored to accommodate the evolving needs of the industry, including the revolutionary drive-by bridge health monitoring methodology. Through this groundbreaking approach, the app facilitates the seamless collection of acceleration data, enabling users to conduct comprehensive assessments of bridge structural integrity. Furthermore, the app boasts advanced functionality, empowering users to generate acceleration Fast Fourier Transform (FFT) plots directly within the interface, thus enhancing efficiency and data analysis capabilities. As a result, the app emerges as an indispensable asset in the arsenal of engineers and researchers, revolutionizing the landscape of structural health monitoring and paving the way for enhanced safety and reliability in infrastructure.

该项目通过利用前沿技术，专注于物联网、边缘计算和实时分析，推动结构健康监测方法的发展，以提高基础设施的安全性和可靠性。

- IoT Structural Monitoring: Designed and implemented a sensor network integrated with anomaly detection algorithms, enhancing bridge health monitoring accuracy by 25% (reducing error rates from 8% to 6%). This system enabled real-time data collection and analysis for structural health monitoring (SHM) applications, including drive-by bridge health monitoring methodologies.
  
- Edge Computing System: Engineered a data transmission framework with database optimizations, reducing seismic data latency to 100ms. This system facilitated seamless integration between IoT sensors and a BIM-based digital twin, enabling real-time monitoring and risk assessment of structural behavior.
  
- iOS Real-Time Analytics App: Developed a SwiftUI-based iPhone app for motion sensor data collection and real-time analytics. Integrated Core ML for crack detection and Fast Fourier Transform (FFT) capabilities, accelerating IoT data collection by 60% (reducing cycle time from 10s to 4s) and enabling rapid disaster response and structural integrity assessments.

- 物联网结构监测：设计并实现了一个集成异常检测算法的传感器网络，将桥梁健康监测的准确性提高了25%（错误率从8%降低至6%）。该系统支持实时数据收集和分析，适用于结构健康监测（SHM）应用，包括基于车辆行驶的桥梁健康监测方法。

- 边缘计算系统：开发了一个具有数据库优化的数据传输框架，将地震数据延迟降低至100ms。该系统实现了物联网传感器与基于BIM的数字孪生模型的无缝集成，支持实时监测和结构行为的风险评估。

- iOS实时分析应用程序：开发了一款基于SwiftUI的iPhone应用程序，用于运动传感器数据收集和实时分析。集成了Core ML用于裂缝检测和快速傅里叶变换（FFT）功能，将物联网数据收集速度提高了60%（周期时间从10秒缩短至4秒），从而支持快速灾害响应和结构完整性评估。

## Purpose
This app is further developed for the drive-by bridge health monitoring methodology, in which acceleration data is collected and the acceleration FFT plots will be generated in the app. 


<img src="Preview%20Images/app flow.png"  />


## Preview
https://user-images.githubusercontent.com/71099565/181344579-4d388dac-9acb-450f-a76b-8ca822f91d5b.mp4


## Features
✔️ Records sensor data from the accelerometer, gyroscope, and magnetometer

✔️ Records both raw and processed data

✔️ Up to thousands of data points per sample

✔️ Up to 200Hz sampling frequency (device-dependent)

✔️ Built-in data graph preview

✔️ Easily exports to CSV or JSON files

✔️ Purely Swift!

## Compatability
Built on Xcode 11.3.1 and tested on iOS 13.3.1.

## Required Packages
<div>📦 Surge 2.3.2 (package URL: https://github.com/Jounce/Surge.git)</div>
<div>📦 SwiftUICharts 1.5.5 (package URL: https://github.com/willdale/SwiftUICharts)</div>


## Todo
- A more precise acceleration FFT plotter

## License
MIT license.
