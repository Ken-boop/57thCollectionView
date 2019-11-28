//
//  ViewController.swift
//  Collection
//
//  Created by 城間健太郎 on 2019/11/28.
//  Copyright © 2019 joma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    

    let images = [
        "airport",
        "bag"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // コレクションビューに表示するセルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    // コレクションビューのセルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // セルを取得（名前と番号で）
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // セルの中のImageViewをタグ番号で取得&画像の設定
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: images[indexPath.row])
        
        let label = cell.contentView.viewWithTag(3) as!
        UILabel
        label.text = "hello"
        
        // 出来上がったセルを返す
        return cell
    }
    
    
}


// COllectionViewのデザインを調整するための拡張
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 画面の幅を取得
        // self.view.bounds.width : 画面の幅が取れてくる
        let screenSize = self.view.bounds.width
        
        // 画面の幅の半分の幅を計算s
        let cellSize = screenSize / 2 - 5
        
        return CGSize(width: cellSize, height: cellSize)
        
    }
    
}
