//
//  StudentTableViewCell.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import UIKit

protocol StudentTableViewCellProtocol: AnyObject {
    func didSelectShortList(isSelected: Bool, index: Int)
}

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var shortListButton: UIButton!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var gpaLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    
    weak var delegate: StudentTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(model: StudentModel, index: Int) {
        self.studentNameLabel.text = model.name
        self.universityLabel.text = model.university
        self.gpaLabel.text = String(model.gpa)
        self.skillsLabel.text = model.skills
        self.shortListButton.tag = index
        self.shortListButton.isSelected = model.isSelected
        self.shortListButton.backgroundColor = model.isSelected ? .lightGray : .link
        self.shortListButton.setTitleColor(model.isSelected ? .darkGray : .white, for: .normal)
    }
    
    @IBAction func shortListButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        delegate?.didSelectShortList(isSelected: sender.isSelected, index: sender.tag)
    }
}
