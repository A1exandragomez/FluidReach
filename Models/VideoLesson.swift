import SwiftUI
import Foundation

struct VideoLesson: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let duration: String
}

let mockLessons: [VideoLesson] = [
    VideoLesson (title: "How Our App Works", description: "This is a step-by-step guide of our functionalitys within the app.", duration: "5:30"),
    VideoLesson (title: "How Our ChatBot Tab Works", description: "This is a descripted video on how you're able to utilize our AI helper but also have the option to communicate with a real-time marketing helper.", duration: "3:32"),
    VideoLesson (title: "How to Engage Your Audience", description: "This is a descripted video on how you're able to utilize our AI helper but also have the option to communicate with a real-time marketing helper.", duration: "5:30")
]
