//
//  UsersTableViewCell.swift
//  MVVM_simple
//
//  Created by Andrii Kyrychenko on 01/06/2022.
//

import UIKit

protocol UsersTableViewCellDelegat: AnyObject {
    func usersTableViewCell( cell: UsersTableViewCell, didTapWith viewModel: UserViewModel)
}

class UsersTableViewCell: UITableViewCell {

    static let idetifier = "UsersTableViewCell"
    
    private var viewModel: UserViewModel?
    
    weak var delegat: UsersTableViewCellDelegat?
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(passwordLabel)
        contentView.addSubview(button)
        contentView.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func didTapButton() {
        guard let viewModel = viewModel else {
            return
        }
        var newViewModel = viewModel
        newViewModel.isAdmin = !viewModel.isAdmin
        delegat?.usersTableViewCell(cell: self, didTapWith: newViewModel)
        
        prepareForReuse()
        configure(with: newViewModel)

    }
    
    func configure(with viewModel: UserViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        passwordLabel.text = viewModel.password
        userImageView.image = viewModel.image
        
        if viewModel.isAdmin {
            button.setTitle("Admin", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        } else {
            button.setTitle("User", for: .normal)
            button.setTitleColor(.gray, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageWidth = contentView.frame.size.height-10
        userImageView.frame = CGRect(x: 5, y: 5, width: imageWidth, height: imageWidth)
        nameLabel.frame = CGRect(x: imageWidth+10, y: 0,
                                 width: contentView.frame.size.width-imageWidth,
                                 height: contentView.frame.size.height/2)
        passwordLabel.frame = CGRect(x: imageWidth+10,
                                     y: contentView.frame.size.height/2,
                                     width: contentView.frame.size.width-imageWidth,
                                     height: contentView.frame.size.height/2)
        button.frame = CGRect(x: contentView.frame.size.width-120, y: 10, width: 110, height: contentView.frame.size.height-20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        passwordLabel.text = nil
        userImageView.image = nil
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.setTitle(nil, for: .normal)
    }

}
