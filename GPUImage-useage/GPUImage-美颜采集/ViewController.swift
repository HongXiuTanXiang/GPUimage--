//
//  ViewController.swift
//  GPUImage-美颜采集
//
//  Created by lihe on 2017/9/16.
//  Copyright © 2017年 lihe. All rights reserved.
//


import UIKit
import GPUImage

class ViewController: UIViewController {
    fileprivate lazy var camera : GPUImageVideoCamera = GPUImageVideoCamera(sessionPreset: AVCaptureSessionPreset640x480, cameraPosition: .back)
    fileprivate lazy var filter = GPUImageBrightnessFilter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.添加滤镜
        camera.outputImageOrientation = .portrait
        camera.addTarget(filter)
        camera.delegate = self
        
        // 2.添加一个用于实时显示画面的GPUImageView
        let showView = GPUImageView(frame: view.bounds)
        view.addSubview(showView)
        filter.addTarget(showView)
        
        // 3.开始采集画面
        camera.startCapture()
    }
}

extension ViewController : GPUImageVideoCameraDelegate {
    func willOutputSampleBuffer(_ sampleBuffer: CMSampleBuffer!) {
        print("采集到画面")
    }
}

