//
//  ListTableViewCell.swift
//  Umbrella
//
//  Created by Максим Боталов on 25.08.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    // MARK: Cell ID
    static let cellID = "ListTableViewCell"
    
    // MARK: UI-components
    private let cityName = UILabel(text: "Санкт-Петербург", font: FontSetup.bold(size: 15))
    private let regionName = UILabel(text: "Ленинградская область, Россия", font: FontSetup.regular(size: 10))
    private let tempValue = UILabel(text: "+100°C", font: FontSetup.bold(size: 24), textColor: ColorSetup.black(), alignment: .right, numberOfLines: 1)
    private let bgView = UIView(bgColor: ColorSetup.blue())
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        
        let bgSelectedColor = UIView()
        bgSelectedColor.backgroundColor = ColorSetup.white()
        self.selectedBackgroundView = bgSelectedColor
        
        bgView.layer.shadowColor = ColorSetup.darkBlue().cgColor
        bgView.layer.shadowOpacity = 0.3
        bgView.layer.shadowRadius = 5
        bgView.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    // MARK: Lifecycle layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.layer.cornerRadius = 10
        bgView.clipsToBounds = false
    }
    
    // MARK: Required Init
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
        
        let nameStackView = UIStackView(arrangedSubviews: [cityName, regionName], distribution: .fill, axis: .vertical, spacing: 0)
        bgView.addSubview(nameStackView)
        NSLayoutConstraint.activate([
            nameStackView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 16),
            nameStackView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            nameStackView.heightAnchor.constraint(equalToConstant: 30),
            nameStackView.widthAnchor.constraint(equalToConstant: 220)])
        
        bgView.addSubview(tempValue)
        NSLayoutConstraint.activate([
            tempValue.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 16),
            tempValue.leadingAnchor.constraint(equalTo: nameStackView.trailingAnchor),
            tempValue.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),
            tempValue.heightAnchor.constraint(equalToConstant: 30)])
    }
}
