//
//  ViewController.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import UIKit

// MARK: - StudentListViewController
class StudentListViewController: BaseViewController {
    
    @IBOutlet weak var studentTableView: UITableView!
    
    var viewModel: StudentViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel = StudentListViewModel()
        viewModel?.delegate = self
    }

    // MARK: - setupUI
    func setupUI() {
        studentTableView.backgroundColor = .systemGray4
        studentTableView.delegate = self
        studentTableView.dataSource = self
        studentTableView.register(UINib(nibName: Constants.studentTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.studentTableViewCell)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension StudentListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getNumberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.studentTableViewCell, for: indexPath) as? StudentTableViewCell {
            if let model = viewModel?.getStudent(index: indexPath.row) {
                cell.configure(model: model, index: indexPath.row)
            }
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let studentDetailVC = UIStoryboard(name: Constants.studentDetailViewController, bundle: nil).instantiateViewController(withIdentifier: Constants.studentDetailViewController) as! StudentDetailViewController
        studentDetailVC.delegate = self
        if let model = viewModel?.getStudent(index: indexPath.row) {
            studentDetailVC.viewModel = StudentDetailViewModel(student: model, index: indexPath.row)
        }
        navigationController?.pushViewController(studentDetailVC, animated: true)
    }
}

// MARK: - StudentTableViewCellProtocol
extension StudentListViewController: StudentTableViewCellProtocol {
    func didSelectShortList(isSelected: Bool, index: Int, studentName: String) {
        viewModel?.updateStudent(isSelected: isSelected, index: index)
        studentTableView.reloadData()
        if isSelected {
            showAlert(title: Constants.alertMessage.replacingOccurrences(of: "%d", with: studentName))
        }
    }
}

// MARK: - StudentViewModelAPIProtocol
extension StudentListViewController: StudentViewModelAPIProtocol {
    func didCallAPI() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.studentTableView.reloadData()
        }
    }
    
    func didApiFailed(error: String) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showAlert(message: error)
        }
    }
}
