import SwiftUI

struct PageControl:  UIViewRepresentable {
    
    @Binding var page: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .brandPrimary
        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        view.numberOfPages = CardContext.onboardingCards.count
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        DispatchQueue.main.async {
            uiView.currentPage = self.page
        }
    }
}
