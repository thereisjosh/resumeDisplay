//
//  UserViewController.swift
//  resume
//
//  Created by Joshua Ang on 15/7/21.
//

import UIKit

class UserViewController: UIViewController, CustomSegmentedControlDelegate {
    
    let firstVC = FirstViewController()
    let secondVC = SecondViewController()
    let thirdVC = ThirdViewController()
    let sender = CustomSegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setNavigationBarBottomLineHidden(true)
        segmentedControl()
        containerVC()
        change()
    }
    
    @IBAction func completeAction(_ sender: UIBarButtonItem) {
        let transition = CATransition()
        transition.duration = 0.35
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
    
    func segmentedControl() {
        let codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 400, width: self.view.frame.width, height: 50), buttonTitle: ["SOFT SKILLS","TECHNICAL","LANGUAGES"])
        codeSegmented.backgroundColor = .clear
        codeSegmented.delegate = self
        view.addSubview(codeSegmented)
    }
    
    func containerVC() {
        addChild(firstVC)
        addChild(secondVC)
        addChild(thirdVC)
        
        self.view.addSubview(firstVC.view)
        self.view.addSubview(secondVC.view)
        self.view.addSubview(thirdVC.view)
        
        firstVC.didMove(toParent: self)
        secondVC.didMove(toParent: self)
        thirdVC.didMove(toParent: self)
        
        firstVC.view.frame = CGRect(x: 0, y: 460, width: kScreenW, height: kScreenH - 460)
        secondVC.view.frame = CGRect(x: 0, y: 460, width: kScreenW, height: kScreenH - 460)
        thirdVC.view.frame = CGRect(x: 0, y: 460, width: kScreenW, height: kScreenH - 460)
        
    }
    
    func change(to index:Int = 0) {
        switch index {
        case 0:
            firstVC.view.isHidden = false
            secondVC.view.isHidden = true
            thirdVC.view.isHidden = true
            break
        case 1:
            firstVC.view.isHidden = true
            secondVC.view.isHidden = false
            thirdVC.view.isHidden = true
            break
        case 2:
            firstVC.view.isHidden = true
            secondVC.view.isHidden = true
            thirdVC.view.isHidden = false
            break
        default:
            firstVC.view.isHidden = false
            secondVC.view.isHidden = true
            thirdVC.view.isHidden = true
        }
    }

    
    func setupUI() {
        let headerView = UIView(frame: CGRect(x: 0, y: 180, width: kScreenW, height: 200))
        let nameText = UILabel()
        let phoneText = UILabel()
        let emailText = UILabel()
        let linkedinButton = UIButton()
        let githubButton = UIButton()
        
        nameText.text = "Full Name"
        nameText.font = .boldSystemFont(ofSize: 20)
        nameText.textColor = .label
        nameText.textAlignment = .center
        nameText.center.y = headerView.center.y - 25
        nameText.frame.size.height = 25
        nameText.frame.size.width = headerView.frame.size.width
        
        phoneText.text = "Contact Number"
        phoneText.font = .systemFont(ofSize: 15)
        phoneText.textColor = .secondaryLabel
        phoneText.textAlignment = .center
        phoneText.center.y = headerView.center.y
        phoneText.frame.size.height = 25
        phoneText.frame.size.width = headerView.frame.size.width
        
        emailText.text = "Email Address"
        emailText.font = .systemFont(ofSize: 15)
        emailText.textColor = .secondaryLabel
        emailText.textAlignment = .center
        emailText.center.y = headerView.center.y + 20
        emailText.frame.size.height = 25
        emailText.frame.size.width = headerView.frame.size.width

        linkedinButton.setImage(#imageLiteral(resourceName: "linkedin"), for: .normal)
        linkedinButton.center.x = headerView.center.x - 44
        linkedinButton.center.y = headerView.center.y + 55
        linkedinButton.frame.size.height = 34
        linkedinButton.frame.size.width = 34
        linkedinButton.backgroundColor = .white
        linkedinButton.layer.borderColor = GlobalConstants.iconBorderColor
        linkedinButton.layer.borderWidth = GlobalConstants.iconBorderWidth
        linkedinButton.layer.cornerRadius = GlobalConstants.iconCornerRadius

        githubButton.setImage(#imageLiteral(resourceName: "github"), for: .normal)
        githubButton.center.x = headerView.center.x + 10
        githubButton.center.y = headerView.center.y + 55
        githubButton.frame.size.height = 34
        githubButton.frame.size.width = 34
        githubButton.backgroundColor = .white
        githubButton.layer.borderColor = GlobalConstants.iconBorderColor
        githubButton.layer.borderWidth = GlobalConstants.iconBorderWidth
        githubButton.layer.cornerRadius = GlobalConstants.iconCornerRadius
        
        self.view.addSubview(headerView)
        self.view.addSubview(phoneText)
        self.view.addSubview(emailText)
        self.view.addSubview(nameText)
        self.view.addSubview(linkedinButton)
        self.view.addSubview(githubButton)
        linkedinButton.addTarget(self, action: #selector(linkedinButtonClick), for: .touchUpInside)
        githubButton.addTarget(self, action: #selector(githubButtonClick), for: .touchUpInside)
    }

    
    
    @objc func linkedinButtonClick(_ sender: Any)
    {
        let appURL = URL(string: "linkedin://profile/insert-profile/")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL)
        {
            application.open(appURL)
        }
        else
        {
            let webURL = URL(string: "https://www.linkedin.com/in/insert-profile")!
            application.open(webURL)
        }
    }

    @objc func githubButtonClick(_ sender: Any)
    {
        let appURL = URL(string: "github://profile/thereisjosh")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL)
        {
            application.open(appURL)
        }
        else
        {
            let webURL = URL(string: "https://github.com/thereisjosh")!
            application.open(webURL)
        }
    }
  
}



