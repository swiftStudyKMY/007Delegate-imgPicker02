//
//  ViewController.swift
//  007Delegate-imgPicker02
//
//  Created by 김민영 on 11/19/19.
//  Copyright © 2019 김민영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController() // 이미지 피커 컨트롤러 인스턴스 생성
        
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        
        picker.allowsEditing = true // 이미지 편집 기능 on
        
        self.present(picker, animated: false)
    }
    
}

//MARK: UIImagePickerControllerDelegate
extension ViewController : UIImagePickerControllerDelegate {
    
}
//MARK: UINavigationControllerDelegate
extension ViewController : UINavigationControllerDelegate {
    
}
