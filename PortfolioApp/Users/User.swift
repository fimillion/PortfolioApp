import Foundation

struct UsersResult: Decodable {
    let users: [User]
}

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let company: Company
    let address: Address
    
    struct Company: Codable {
        let name: String
    }
    
    struct Address: Codable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
    }
}
