

import SwiftUI

struct AppetizerDetailView: View {
    
    @Binding var isShowingDetailView: Bool
    let appetizer: Appetizer
    
    var body: some View {
        
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding()
            }
            
            HStack(spacing: 40) {
                
                NutritionInfo(title: "Calories", value: appetizer.calories, units: "")
                NutritionInfo(title: "Carbs", value: appetizer.carbs, units: "g")
                NutritionInfo(title: "Protein", value: appetizer.protein, units: "g")
            }
            
            Spacer()
            
            Button {
                print("Order Added to cart")
            } label: {
                OrderButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(XDismissButton(isShowingDetailView: $isShowingDetailView), alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(isShowingDetailView: .constant(true), appetizer: MockData.sampleAppetizer)
    }
}

struct NutritionInfo: View {
    let title: String
    let value: Int
    let units: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)" + units)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
