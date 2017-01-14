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
    super.init(collectionViewLayout: layout)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNav()
    collectionView?.backgroundColor = .white
    
     collectionView?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: UICollectionReusableView.description())
    
    collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.description())
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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 2)
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: UICollectionReusableView.description(), for: indexPath)
    view.backgroundColor = .lightGray
    return view
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.description(), for: indexPath)
    cell.contentView.backgroundColor = .lightGray
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 150, height: 150)
  }
}

