//
//  ViewController.swift
//  OthersFilter
//
//  Created by lihe on 2017/9/16.
//  Copyright © 2017年 lihe. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    fileprivate lazy var image : UIImage = UIImage(named: "meinv")!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func test0(){
        
        let filter0 = GPUImageSepiaFilter()
        imageView.image = procressImage(filter0)
    }
    
    @IBAction func test1(){
        
        let filter0 = GPUImageSketchFilter()
        imageView.image = procressImage(filter0)
        
    }

    
    @IBAction func test2(){
        
        let filter0 = GPUImageToonFilter()
        imageView.image = procressImage(filter0)
        
    }

    
    @IBAction func test3(){
        
        let filter0 = GPUImageEmbossFilter()
        imageView.image = procressImage(filter0)
        
    }
    
    
    func procressImage(_ filter:GPUImageFilter)->UIImage? {
        // 2.1.如果是对图像进行处理GPUImagePicture
        let picProcess = GPUImagePicture(image: image)
        
        // 2.2.添加需要处理的滤镜
        picProcess?.addTarget(filter)
        
        // 2.3.处理图片
        filter.useNextFrameForImageCapture()
        picProcess?.processImage()
        
        // 2.4.取出最新的图片
        return filter.imageFromCurrentFramebuffer()
    }



}

