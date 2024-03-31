# Motif
<p align="center">
<img src="Preview%20Images/Icon.png" width=250/>
</p>

A simple motion sensor data recorder for iPhone. Written with SwiftUI.
(Forked from https://github.com/weihengpan/Motif)

## Description
The iPhone app is ingeniously crafted to streamline the process of recording motion sensor data, offering unparalleled versatility in its applications. With a primary focus on structural health monitoring (SHM) within the realm of civil engineering, the app emerges as an indispensable tool for professionals and researchers alike. Its innovative features are tailored to accommodate the evolving needs of the industry, including the revolutionary drive-by bridge health monitoring methodology. Through this groundbreaking approach, the app facilitates the seamless collection of acceleration data, enabling users to conduct comprehensive assessments of bridge structural integrity. Furthermore, the app boasts advanced functionality, empowering users to generate acceleration Fast Fourier Transform (FFT) plots directly within the interface, thus enhancing efficiency and data analysis capabilities. As a result, the app emerges as an indispensable asset in the arsenal of engineers and researchers, revolutionizing the landscape of structural health monitoring and paving the way for enhanced safety and reliability in infrastructure.

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
