import SwiftUI

struct HumanSupportChatView: View {
    @State private var messages: [ChatMessage]
    @State private var inputText: String = ""
    @FocusState private var isInputActive: Bool
    @State private var isSending = false
    
    private static func createInitialMessage() -> ChatMessage {
        return ChatMessage(text: "Thanks for reaching out! An associate will join you shortly. What's your question?", isUser: false)
    }
    
    init () {
        _messages = State(initialValue: [HumanSupportChatView.createInitialMessage()])
    }
    
    private func resetChat () {
        withAnimation {
            messages = [HumanSupportChatView.createInitialMessage()]
            inputText = ""
            isSending = false
        }
    }
    
    var body: some View {
        VStack (spacing: 0) {
            ScrollViewReader {
                proxy in ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach (messages) {
                            message in MessageRow (message: message)
                                .id (message.id)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                .onChange(of: messages.count) {
                    _ in
                    if let lastMessage = messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
            }
            if isSending {
                HStack {
                    ProgressView()
                    Text("Associate is typing...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 5)
            }
            HStack {
                TextField("Message associate...", text: $inputText, axis: .vertical)
                    .focused($isInputActive)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    
                Button {
                    sendCurrentMessage()
                } label: {
                    Image( systemName: "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(Color("ButtonColor"))
                }
                .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isSending)
            }
            .padding([.horizontal, .vertical])
            .background(Color(.systemBackground))
        }
        .navigationTitle("Human Support")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button  ("Reset Chat", role: .destructive) {
                    resetChat()
                }
            }
        }
    }
    func sendCurrentMessage() {
        let text = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else {
            return
        }
        let userMessage = ChatMessage(text: text, isUser: true)
        messages.append(userMessage)
        inputText = ""
        
        Task {
            await MainActor.run {
                isSending = true
            }
            try await Task.sleep (nanoseconds: 1_500_000_000)
            
            let responseText = "Thank you for your patience. I'm your Associate John Doe, and I see you're asking about '\(text)'. I can certainly help with that!"
            
            await MainActor.run {
                messages.append(ChatMessage(text: responseText, isUser: false))
                isSending = false
            }
        }
    }
}

struct ChatbotView: View {
    var body: some View {
        NavigationView {
            HumanSupportChatView()
        }
    }
}
