//: [Previous](@previous)

import Foundation
import Contentful


let filePath = Bundle.main.path(forResource:"RichTextWithEmbeddedLinks", ofType: "json")
let contentData = FileManager.default.contents(atPath: filePath!)!
let content = String(data:contentData, encoding:String.Encoding.utf8)!
let trimmed = content.trimmingCharacters(in: .whitespaces)
print("input: \(trimmed)")
print("\n\n")

let client = Client(spaceId: "fwb41g609la1", accessToken: "8e352969dbed3820906ba2cdf11bcba27f7622a76d4400e67d692ecb0fa66b40")
private let decoder = client.jsonDecoder
let result = try decoder.decode(RichTextDocument.self, from: contentData)


private let encoder = JSONEncoder()

let encoded = try encoder.encode(result)
let json = String(data: encoded, encoding: String.Encoding.utf8)!
let jsonObject = try JSONSerialization.jsonObject(with: encoded, options: [])
let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
let jsonString = String(data: jsonData, encoding: .utf8)!
print("output: \(jsonString)")




//: [Next](@next)
