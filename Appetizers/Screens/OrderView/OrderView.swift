import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    
                    Button {
                        //TODO: Logic to button
                    } label: {
                        OrderButtonLabel(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 20)
                }
                
                if order.items.isEmpty {
                    EmptyOrderState(imageName: "empty-order", message: "You have no items in your oder.\n Please add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    
    static var order = Order()
    
    static var previews: some View {
        OrderView()
            .environmentObject(order)
    }
}
