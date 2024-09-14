//
//  ViewController.swift
//  TimerApp
//
//  Created by 이빈 on 9/4/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 밸류값을 가지고 메인 레이블 세팅
        number = Int(sender.value * 60)
        mainLabel.text = "\(number) 초"
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈 때 마다 무언가를 실행
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doAfter1second), userInfo: nil, repeats: true)
        
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
//            //반복하고 싶은 코드
//            if number > 0 {
//                number -= 1
//                slider.value = Float(number) / Float(60)
//                mainLabel.text = "\(number) 초"
//            } else {
//                number = 0
//                mainLabel.text = "초를 선택하세요"
//                timer?.invalidate()
//                AudioServicesPlayAlertSound(SystemSoundID(1322))
//            }
//        })
    }
    
    
    @objc func doAfter1second() {
        if number > 0 {
            number -= 1
            slider.value = Float(number) / Float(60)
            mainLabel.text = "\(number) 초"
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            timer?.invalidate()
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 셋팅
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        number = 0
        timer = nil
    }
    
    
}

