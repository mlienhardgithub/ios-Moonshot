//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Martin Lienhard on 7/25/22.
//

import Foundation

extension Bundle { //log files with errors at /Users/mlienhard/Library/Logs
    //change from [String: Astronaut] to [Astronaut] to avoid exception
    func decode<T: Codable>(_ file: String) -> T {
        //must specify the file extension when withExtension is nil
        // or else have to specify a file type such as withExtension: "json"
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        //change from [String: Astronaut] to [Astronaut] to avoid exception
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
