import SwiftUI

struct VideoRow: View {
    let lesson: VideoLesson
    
    var body: some View {
        Button(action: {
        print("Tapped on \(lesson.title)")
        }) {
            HStack (alignment: .top, spacing: 15) {
                
                VStack (alignment: .center) {
                    Image (systemName: "play.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame (width: 40, height: 40)
                        .foregroundColor(Color("ButtonColor"))
                        .padding(.top, 5)
                        
                    Text(lesson.duration)
                        .font(.caption2.monospaced())
                        .foregroundColor(.secondary)
                }
                .padding (.trailing, 5)
                
                VStack (alignment: .leading, spacing: 5) {
                    Text (lesson.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text (lesson.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
            }
        }
        .buttonStyle(.plain)
        .padding (.vertical, 5)
    }
}
