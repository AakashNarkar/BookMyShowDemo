//
//  ViewModel.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import Foundation

// MARK: - StudentViewModelProtocol
protocol StudentViewModelProtocol: AnyObject {
    func getNumberOfRows() -> Int
    func getStudent(index: Int) -> StudentModel
    func updateStudent(isSelected: Bool, index: Int)
}

// MARK: - StudentViewModel
class StudentListViewModel: StudentViewModelProtocol {
    
    var studentList = [
        StudentModel(name: "Name", university: "university", gpa: 2.3, skills: "ios Dev"),
    ]
    
    func getNumberOfRows() -> Int {
        studentList.count
    }
    
    func getStudent(index: Int) -> StudentModel  {
        return studentList[index]
    }
    
    func updateStudent(isSelected: Bool, index: Int) {
        studentList[index].isSelected = isSelected
    }
}
