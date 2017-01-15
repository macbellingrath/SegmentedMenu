//
//  ViewController.swift
//  SegmentedMenu
//
//  Created by Mac Bellingrath on 1/14/17.
//  Copyright © 2017 Mac Bellingrath. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  private var items: [String] = ["hi", "there"]
  
  
  init() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.sectionInset = UIEdgeInsets(top: 50, left: 9, bottom: -10, right: 9)
    super.init(collectionViewLayout: layout)
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNav()
    collectionView?.backgroundColor = UIColor.lightGrayBackground
    collectionView?.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseIdentifier)
  }
  
  /// set's title to Menu and hamburger icon
  private func setupNav() {
    title = "MENU"
    
    navigationItem.setLeftBarButton(Hamburger(target: self, action: #selector(menuTapped)), animated: true)
    
    navigationItem.setRightBarButton(MagnifyingGlass(target: self, action: #selector(searchTapped)), animated: true)

  }
  
  /// when hamburger icon is tapped
  ///
  /// - Parameter sender: hamburger bar button item
  @objc private func menuTapped(sender: UIBarButtonItem) {}
  
  @objc private func searchTapped(sender: UIBarButtonItem) {}
  
  
  //MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseIdentifier, for: indexPath)
    return cell
  }
  

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let sectionInsets = (collectionViewLayout as! UICollectionViewFlowLayout).sectionInset
    let contentInsets = collectionView.contentInset
    let width = collectionView.frame.width - (sectionInsets.left + contentInsets.left + sectionInsets.right + contentInsets.right)
   
    return CGSize(width: width, height: width * 1.5)
  }
}

protocol Reusable {
  static var reuseIdentifier: String { get }
}
extension Reusable {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

class CardCell: UICollectionViewCell,
  Reusable,
  UITableViewDelegate,
  UITableViewDataSource {
  
  let tableview: UITableView
  
  override init(frame: CGRect) {
    
    tableview = UITableView(frame: frame, style: .plain)
    super.init(frame: frame)
    addSubview(tableview)
    tableview.dataSource = self
    tableview.delegate = self
    tableview.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
    tableview.separatorStyle = .none
    backgroundColor = .white
    contentView.backgroundColor = .white
    setRoundedCorners()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    tableview.frame = super.contentView.frame
  }
  
  override var contentView: UIView {
    return tableview
  }
  
  private func setRoundedCorners() {
    contentView.layer.masksToBounds = true
    [contentView, self].forEach {  view in
      view.layer.cornerRadius = 10
      view.layer.borderWidth = 1
      view.layer.borderColor = UIColor.clear.cgColor
    }
  
    
    layer.shadowColor   = UIColor.darkGray.cgColor
    layer.shadowOffset  = CGSize(width: 0, height: 2)
    layer.shadowRadius  = 2
    layer.shadowOpacity = 1
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
  }
  

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Shots       Small     Large"
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableview.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
    
    cell.textLabel?.text = "Hello"
    
    return cell
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
