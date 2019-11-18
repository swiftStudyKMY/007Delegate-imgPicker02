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
        
        picker.delegate = self // delegate 지정
        
        self.present(picker, animated: false)
    }
    
}

//MARK: "UIImagePickerControllerDelegate"
extension ViewController : UIImagePickerControllerDelegate {
    
    // 이미지 선택하지 않고 취소했을때 호출
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

//      * 경합 가능성으로 버그 발생 가능성 증가
//        self.dismiss(animated: false)
//        //picker.presentingViewController?.dismiss(animated: false)
//
//        let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
//
//        self.present(alert,animated: false)

        
//      ** 이미지 피커 컨트롤러 창이 완전히 닫힌 후 다음 로직 수행
//      self.dismiss(animated: false, completion: {() in
//        self.dismiss(animated: false, completion: {() in
//            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
//
//            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
//
//            self.present(alert,animated: false)
//        })
//      가독성을 해침.
        

//      *** 트레일링 클로저 문법?
        self.dismiss(animated: false){() in
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
                
            self.present(alert,animated: false)
        }

        
    }
    
    // 이미지 선택하면 호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: false){() in
            // 이미지를 뷰에 표시
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
        
    }
}
//MARK: "UINavigationControllerDelegate"
extension ViewController : UINavigationControllerDelegate {
    
}
