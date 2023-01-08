//
//  ViewController.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import UIKit

class StudentListViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    
    var viewModel: StudentViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel = StudentListViewModel()
    }

    // MARK: - setupUI
    func setupUI() {
        studentTableView.delegate = self
        studentTableView.dataSource = self
        studentTableView.register(UINib(nibName: Constants.studentTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.studentTableViewCell)
        title = Constants.navigationTitle
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension StudentListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.studentTableViewCell, for: indexPath) as? StudentTableViewCell {
            cell.configure(model: viewModel.getStudent(index: indexPath.row), index: indexPath.row)
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - StudentTableViewCellProtocol
extension StudentListViewController: StudentTableViewCellProtocol {
    func didSelectShortList(isSelected: Bool, index: Int) {
        viewModel.updateStudent(isSelected: isSelected, index: index)
        studentTableView.reloadData()
    }
}
