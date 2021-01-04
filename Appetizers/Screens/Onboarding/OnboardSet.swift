import UIKit

class OnboardSet {
    private(set) var cards: [OnboardCard] = []
    private(set) var width: CGFloat = 350
    private(set) var height: CGFloat = 350
    
    func dimensions(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    func newCard(title: String, image: String, text: String) {
        cards.append(OnboardCard(title: title, image: image, text: text))
    }
}

extension OnboardSet {
    
    static func previewSet() -> OnboardSet {
        let onboardSet = OnboardSet()
        onboardSet.newCard(title: "Flank Steak", image: "asian-flank-steak", text: "This dish is very yummy")
        onboardSet.newCard(title: "Blackened Shrimp", image: "blackened-shrimp", text: "Spray some lemon and ask for our special sauce!")
        onboardSet.newCard(title: "Buffalo Bites", image: "buffalo-chicken-bites", text: "A must have!")
        return onboardSet
    }
}
