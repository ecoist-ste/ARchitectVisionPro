# VisionOS Project – ARchitect

## Overview  
ARchitect transforms your space with an AR-powered community for sharing and trying furniture ideas. This is an ongoing semester-long visionOS project (Spring 2025) mirroring functionalities of ARchitect iOS but with enhancements tailored to visionOS's native device support.
Jordan Miao and I are the project lead of both ARchitect visionOS and iOS. You can check out our iOS version here: https://github.com/gtiosclub/ARchitect.


This project leverages **RealityKit, Shader Graph, and Firebase** to create an immersive AR/VR experience on Apple Vision Pro that is operational in both frontend and backend. It integrates **hand tracking, spatial awareness, and real-time 3D interactions** to redefine user engagement in augmented environments.

##  Demo  
This is a partial demo of the app as we are developing many exciting features at the moment and will frequently update this demo part. 
The video demos our prototype of allowing user to enter an immersive space from a mixed reality space as an entry point, and then manipulate a piece of furniture in the environment while providing information about it through attachments.

https://github.com/user-attachments/assets/1f3bd97f-84e0-4f7b-9890-ba2866c8baf7



##  Features  
 **Real-time 3D Object Manipulation** – Supports grabbing, scaling, and rotating objects via **hand tracking gestures**.  
 **Spatial Audio** – Implements **AVAudioEngine** to create a **positional audio** environment.  
 **Custom Shaders through Shader Graph** – Uses **Shader Graph** for **advanced lighting and rendering effects** to enrich the user experience.  
 **Performance Optimizations** – Uses **RealityKit's Entity Component System (ECS)** and **Instruments** to optimize rendering on Vision Pro.  

## 🏗️ Tech Stack  
- **Languages**: Swift, SwiftUI  
- **Frameworks**: RealityKit, visionOS, 
- **Graphics**: Shader Graph, Reality Composer Pro
- **Audio**: AVAudioEngine (for immersive soundscapes)  
- **Concurrency**: Swift Concurrency (async/await, GCD)  

## 🔧 Installation & Setup  
```bash
# Clone the repository
git clone https://github.com/ecoist-ste/ARchitectVisionPro.git

# Open the Xcode project
cd ARchitectVisionPro
open ARchitectVisionPro.xcodeproj
