// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Swifter


let server = HttpServer()
var items : [itemModel] = [
    ItemModel(name: "T-Shirt", condition: .good, price: 15.99, favourites: 10, views: 120, category: .men(.clothing)),
    ItemModel(name: "Sneakers", condition: .excellent, price: 60.0, favourites: 25, views: 300, category: .men(.footwear))
]

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

server["/items"] = { request in
    do {
        let jsonData = try encoder.encode(items)
        return HttpResponse.ok(.data(jsonData, contentType: "application/json"))
    } catch {
        return HttpResponse.internalServerError
    }
}

server.PUT["/items"] = { request in
    guard let body = request.body else {
        return .badRequest(nil)
    }

    do {
        let newItem = try JSONDecoder().decode(ItemModel.self, from: Data(body))
        items.append(newItem)
        return .ok(.text("Item added"))
    } catch {
        return .internalServerError
    }
}

do {
    try server.start(2466)
    print("Server started on port 2466")
    RunLoop.main.run()
} catch {
    print("Failed to start the server \(error)")
}
