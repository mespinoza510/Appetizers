import SwiftUI

struct DisplayOnboardingView: View {
    
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.hasCompletedSwipe || viewModel.onboardingBeenViewed {
                AppetizerTabView()
            } else {
                OnboardingView()
            }
        }.onReceive(NotificationCenter.default.publisher(for: Notification.Name("Success")), perform: { _ in
            withAnimation {
                self.viewModel.hasCompletedSwipe = true
                self.viewModel.onboardingBeenViewed = true
            }
        })
    }
}

struct OnboardingView: View {
    
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text("Welcome to Appetizer")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                    .padding(.top, 50)
                
                Text("Lets get started and check out some\n of our favorite items below!")
                    .font(.title3)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.top)
                
                GeometryReader { geo in
                    CarouselView(page: self.$viewModel.page, width: UIScreen.main.bounds.width, height: geo.frame(in: .global).height)
                }
                PageControl(page: self.$viewModel.page)
                    .padding(.vertical)
                
                Spacer()
                
                ZStack {
                    Capsule()
                        .fill(Color.primary.opacity(0.15))
                    
                    ShimmerText(text: "SWIPE TO START", fontColor: .gray, animate: $viewModel.animateText)
                    
                    HStack {
                        Capsule()
                            .fill(Color.brandPrimary)
                            .frame(width: viewModel.fillCapsuleWidth() + viewModel.sliderRadius)
                        
                        Spacer()
                    }
                    
                    HStack {
                        ZStack {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.brandSecondary)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.brandSecondary)
                                .offset(x: 5)
                        }
                        .foregroundColor(.white)
                        .frame(width: viewModel.sliderRadius, height: viewModel.sliderRadius)
                        .background(Color.brandPrimary)
                        .clipShape(Circle())
                        .offset(x: viewModel.sliderOffset)
                        .gesture(DragGesture().onChanged(viewModel.onChanged(value:)).onEnded(viewModel.onEnd(value:)))
                        
                        Spacer()
                    }
                }
                .frame(width: viewModel.maxWidth, height: viewModel.sliderRadius)
                .padding(.bottom)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .preferredColorScheme(.dark)
    }
}
