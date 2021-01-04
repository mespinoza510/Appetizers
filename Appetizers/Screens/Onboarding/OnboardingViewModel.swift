import SwiftUI

final class OnboardingViewModel: ObservableObject {
    
    @AppStorage("onboardingBeenViewed") var onboardingBeenViewed = false
    @Published var hasCompletedSwipe = false
    @Published var maxWidth = UIScreen.main.bounds.size.width - 100
    @Published var sliderOffset: CGFloat = 0
    @Published var animateText = false
    @Published var page: Int = 0
    
    let sliderRadius: CGFloat = 65
    
    func fillCapsuleWidth() -> CGFloat {
        let percent = sliderOffset / maxWidth
        
        return percent * maxWidth
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.width > 0 && sliderOffset <= maxWidth - sliderRadius {
            sliderOffset = value.translation.width
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(Animation.easeOut(duration: 0.3)) {
            if sliderOffset > maxWidth / 3 {
                sliderOffset = maxWidth - sliderRadius
                
                // Notify user + delay for animation
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    NotificationCenter.default.post(name: NSNotification.Name("Success"), object: nil)
                }
            } else {
                sliderOffset = 0
            }
        }
    }
}
