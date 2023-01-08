//
//  ViewController.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import UIKit

class StudentListViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    
    var array = [
        StudentModel(name: "Name", university: "university", gpa: 2.3, skills: "ios Dev"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    // MARK: - setupUI
    func setupUI() {
        studentTableView.delegate = self
        studentTableView.dataSource = self
        studentTableView.register(UINib(nibName: Constants.studentTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.studentTableViewCell)
        title = "Swift Student Challange"
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension StudentListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.studentTableViewCell, for: indexPath) as? StudentTableViewCell {
            cell.configure(model: array[indexPath.row], index: indexPath.row)
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - StudentTableViewCellProtocol
extension StudentListViewController: StudentTableViewCellProtocol {
    func didSelectShortList(isSelected: Bool, index: Int) {
        array[index].isSelected = isSelected
        studentTableView.reloadData()
    }
}
