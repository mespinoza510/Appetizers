import SwiftUI

struct OrderButton: View {
    
    var title: LocalizedStringKey
    
    var body: some View {
        Button {
            print("tapped")
        } label: {
            OrderButtonLabel(title: title)
        }
    }
}

struct OrderButtonLabel: View {
    var title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(Color.brandSecondary)
            .frame(width: 260, height: 50)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

struct OrderButton_Previews: PreviewProvider {
    static var previews: some View {
        OrderButton(title: "Test Title")
    }
}
