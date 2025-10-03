import SwiftUI

struct MessageRow: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
                Text (message.text)
                    .padding(10)
                    .background(Color.indigo.opacity(0.9))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 1)
            } else {
                Text (message.text)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .foregroundColor(.primary)
                    .cornerRadius(15)
                    .shadow(radius: 1)
                Spacer()
            }
        }
    }
}


