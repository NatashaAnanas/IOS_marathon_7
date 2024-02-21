//
//  ViewController.swift
//  IOS_marathon_7
//
//  Created by Наталья Коновалова on 21.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.indicatorStyle = .white
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "kakashiBook")
        return imageView
    }()
    
    private let imageViewHeight: CGFloat = 170
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }
    
    private func setupInitialState() {
        setupFrame()
        addSubviews()
        setupScrollViewSettings()
    }
    
    private func setupScrollViewSettings() {
        view.backgroundColor = .black
        scrollView.delegate = self
        scrollView.contentSize =  CGSize(width: view.frame.width, height: 1.5 * view.frame.height)
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    private func setupFrame() {
        scrollView.frame = view.frame
        imageView.frame = CGRect(x: 0, y: 0 , width: scrollView.frame.width, height: imageViewHeight)
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 0 {
            imageView.frame = CGRect(x: 0,
                                     y: scrollView.contentOffset.y,
                                     width: view.frame.width,
                                     height: imageViewHeight - scrollView.contentOffset.y + view.safeAreaInsets.top)
            
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: imageViewHeight - scrollView.contentOffset.y,
                                                            left: 0,
                                                            bottom: 0,
                                                            right: 0)
            scrollView.contentOffset.y < -150
            ? (imageView.image = UIImage(named: "kakashiLight"))
            : (imageView.image = UIImage(named: "kakashiBook"))
        }
    }
}
