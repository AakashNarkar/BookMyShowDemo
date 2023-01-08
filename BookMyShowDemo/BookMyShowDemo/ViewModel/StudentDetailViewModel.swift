//
//  StudentDetailViewModel.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import Foundation

// MARK: - StudentDetailViewModelProtocol
protocol StudentDetailViewModelProtocol: AnyObject {
    var student: StudentModel { get }
    var index: Int { get }
}

class StudentDetailViewModel: StudentDetailViewModelProtocol {
    var index: Int
    var student: StudentModel
    
    var isStudentShortlisted: Bool {
        student.isSelected ?? false
    }
    
    init(student: StudentModel, index: Int) {
        self.student = student
        self.index = index
    }
}
