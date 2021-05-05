//
//  WelcomeViewController.swift
//  layout_exercice_2
//
//  Created by William on 12.01.21.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    let textTitle = UILabel()
    let textSecondary = UILabel()
    let startButton = UIButton()
    let background_image_1 = UIImageView(image: UIImage(named: "Rectangle 1"))
    let background_image_2 = UIImageView(image: UIImage(named: "Rectangle 3"))
    let background_image_3 = UIImageView(image: UIImage(named: "Rectangle 5"))
    let background_image_4 = UIImageView(image: UIImage(named: "Rectangle 9"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textTitle)
        view.addSubview(textSecondary)
        view.addSubview(background_image_1)
        view.addSubview(background_image_2)
        view.addSubview(background_image_3)
        view.addSubview(background_image_4)
        view.addSubview(startButton)
        loadTextTitle()
        loadTextSecondary()
        loadButton()
        loadBackgroundImages()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @objc
    func buttonAction() {
        print("Button pressed")
        startButton.tintColor = .darkGray
        self.performSegue(withIdentifier: "WelcomeToMain", sender: self)
    }
    
    
    
    
    
    
    
    // MARK: - Settings Views & Layout Constraints
    func loadTextTitle(){
        textTitle.text = "Hello!"
        textTitle.textColor = .black
        textTitle.font = UIFont.systemFont(ofSize: 75, weight: .bold)
        
        textTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(250)
            make.right.equalTo(view).offset(30)
            make.left.equalTo(view).offset(30)
        }
    }
    
    func loadTextSecondary(){
            textSecondary.text = "Investing is easy!\nIncrease your income\nand be happy!"
            textSecondary.textColor = .darkGray
            textSecondary.font = UIFont(name: "Futura", size: 20)
            textSecondary.numberOfLines = 0
            textSecondary.snp.makeConstraints { (make) in
                make.top.equalTo(view.subviews[0].snp_bottomMargin).offset(20)
                make.right.equalTo(view).offset(-30)
                make.left.equalTo(view).offset(30)
            }
        }
    
    func loadButton(){
        startButton.showsTouchWhenHighlighted = true
        startButton.addTarget(self,
                              action: #selector(buttonAction),
                              for: .touchUpInside)
        startButton.tintColor = .black
        startButton.setTitle("Get Started", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = .black
        startButton.layer.cornerRadius = 15
        startButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-50)
            make.right.equalTo(view).offset(-30)
            make.left.equalTo(view).offset(30)
            make.height.greaterThanOrEqualTo(50)
        }
        
    }
    
    func loadBackgroundImages(){
        background_image_1.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(-15)
            make.right.equalTo(view).offset(15)
        }
        
        background_image_2.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(300)
            make.right.equalTo(view).offset(-30)
        }
        background_image_3.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-10)
            make.right.equalTo(view).offset(-150)
            make.height.greaterThanOrEqualTo(100)
            make.width.greaterThanOrEqualTo(100)
        }
        background_image_4.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-250)
            make.left.equalTo(view).offset(-15)
            
            
        }
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
