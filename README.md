Fluid Reach Marketing Support App

Project Overview

The AI Marketing Support App is a native iOS application built with SwiftUI designed to assist digital marketers and small business owners. It provides tools for goal tracking, educational resources, profile management, and features a simulation for human support, all integrated into a modern, easy-to-use mobile experience.

A core feature is the Sustainability Tracker, which visualizes the environmental impact score of campaigns over time using the native Swift Charts framework, encouraging responsible marketing practices.

✨ Key Features
Sustainability Tracker: Visualize campaign performance over a 6-month period using interactive Bar Charts (powered by Swift Charts). Tracks metrics like the impactScore using the SustainabilityMetric data model.

Education Library: Access a categorized library of essential video lessons (VideoLesson) on topics like CTA optimization, goal setting, and real-time data grounding.

Profile Management: View and edit user details, including username and bio, and track personal metrics like "Generated Assets" and "Community Members" followed.

Chatbot / Human Support: A simulated chat interface for quick Q&A and immediate connection to "human" support associates.

Responsive UI: Fully native, adaptive layout using SwiftUI for optimal performance on all iOS devices.

💻 Technology Stack
Language: Swift 5.0+

Frameworks:

SwiftUI: For building the entire declarative user interface.

Foundation: For core data types and utility functions.

Charts: For data visualization in the TrackerView (e.g., BarMark).

Platform: iOS 16.0+ (Requires Charts framework)

Development Environment: Xcode

🚀 Getting Started
To run and build this application, you must have Xcode installed on a macOS machine.

Prerequisites

macOS (running a recent version)

Xcode (version 14.0 or later for SwiftUI Charts support)

Installation and Setup

Clone the Repository:

git clone [Your Repository URL Here]
cd AI-Marketing-Support-App

Open in Xcode:
Open the project file (.xcodeproj or .xcworkspace) in Xcode.

Select a Simulator:
Choose an iPhone or iPad simulator (e.g., iPhone 15 Pro) from the device selector at the top of the Xcode window.

Build and Run:
Press the Run button (or ⌘ + R). Xcode will compile the Swift and SwiftUI code and launch the app in the selected simulator.

📊 Data Structure Highlight
The SustainabilityMetric struct, which powers the tracker's visualization, is defined as follows:

struct SustainabilityMetric: Identifiable {
    let id = UUID()
    let month: String
    let impactScore: Int // A score out of 100
}

This simple structure allows for easy iteration and mapping within the SwiftUI Chart view to display historical performance data.
