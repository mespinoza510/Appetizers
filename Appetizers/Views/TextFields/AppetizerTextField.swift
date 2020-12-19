import SwiftUI

struct AppetizerTextField: View {
    
    let placeHolder: String
    @Binding var text: String
    @Binding var refresh: Bool
    
    var body: some View {
        TextField(placeHolder, text: $text)
            .disableAutocorrection(true)
            .overlay(ClearButton(text: $text, refresh: $refresh), alignment: .trailing)
    }
}

struct AppetizerTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppetizerTextField(placeHolder: "TextField",text: .constant(""), refresh: .constant(true))
                .padding()
                .frame(width: 150, height: 30)
                .font(Font.system(size: 16, weight: .medium, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.secondary, lineWidth: 2))
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
