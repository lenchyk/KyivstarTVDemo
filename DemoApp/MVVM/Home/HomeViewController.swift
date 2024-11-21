//
//  ViewController.swift
//  DemoApp
//
//  Created by Pete Shpagin on 31.03.2021.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let someView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let kyivstarLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kyivstarLogo")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let someLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    var viewModel: HomeViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        setupBindings()
        
        viewModel?.fetchPromotions()
    }
    
    private func setupBindings() {
        viewModel?.$promotions
            .receive(on: DispatchQueue.main)
            .sink { [weak self] data in
                self?.someLabel.text = data.name
            }
            .store(in: &cancellables)
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(kyivstarLogoImage)
        contentView.addSubview(someView)
        someView.addSubview(someLabel)
    }
    
    private func setupConstraints() {
        let contentViewHeight = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeight.isActive = true
        contentViewHeight.priority = UILayoutPriority(50)
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        kyivstarLogoImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        kyivstarLogoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 135).isActive = true
        kyivstarLogoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -135).isActive = true
        kyivstarLogoImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        kyivstarLogoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        someView.topAnchor.constraint(equalTo: kyivstarLogoImage.bottomAnchor, constant: 16).isActive = true
        someView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        someView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        someView.heightAnchor.constraint(equalToConstant: 800).isActive = true
        someView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        someLabel.topAnchor.constraint(equalTo: someView.topAnchor).isActive = true
        someLabel.centerXAnchor.constraint(equalTo: someView.centerXAnchor).isActive = true
        someLabel.centerYAnchor.constraint(equalTo: someView.centerYAnchor).isActive = true
        someLabel.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 16).isActive = true
        someLabel.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -16).isActive = true
        someLabel.bottomAnchor.constraint(equalTo: someView.bottomAnchor).isActive = true
    }
}

