//
//  Model.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import Foundation

// MARK: - StudentModel
struct StudentModel: Codable {
    let name, university: String
    let gpa: Double
    let skills: String
    var isSelected: Bool = false
}
