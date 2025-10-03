import SwiftUI
import Foundation
import Charts


// Data Stuctures:

// User Profile Model
struct UserProfile: Identifiable, Codable {
    let id: UUID
    var username: String
    let email: String
    var bio: String
    let joinDate: Date
    
    init(id: UUID = UUID(), username: String, email: String, bio: String , joinDate date: Date = Date()) {
        self.id = id
        self.username = username
        self.email = email
        self.bio = bio
        self.joinDate = date
        }
        
    func formattedJoinDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return "Joined on \(formatter.string(from: joinDate))"
    }
}

enum Chatmode {
    case selection, aiAssistant, humanAssociate
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
    let timestamp = Date()
}

// App: Content view

// Placeholder Views


struct ContentView: View {
    @State private var isLoading = true
    
    var body: some View {
        // The conditional logic MUST wrap the entire application content.
        Group {
            if isLoading {
                LoadingView()
                    .onAppear {
                        // Your delay logic: Wait 3 seconds, then set isLoading to false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation {
                                isLoading = false
                            }
                        }
                    }
            } else {
            // Navigation Bar
                TabView {
                    ChatbotView()
                        .tabItem {
                            Label ("ChatBot", systemImage: "person.fill.questionmark")
                        }
                        
                    TrackerView()
                        .tabItem {
                            Label ("Tracker", systemImage: "leaf.circle.fill")
                        }

                    EducationView()
                        .tabItem {
                            Label ("Education", systemImage: "book.fill")
                        }
                        
                    ProfileView()
                        .tabItem {
                            Label ("Profile", systemImage: "person.circle.fill")
                        }
                }
                .tint(Color("ButtonColor"))
            }
        }
    }
}

#Preview {
    ContentView()
}

@main
struct MarketingAICopyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
