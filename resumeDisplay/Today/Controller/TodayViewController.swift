//
//  TodayViewController.swift
//  resume
//
//  Created by Joshua Ang on 25/6/21.
//

import UIKit

class TodayViewController: UITableViewController {
    
    var selectedCell: TodayTableViewCell?
    
    
    var statusBarShouldBeHidden = false
    //we need to set `View controller-based status bar appearance = YES` in info.plist.
    //so we can be able to hide statusBar.
    override var prefersStatusBarHidden: Bool {
        return statusBarShouldBeHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    lazy var headerView: TodayTableHeaderView = {
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: 96)
        let view = TodayTableHeaderView(frame: frame)
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
        tableView.ut_registerClassCell(TodayTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.rowHeight = GlobalConstants.toDayCardRowH
        tableView.tableHeaderView = headerView
    }
    
    private func updateStatusBarAndTabbarFrame(visible: Bool) {
        statusBarShouldBeHidden = !visible
        UIView.animate(withDuration: 0.25) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ut_dequeueReusable(TodayTableViewCell.self, for: indexPath)
        cell.selectionStyle = .none
        cell.tag = indexPath.row
        if indexPath.row == 0 {
            cell.bgImageView.image = #imageLiteral(resourceName: "cover_4")
            cell.titleView.text = "Company"
            cell.subtitleView.text = "ROLE"
            cell.descView.text = "October 2015 - December 2016"
        } else if indexPath.row == 1 {
            cell.bgImageView.image = #imageLiteral(resourceName: "cover_4")
            cell.titleView.text = "Company"
            cell.subtitleView.text = "ROLE"
            cell.descView.text = "December 2017 – July 2018"
        } else {
            cell.bgImageView.image = #imageLiteral(resourceName: "cover_4")
            cell.titleView.text = "Company"
            cell.subtitleView.text = "ROLE"
            cell.descView.text = "July 2020 – December 2020"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let row = tableView.cellForRow(at: indexPath) as? TodayTableViewCell else { return }
        UIView.animate(withDuration: 0.2) {
            row.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)

        }
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        guard let row = tableView.cellForRow(at: indexPath) as? TodayTableViewCell else { return }
        UIView.animate(withDuration: 0.3) {
            row.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let cell = tableView.cellForRow(at: indexPath) as? TodayTableViewCell else { return }
       
        selectedCell = cell
       
            let detailVC = CardDetailViewController(cell: cell)
            
            detailVC.dismissClosure = { [weak self] in
                guard let StrongSelf = self else { return }
                StrongSelf.updateStatusBarAndTabbarFrame(visible: true)
            }
            
            updateStatusBarAndTabbarFrame(visible: false)
        
        //You have to pass text here to CardDetailViewController
        
        if indexPath.row == 0 {
            CardDetailViewController.titleTextForCell = "Company"
            CardDetailViewController.subtitleTextForCell = "ROLE"
            CardDetailViewController.descTextForCell = "October 2015 - December 2016"
            CardDetailViewController.detailTextForCell = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus arcu et magna vulputate suscipit. Morbi lobortis tempus tempus. Morbi id sem quis diam laoreet gravida. Sed laoreet ipsum sem, sed tristique mi consequat et. Aenean in nunc nec turpis commodo ornare. Morbi consequat purus nec orci imperdiet, ac luctus elit gravida. Quisque in sem eget ipsum aliquam gravida ut in nulla."

        }
        else if indexPath.row == 1 {
            CardDetailViewController.titleTextForCell = "Company"
            CardDetailViewController.subtitleTextForCell = "ROLE"
            CardDetailViewController.descTextForCell = "December 2017 – July 2018"
            CardDetailViewController.detailTextForCell = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus arcu et magna vulputate suscipit. Morbi lobortis tempus tempus. Morbi id sem quis diam laoreet gravida. Sed laoreet ipsum sem, sed tristique mi consequat et. Aenean in nunc nec turpis commodo ornare. Morbi consequat purus nec orci imperdiet, ac luctus elit gravida. Quisque in sem eget ipsum aliquam gravida ut in nulla."
        }
        else if indexPath.row == 2 {
            CardDetailViewController.titleTextForCell = "Company"
            CardDetailViewController.subtitleTextForCell = "ROLE"
            CardDetailViewController.descTextForCell = "July 2020 – December 2020"
            CardDetailViewController.detailTextForCell = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus arcu et magna vulputate suscipit. Morbi lobortis tempus tempus. Morbi id sem quis diam laoreet gravida. Sed laoreet ipsum sem, sed tristique mi consequat et. Aenean in nunc nec turpis commodo ornare. Morbi consequat purus nec orci imperdiet, ac luctus elit gravida. Quisque in sem eget ipsum aliquam gravida ut in nulla."
        }
        
            present(detailVC, animated: true, completion: nil)
        
        
    }
}





