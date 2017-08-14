//
//  ViewController.swift
//  youtube
//
//  Created by Eris on 2017/8/14.
//  Copyright © 2017年 eris. All rights reserved.
//

import UIKit
//TODO:記得這兩個協議
class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    //navigationItem
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellID")
        
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // UICollectionViewController
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    // UICollectionViewDelegateFlowLayout
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
//        cell.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



class VideoCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.blue
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    // 使用 ={}() 來直接快速創造出一個東西
    let separatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    func setupViews(){
        addSubview(thumbnailImageView) //在class裡面直接可直接使用addSubView加東西之後再更改大小和屬性
        addSubview(separatorView)
        //         剛開始測試的時候只是把一個方塊放上去
        //        thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        //        //可以先加進去在調整擺放位置
        
        //注意有加一個的addConstraint和加多個的addConstrains不要用錯個
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView]))
        //如果view沒有被設定為.translatesAutoresizingMaskIntoConstraints = false,以上兩句根本無法跑，會報錯：Unable to simultaneously satisfy constraints
        //剛剛只加了H:的部分沒有跑出來，也沒有提醒，記得如果手動家constrain沒加完整之前有可能跑不出來也不會報錯喔!
        //views值是字典形式，自己幫view物件給一個key String名稱在visualFormat裡使用，並在這裡再對上view物件value
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorView]))
        
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}






