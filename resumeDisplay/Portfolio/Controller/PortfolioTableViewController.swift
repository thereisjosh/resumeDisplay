//
//  PortfolioTableViewController.swift
//  resume
//
//  Created by Joshua Ang on 13/7/21.
//


import UIKit

class PortfolioTableViewController: UITableViewController {
    
    
    var selectedCell: PortfolioTableViewCell?

    
    var statusBarShouldBeHidden = false
    //we need to set `View controller-based status bar appearance = YES` in info.plist.
    //so we can be able to hide statusBar.
    override var prefersStatusBarHidden: Bool {
        return statusBarShouldBeHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    lazy var headerView: PortfolioTableHeaderView = {
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: 96)
        let view = PortfolioTableHeaderView(frame: frame)
        view.iconButtonClosure = { [weak self] in
            guard let StrongSelf = self else { return }
            StrongSelf.presentUserTableViewController()
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.ut_registerClassCell(PortfolioTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.rowHeight = GlobalConstants.skillsCardSize.height
        tableView.tableHeaderView = headerView
    }
    
    private func updateStatusBarAndTabbarFrame(visible: Bool) {
        statusBarShouldBeHidden = !visible
        UIView.animate(withDuration: 0.25) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 10, width: kScreenW, height: 40))
        let headerText = UILabel()
        let subtitleText = UILabel()
        
        headerText.font = .systemFont(ofSize: 16, weight: .semibold)
        headerText.textColor = .label
        headerText.textAlignment = .left
        headerText.frame.origin.x = headerView.frame.origin.x + 20
        headerText.frame.origin.y = headerView.frame.origin.y
        headerText.frame.size.height = 16
        headerText.frame.size.width = headerView.frame.size.width
        
        subtitleText.font = .systemFont(ofSize: 12)
        subtitleText.textColor = .secondaryLabel
        subtitleText.textAlignment = .left
        subtitleText.frame.origin.x = headerView.frame.origin.x + 20
        subtitleText.frame.origin.y = headerView.frame.origin.y + 20
        subtitleText.frame.size.height = 12.5
        subtitleText.frame.size.width = headerView.frame.size.width
        
        if section == 0 {
            headerText.text = "Raynproof"
            subtitleText.text = "Mechanical Engineering Design"
        } else if section == 1 {
            headerText.text = "Resume iPhone App"
            subtitleText.text = "iOS Development"
        }
        
        headerView.addSubview(headerText)
        headerView.addSubview(subtitleText)
        
        return headerView
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ut_dequeueReusable(PortfolioTableViewCell.self, for: indexPath)
        cell.selectionStyle = .none
        cell.tag = indexPath.row
        cell.viewController = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? PortfolioTableViewCell {

               cell.viewPhotos.tag = indexPath.section

           }
    }
    
    
//    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
//        guard let row = tableView.cellForRow(at: indexPath) as? PortfolioTableViewCell else { return }
//
//        UIView.animate(withDuration: 0.3) {
//            row.transform = CGAffineTransform(scaleX: 1.02, y: 1.02)
//            row.bgBackView.layer.shadowRadius = 10
//            row.bgBackView.layer.shadowOpacity = 0.5
//            row.bgBackView.layer.shadowOffset = CGSize(width: 0 , height: 5)
//
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
//        guard let row = tableView.cellForRow(at: indexPath) as? PortfolioTableViewCell else { return }
//        UIView.animate(withDuration: 0.3) {
//            row.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//            let animation = CABasicAnimation(keyPath: "shadowOpacity")
//            animation.fromValue = row.bgBackView.layer.shadowOpacity
//            animation.toValue = 0
//            animation.duration = 0.3
//            row.bgBackView.layer.add(animation, forKey: animation.keyPath)
//            row.bgBackView.layer.shadowOpacity = 0
//        }
//    }

    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 25))
        footerView.backgroundColor = .clear
        return footerView
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    
    
}






