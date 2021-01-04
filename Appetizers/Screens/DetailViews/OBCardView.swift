import SwiftUI

struct OBCardView: View {
    
    @Binding var page: Int
    let card: OnboardCard
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            Text(card.title)
                .font(.title)
                .fontWeight(.medium)
            
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Text(card.text)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.bottom)
        }
        .frame(width: width, height: height)
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.white))
        .animation(.default)
    }
}

struct AppetizerCardView_Previews: PreviewProvider {
    
    static let onboardSet = OnboardSet.previewSet()
    static var previews: some View {
        OBCardView(page: .constant(3), card: onboardSet.cards[0], width: 350, height: 350)
            .previewLayout(.sizeThatFits)
    }
}
