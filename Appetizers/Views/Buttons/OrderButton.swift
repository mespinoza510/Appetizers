import SwiftUI

struct OrderButton: View {
    
    var title: LocalizedStringKey
    
    var body: some View {
        Button {
            print("tapped")
        } label: {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 260, height: 50)
                .background(Color.brandPrimary)
                .cornerRadius(10)
        }
    }
}

struct OrderButton_Previews: PreviewProvider {
    static var previews: some View {
        OrderButton(title: "Test Title")
    }
}
