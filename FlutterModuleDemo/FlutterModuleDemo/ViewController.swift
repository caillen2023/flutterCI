//
//  ViewController.swift
//  FlutterModuleDemo
//
//  Created by xiemy on 2024/3/9.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    var flutterEngine = FlutterEngine(name: "flutter_engine")
    var flutterVC: FlutterViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        flutterEngine.run()
        flutterVC = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        
    }
    
    @IBAction func pushFlutter(_ sender: Any) {
        if let flutterVC {
            // 创建MethodChannel
            let methodChannel = FlutterMethodChannel(name: "one_page", binaryMessenger: flutterVC.binaryMessenger)
            
            // 告诉Flutter准备One页面
            methodChannel.invokeMethod("one", arguments: nil) { result in
                print(result as Any)
            }
            
            // 弹出页面
            flutterVC.modalPresentationStyle = .fullScreen
            present(flutterVC, animated: true)
            
            // 监听flutter回调
            methodChannel.setMethodCallHandler { [weak self] call, result in
                if call.method == "exit" {
                    self?.dismiss(animated: true)
                }
            }
        }
    }
    
    @IBAction func pushFlutter2(_ sender: Any) {
        if let flutterVC {
            // 创建MethodChannel
            let methodChanne2 = FlutterMethodChannel(name: "two_page", binaryMessenger: flutterVC.binaryMessenger)
            
            // 告诉Flutter准备One页面
            methodChanne2.invokeMethod("two", arguments: nil) { result in
                print(result as Any)
            }
            
            // 弹出页面
            flutterVC.modalPresentationStyle = .fullScreen
            present(flutterVC, animated: true)
            
            // 监听flutter回调
            methodChanne2.setMethodCallHandler { [weak self] call, result in
                if call.method == "exit" {
                    self?.dismiss(animated: true)
                }
            }
        }
    }
    
    @IBAction func sendBasicMessage() {
        if let flutterVC {
            
        }
//        = FlutterBasicMessageChannel(name)
    }
}

