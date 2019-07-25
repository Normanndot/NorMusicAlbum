//
//  ViewController.swift
//  NorMusicAlbum
//
//  Created by MacBook on 7/23/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var viewModel = PhotoVM()
    @IBOutlet weak var tableView: UITableView!
    var refreshControl = UIRefreshControl()
    var refreshCompleted:((String?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Albums"
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: PhotoInfoTableViewCell.reuseIdentifier,
                                 bundle: nil),
                           forCellReuseIdentifier: PhotoInfoTableViewCell.reuseIdentifier)
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(viewModel, action: #selector(viewModel.refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)

        //User will not navigate to next page by the intial launch
        viewModel.fetchPhotoList { [unowned self] in
            DispatchQueue.main.sync(execute: {
                self.tableView.reloadData()
            })
        }
        
        //User may navigate to next page and we are not sure wheather it will be de scoped
        viewModel.refreshCompleted = { [weak self] aString in
            DispatchQueue.main.sync(execute: {
                self?.refreshControl.endRefreshing()
                self?.tableView.reloadData()
            })
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoInfoTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? PhotoInfoTableViewCell else {
                                                        return UITableViewCell()
        }
        
        cell.cellModel = viewModel.cellModel(index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let aStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = aStoryBoard.instantiateViewController(withIdentifier: AlbumDetailInfoVC.storyBoardIdentifier)
        
        if let aVC = vc as? AlbumDetailInfoVC {
            aVC.cellModel = viewModel.cellModel(index: indexPath.row)
            self.navigationController?.pushViewController(aVC, animated: true)
        }
    }
}
