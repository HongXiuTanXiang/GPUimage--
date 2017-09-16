//
//  ViewController.swift
//  GPUImage-美颜相机
//
//  Created by lihe on 2017/9/16.
//  Copyright © 2017年 lihe. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {

    @IBOutlet var imageView : UIImageView!
    
    fileprivate lazy var camera : GPUImageStillCamera = GPUImageStillCamera(sessionPreset: AVCaptureSessionPresetHigh, cameraPosition: .front)
    fileprivate lazy var filter = GPUImageBrightnessFilter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.创建GPUImageStillCamera
        camera.outputImageOrientation = .portrait
        
        // 2.创建滤镜(美白/曝光)
        // let filter = GPUImageBrightnessFilter()
        filter.brightness = 0.7
        camera.addTarget(filter)
        
        // 3.创建GPUImageView,用于显示实时画面
        let showView = GPUImageView(frame: view.bounds)
        view.insertSubview(showView, at: 0)
        filter.addTarget(showView)
        
        // 4.开始捕捉画面
        camera.startCapture()
    }
    
    @IBAction func takePhoto() {
        camera.capturePhotoAsImageProcessedUp(toFilter: filter, withCompletionHandler: { (image, error) in
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
            self.imageView.image = image
            
            self.camera.stopCapture()
        })
    }


}

