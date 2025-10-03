import SwiftUI

struct LoadingView: View {
    @State private var pulse: Bool = false
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.bottom, 20)
                    // Animation: Subtle pulse effect
                    .scaleEffect(pulse ? 1.05 : 1.0) 
                    .opacity(pulse ? 0.8 : 1.0)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulse)
                    
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("ButtonColor")))
                    .scaleEffect(1.5)
                    
                Text("Welcome Back Client!")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
            }
        }
        .onAppear {
            pulse = true
        }
    }
}
