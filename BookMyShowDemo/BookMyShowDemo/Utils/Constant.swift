//
//  Constant.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import Foundation

// MARK: - Constants
struct Constants {
    // Views
    static let studentTableViewCell = "StudentTableViewCell"
    static let studentDetailViewController = "StudentDetailViewController"
   
    // URLs
    static let baseURL = "https://run.mocky.io/v3/"
    static let studentDataEndURL = "1f279003-f26e-4af9-8e34-f0f2b82c7f13"
    
    // Screen Constants
    static let loading = "Loading"
    static let okAlerTitle = "OK"
    static let appName = "WWDC 2022"
    static let studentName = "Name: %d"
    static let universityName = "University: %d"
    static let gpa = "GPA: %d"
    static let skills = "Skills: %d"
    static let alertMessage = "%d Shortlisted"
    static let shortlisted = "Shortlisted"
    static let shortlist = "Shortlist"
    static let navigationTitle = "Swift Student Challange"
    static let navigationSubTitle = "WWDC 2022"
    
    // Image Constant
    static let navigationBackButtonnImage = "chevron.backward"
}

enum CustomError: String, Error {
    case notParseModel = "Model not parsed"
    case apiFailed = "API Failed"
}

enum ApiMethodType: String {
    case get = "GET"
    case post = "POST"
}
