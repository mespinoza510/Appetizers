import SwiftUI

struct ViewOrderButton: View {
    
    let itemNum: Int
    
    var body: some View {
        
        Button {
            
        } label: {
            if itemNum > 0 {
                ZStack {
                    HStack {
                        Image(systemName: SFSymbols.cart.rawValue)
                            .imageScale(.large)
                            .foregroundColor(.brandSecondary)
                            .padding(.leading)
                        
                        Spacer()
                        
                        VStack {
                            Text("View your order")
                                .font(.caption )
                                .fontWeight(.semibold)
                                .foregroundColor(.brandSecondary)
                            
                            Text("Appetizer")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.brandSecondary)
                        }
                        
                        Spacer()
                        
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .opacity(0.6)
                            .padding(.trailing)
                    }
                    OrderNumber(items: itemNum)
                    
                    
                }
                .frame(width: 300, height: 50)
                .foregroundColor(.white)
                .background(Color.brandPrimary)
                .cornerRadius(30)
            }
        }
        
    }
}

struct OrderNumber: View {
    let items: Int
    
    var body: some View {
        Text("\(items)")
            .font(.body)
            .font(.system(size: 30))
            .foregroundColor(.brandSecondary)
            .offset(x: 123)
    }
}

struct ViewOrderButton_Previews: PreviewProvider {
    static var previews: some View {
        ViewOrderButton(itemNum: 1, isViewOrderButtonTapped: .constant(false))
    }
}
