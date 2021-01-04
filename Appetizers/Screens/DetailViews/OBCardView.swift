import SwiftUI

struct OBCardView: View {
    
    let appetizer: Appetizer
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            Text("Blackened Shrimp")
                .font(.largeTitle)
            
            Image("blackened-shrimp")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("One of the restaurants favorites!")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.bottom)
        }
        .frame(width: width, height: height)
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color(.secondarySystemBackground)))
    }
}

struct AppetizerCardView_Previews: PreviewProvider {
    
    static let onboardSet = OnboardSet.previewSet()
    static var previews: some View {
        OBCardView(appetizer: MockData.sampleAppetizer, width: 350, height: 350)
            .previewLayout(.sizeThatFits)
    }
}
