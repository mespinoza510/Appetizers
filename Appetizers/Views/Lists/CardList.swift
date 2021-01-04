import SwiftUI

struct CardList: View {
    
    @Binding var page: Int
    let onboardingCards = CardContext.onboardingCards
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(onboardingCards) { card in
                OBCardView(page: $page,
                           card: card,
                           width: UIScreen.main.bounds.width,
                           height: 350)
            }
        }
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList(page: .constant(1))
    }
}
