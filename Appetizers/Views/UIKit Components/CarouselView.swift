import SwiftUI

struct CarouselView: UIViewRepresentable {
    
    @Binding var page: Int
    var width: CGFloat
    var height: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return CarouselView.Coordinator(parent1: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        // Scrollview Content size
        let total = width * CGFloat(CardContext.onboardingCards.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        let view1 = UIHostingController(rootView: CardList(page: self.$page))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        //NO-OP
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: CarouselView
        
        init(parent1: CarouselView) {
            self.parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            self.parent.page = page
        }
    }
}
