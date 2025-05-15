# Motif
<p align="center">
<img src="Preview%20Images/Icon.png" width=250/>
</p>

A simple motion sensor data recorder for iPhone. Written with SwiftUI.
(Forked from https://github.com/weihengpan/Motif)

## Project Research Paper
[Recent Advancements and Future Trends in Indirect Bridge Health Monitoring](https://www.researchgate.net/publication/367762536_Recent_Advancements_and_Future_Trends_in_Indirect_Bridge_Health_Monitoring)

## Description
The iPhone app is crafted to streamline the process of recording motion sensor data, offering unparalleled versatility in its applications. With a primary focus on structural health monitoring (SHM) within the realm of civil engineering, the app emerges as an indispensable tool for professionals and researchers alike. Its innovative features are tailored to accommodate the evolving needs of the industry, including the revolutionary drive-by bridge health monitoring methodology. Through this groundbreaking approach, the app facilitates the seamless collection of acceleration data, enabling users to conduct comprehensive assessments of bridge structural integrity. Furthermore, the app boasts advanced functionality, empowering users to generate acceleration Fast Fourier Transform (FFT) plots directly within the interface, thus enhancing efficiency and data analysis capabilities. As a result, the app emerges as an indispensable asset in the arsenal of engineers and researchers, revolutionizing the landscape of structural health monitoring and paving the way for enhanced safety and reliability in infrastructure.

* Researched and implemented the drive-by bridge health monitoring methodology based on requirements from a civil engineering professor, applied to Structural Health Monitoring (SHM) to enhance the efficiency of infrastructure safety assessments.
* Independently learned iOS development and built an iPhone application using SwiftUI and Xcode , enabling real-time motion sensor data collection and analysis, including acceleration and gyroscope data logging.
* Integrated Fast Fourier Transform (FFT) functionality for frequency-domain data analysis, significantly improving data processing efficiency.
* Successfully reduced IoT data acquisition cycle time from 10 seconds to 4 seconds, achieving a 60% improvement in performance , providing strong support for rapid disaster response and structural integrity evaluation.
* Authored comprehensive technical documentation and assisted the professor in writing academic papers related to the technology, facilitating the transformation of research outcomes into scholarly output.

该项目通过利用前沿技术，专注于物联网、边缘计算和实时分析，推动结构健康监测方法的发展，以提高基础设施的安全性和可靠性。

* 根据建筑工程教授需求，研究并实现车载驶过式桥梁健康监测方法，用于桥梁结构健康监测（SHM），提升基础设施安全评估效率。
* 独立学习 iOS 开发技术，使用 SwiftUI 和 Xcode 设计并开发 iPhone 应用程序，实现运动传感器数据采集与实时分析功能，支持加速度数据记录及陀螺仪数据。
* 集成快速傅里叶变换（FFT） 功能进行频域数据分析，显著提高数据处理效率。
* 成功将物联网数据采集周期从 10 秒缩短至 4 秒，效率提升 60% ，为灾害响应和结构完整性评估提供有力支持。
* 撰写完整技术文档，并协助教授撰写该技术相关学术论文，推动研究成果向科研输出转化。


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
