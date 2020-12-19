import SwiftUI

struct ClearButton: View {
    @Binding var text: String
    @Binding var refresh: Bool
    
    var body: some View {
        Button {
            self.text.removeAll()
            self.refresh = false
        } label: {
            ZStack {
                if !text.isEmpty {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.clear)
                    
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.secondary)
                        .opacity(0.65)
                }
            }
        }
    }
}

struct ClearButton_Previews: PreviewProvider {
    static var previews: some View{
        ClearButton(text: .constant("Text"), refresh: .constant(true))
    }
}
