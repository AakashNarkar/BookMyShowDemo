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
    var delegate: StudentViewModelAPIProtocol? { get set }
}

// MARK: - StudentViewModelAPIProtocol
protocol StudentViewModelAPIProtocol: AnyObject {
    func didCallAPI()
    func didApiFailed(error: String)
}

// MARK: - StudentViewModel
class StudentListViewModel: StudentViewModelProtocol {
    let service: ServiceAPIProtocol!
    var studentList = [StudentModel]()
    
    weak var delegate: StudentViewModelAPIProtocol?
    
    init() {
        service = ServiceAPI()
        service.getMatchDetails(apiMethod: .getStudentData) { [weak self] response in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let model):
                strongSelf.studentList = model
                strongSelf.delegate?.didCallAPI()
            case .failure(let error):
                strongSelf.delegate?.didApiFailed(error: error.localizedDescription)
            }
        }
    }
    
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
