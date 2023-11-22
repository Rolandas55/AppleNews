//
//  DetailViewController.swift
//  AppleNews
//
//  Created by kraujalis.rolandas on 19/11/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var article: Article?
    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        gradientBackground()

        // Do any additional setup after loading the view.
    }
    
    func gradientBackground() {
        setGradientBackgroundColor()
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setGradientBackgroundColor() {
        if traitCollection.userInterfaceStyle == .dark {
            gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.black.cgColor]
        } else {
            gradientLayer.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        }
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.systemBackground
        let vstack = UIStackView()
        let title = UILabel()
        let source = UILabel()
        let author = UILabel()
        let content = UILabel()
        let image = UIImageView()
        
        vstack.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        vstack.distribution = .fillProportionally
        vstack.axis = .vertical
        vstack.alignment = .leading
        vstack.spacing = 5
        
        for label in [source, author, content] {
            label.translatesAutoresizingMaskIntoConstraints = false
            vstack.addArrangedSubview(label)
            label.widthAnchor.constraint(equalTo: vstack.widthAnchor).isActive = true
            label.textColor = UIColor.label
            label.numberOfLines = 0
        }
        
        view.addSubview(title)
        view.addSubview(vstack)
        view.addSubview(image)
        
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 18)
        
        title.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: vstack.topAnchor, constant: 30).isActive = true
        title.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60).isActive = true

        vstack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        vstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        vstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        vstack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170).isActive = true
        vstack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        vstack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        image.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        image.contentMode = .scaleAspectFit
        
        image.sd_setImage(with: URL(string: article?.urlToImage ?? ""))
        title.text = "\(article?.title ?? "")"
        author.text = "Author:\n\t \(article?.author ?? "")"
        content.text = "Content:\n\t \(article?.content ?? "")"
        source.text = "Source:\n\t \(article?.source?.name ?? "")"
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setGradientBackgroundColor()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
