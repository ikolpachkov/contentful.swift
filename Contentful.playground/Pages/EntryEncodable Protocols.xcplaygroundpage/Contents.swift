//: [Previous](@previous)

import Foundation
import Contentful


let filePath = Bundle.main.path(forResource:"RichText", ofType: "json")
let contentData = FileManager.default.contents(atPath: filePath!)!
let content = String(data:contentData, encoding:String.Encoding.utf8)!
let trimmed = content.trimmingCharacters(in: .whitespaces)
print("input: \(trimmed)")
print("\n\n")

private let decoder = JSONDecoder()
let result = try decoder.decode(RichTextDocument.self, from: contentData)


private let encoder = JSONEncoder()

let encoded = try encoder.encode(result)
let json = String(data: encoded, encoding: String.Encoding.utf8)!
let jsonObject = try JSONSerialization.jsonObject(with: encoded, options: [])
let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
let jsonString = String(data: jsonData, encoding: .utf8)!
print("output: \(jsonString)")




//: [Next](@next)
