//
//  ListTableViewCell.swift
//  Umbrella
//
//  Created by Максим Боталов on 25.08.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let cellID = "ListTableViewCell"
    
    private let cityName = UILabel()
    private let bgView = UIView(bgColor: ColorSetup.blue())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        
        bgView.layer.shadowColor = ColorSetup.darkBlue().cgColor
        bgView.layer.shadowOpacity = 0.3
        bgView.layer.shadowRadius = 5
        bgView.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.layer.cornerRadius = 10
        bgView.clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setting UI-element constraints
extension ListTableViewCell {
    private func setupConstraints() {
        self.addSubview(bgView)
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -8),
            bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)])
    }
}
