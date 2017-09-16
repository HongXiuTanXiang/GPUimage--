//
//  ViewController.swift
//  GPUImage-useage
//
//  Created by lihe on 2017/9/16.
//  Copyright © 2017年 lihe. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1.获取修改的图片
        let sourceImage = UIImage(named: "meinv")!
        
        // 2.使用GPUImage高斯模糊效果
        // 2.1.如果是对图像进行处理GPUImagePicture
        let picProcess = GPUImagePicture(image: sourceImage)
        
        // 2.2.添加需要处理的滤镜
        let blurFilter = GPUImageGaussianBlurFilter()
        // 纹理
        blurFilter.texelSpacingMultiplier = 5
        blurFilter.blurRadiusInPixels = 3
        picProcess?.addTarget(blurFilter)
        
        // 2.3.处理图片
        blurFilter.useNextFrameForImageCapture()
        picProcess?.processImage()
        
        // 2.4.取出最新的图片
        let newImage = blurFilter.imageFromCurrentFramebuffer()
        
        // 3.显示最新的图片
        imageView.image = newImage
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

