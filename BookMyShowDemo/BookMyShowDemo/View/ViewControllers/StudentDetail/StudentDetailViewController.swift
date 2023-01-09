//
//  StudentDetailViewController.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import UIKit

class StudentDetailViewController: BaseViewController {

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
        guard let viewModel = viewModel else { return }
        let student = viewModel.student
        self.nameLabel.text = Constants.studentName.replacingOccurrences(of: "%d", with: student.name)
        self.universityLabel.text = Constants.universityName.replacingOccurrences(of: "%d", with: student.university)
        self.gpaLabel.text = Constants.gpa.replacingOccurrences(of: "%d", with: String(student.gpa))
        self.skillsLabel.text = Constants.skills.replacingOccurrences(of: "%d", with: student.skills)
        let title = viewModel.isStudentShortlisted ? Constants.shortlisted : Constants.shortlist
        self.setupButton(title: title, isSelected: viewModel.isStudentShortlisted)
    }
    
    func setupButton(title: String, isSelected: Bool) {
        let buttonTitleSize = (title as NSString).size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
        self.buttonWidth.constant = buttonTitleSize.width + 20
        self.shortListButton.backgroundColor = isSelected ? .lightGray : .link
        self.shortListButton.setTitle(title, for: .normal)
        self.shortListButton.isUserInteractionEnabled = !isSelected
    }
    
    @IBAction func shortListButtonAction(_ sender: UIButton) {
        guard let viewModel = viewModel else { return }
        viewModel.isStudentShortlisted = !viewModel.isStudentShortlisted
        let title = viewModel.isStudentShortlisted ? Constants.shortlisted : Constants.shortlist
        self.setupButton(title: title, isSelected: viewModel.isStudentShortlisted)
        delegate?.didSelectShortList(isSelected: viewModel.isStudentShortlisted, index: viewModel.index, studentName: viewModel.student.name)
    }
}
