import Foundation

struct OnboardCard: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let text: String
}

struct CardContext {
    static let flankSteakCard         = OnboardCard(title: "Flank Steak",
                                                  image: "asian-flank-steak",
                                                  text: "This dish is very yummy")
    
    static let blackenedShrimpCard    = OnboardCard(title: "Blackened Shrimp",
                                                  image: "blackened-shrimp",
                                                  text: "Spray some lemon and ask for our special sauce!")
    
    static let buffaloBitesCard       = OnboardCard(title: "Buffalo Bites",
                                                  image: "buffalo-chicken-bites",
                                                  text: "A must have!")
    
    static let onboardingCards = [flankSteakCard, blackenedShrimpCard, buffaloBitesCard]
}
