import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    
                    Button {
                        //TODO: Logic to button
                    } label: {
                        OrderButtonLabel(title: "$9.99 - Place Order")
                    }
                    .padding(.bottom, 20)
                }
                if orderItems.isEmpty {
                    OrderEmptyState(imageName: "empty-order", message: "You have no items in your oder.\n Please add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
