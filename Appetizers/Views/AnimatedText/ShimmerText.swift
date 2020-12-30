import SwiftUI

struct ShimmerText: View {
    
    var text: String
    var fontColor: Color
    
    @Binding var animate: Bool
    
    var body: some View {
        ZStack {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(fontColor)
                .opacity(0.5)
            
            HStack(spacing: 0) {
                ForEach(0..<text.count, id: \.self) { index in
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                }
            }.mask(
                Rectangle()
                    .fill(LinearGradient(gradient: .init(colors: [Color.white.opacity(0.7), Color.white.opacity(0.7)]), startPoint: .leading, endPoint: .trailing))
                    .rotationEffect(.init(degrees: 70))
                    .offset(x: -75)
                    .offset(x: animate ? 500 : 0))
            .onAppear(perform: {
                withAnimation(Animation.linear(duration: 2.5).repeatForever(autoreverses: false)) {
                    animate.toggle()
                }
            })
        }
    }
}

struct ShimmerText_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerText(text: "Hello World", fontColor: Color.gray, animate: .constant(true))
            .preferredColorScheme(.dark)
    }
}
