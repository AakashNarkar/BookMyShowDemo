//
//  StudentDetailViewController.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import UIKit

class StudentDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var gpaLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var shortListButton: UIButton!
    @IBOutlet weak var buttonWidth: NSLayoutConstraint!
    
    var viewModel: StudentDetailViewModelProtocol?
    weak var delegate: StudentTableViewCellProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - setupUI
    func setupUI() {
        if let viewModel = viewModel {
            let student = viewModel.student
            self.nameLabel.text = "Name: \(student.name)"
            self.universityLabel.text = "University:  \(student.university)"
            self.gpaLabel.text = "GPA: \(student.gpa)"
            self.skillsLabel.text = "Skills: \(student.skills)"
            let title = student.isSelected ?? false ? Constants.shortlisted : Constants.shortlist
            self.setupButton(title: title, isSelected: student.isSelected ?? false)
        }
    }
    
    func setupButton(title: String, isSelected: Bool) {
        let buttonTitleSize = (title as NSString).size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
        self.buttonWidth.constant = buttonTitleSize.width + 20
        self.shortListButton.backgroundColor = isSelected ? .lightGray : .link
        self.shortListButton.setTitle(title, for: .normal)
        self.shortListButton.isUserInteractionEnabled = !isSelected
    }
    
    @IBAction func shortListButtonAction(_ sender: UIButton) {
        if let viewModel = viewModel {
            var student = viewModel.student
            student.isSelected = !(student.isSelected ?? false)
            let title = student.isSelected ?? false ? Constants.shortlisted : Constants.shortlist
            self.setupButton(title: title, isSelected: student.isSelected ?? false)
            delegate?.didSelectShortList(isSelected: student.isSelected ?? false, index: viewModel.index, studentName: viewModel.student.name)
        }
    }
}
