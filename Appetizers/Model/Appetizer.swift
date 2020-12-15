import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}


struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for the appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 0001,
                                           name: "Test Appetizer One",
                                           description: "This is the description for the appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItemTwo = Appetizer(id: 0002,
                                           name: "Order Appetizer Two",
                                           description: "This is the description for the second appetizer. Delicious.",
                                           price: 8.99,
                                           imageURL: "",
                                           calories: 100,
                                           protein: 9,
                                           carbs: 9)
    
    static let orderItemThree = Appetizer(id: 0003,
                                           name: "Order Appetizer Three",
                                           description: "This is the description for the Third appetizer. Yay!",
                                           price: 4.99,
                                           imageURL: "",
                                           calories: 120,
                                           protein: 3,
                                           carbs: 9)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
