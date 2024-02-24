//
//  ViewController.swift
//  7Kick_nativeAvatar
//
//  Created by Нечаев Михаил on 24.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let avatarImageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Avatar"
        
        view.backgroundColor = .systemGray6
        
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        scrollView.delegate = self
        
        avatarImageView.layer.cornerRadius = 18
        avatarImageView.tintColor = .systemGray
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.frame
        
        if avatarImageView.superview == nil,
           let largeView = findLargeTitle() {
            largeView.addSubview(avatarImageView)
            avatarImageView.frame = CGRect(
                x: UIScreen.main.bounds.width - 36 - 16,
                y: 8,
                width: 36,
                height: 36
            )
        }
    }
    
    func findLargeTitle() -> UIView? {
        guard let navigationBar = self.navigationController?.navigationBar else { return nil }
        for subview in navigationBar.subviews {
            if subview.frame.origin.y > 0 {
                return subview
            }
        }
        return nil
    }

}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let avatarSuperView = avatarImageView.superview {
            avatarImageView.frame = CGRect(
                x: UIScreen.main.bounds.width - 36 - 16,
                y: avatarSuperView.frame.height - 8 - 36,
                width: 36,
                height: 36
            )
        }
    }

}

