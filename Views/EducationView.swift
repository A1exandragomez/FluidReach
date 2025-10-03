import SwiftUI

struct EducationView: View {
    var body: some View {
        NavigationView {
            List {
                VStack (alignment: .leading, spacing: 5) {
                    Text("Ready to Learn?!")
                        .font(.title2.bold())
                        .foregroundColor(.primary)
                        
                    Text ("Learn the full potentional of Fluid Reach with video tutorials and guides.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 10)
                }
                .padding(.vertical, 10)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                
                Section (header: Text("Quick Start Guide").font(.headline)) {
                    VideoRow (lesson: mockLessons.first!)
                        .padding(5)
                }
                Section (header: Text("Full Lesson Library").font(.headline)) {
                    ForEach (mockLessons.dropFirst()) {
                        lesson in VideoRow (lesson: lesson)
                    }
                }
                HStack {
                    Spacer()
                    Text("More lessons added weekly.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer ()
                }
                .padding(.vertical, 10)
                .listRowBackground(Color.clear)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Video Library")
        }
    }
}
