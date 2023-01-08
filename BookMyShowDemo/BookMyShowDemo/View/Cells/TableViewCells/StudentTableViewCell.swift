//
//  StudentTableViewCell.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import UIKit

// MARK: - StudentTableViewCellProtocol
protocol StudentTableViewCellProtocol: AnyObject {
    func didSelectShortList(isSelected: Bool, index: Int, studentName: String)
}

// MARK: - StudentTableViewCell
class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var shortListButton: UIButton!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var gpaLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var buttonWidth: NSLayoutConstraint!
    
    weak var delegate: StudentTableViewCellProtocol?
    var student: StudentModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        subView.addBottomShadow()
    }
    
    func configure(model: StudentModel, index: Int) {
        self.studentNameLabel.text = model.name
        self.universityLabel.text = model.university
        self.gpaLabel.text = String(model.gpa)
        self.skillsLabel.text = model.skills
        self.shortListButton.tag = index
        self.shortListButton.isSelected = model.isSelected ?? false
        self.shortListButton.backgroundColor = model.isSelected ?? false ? .lightGray : .link
        let title = model.isSelected ?? false ? Constants.shortlisted : Constants.shortlist
        self.shortListButton.setTitle(title, for: .normal)
        self.shortListButton.isUserInteractionEnabled = !(model.isSelected ?? false)
        self.setButtonWidth(title: title)
        student = model
    }
    
    @IBAction func shortListButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        delegate?.didSelectShortList(isSelected: sender.isSelected, index: sender.tag, studentName: student?.name ?? "")
    }
    
    func setButtonWidth(title: String) {
        let buttonTitleSize = (title as NSString).size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
        self.buttonWidth.constant = buttonTitleSize.width + 20
    }
}
