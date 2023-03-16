//
//  SettingsTableViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/16.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    let settingStrings = ["친구 팔로우 및 초대","알림","개인정보 보호","관리 감독","보안","광고","계정","도움말","정보"]
    let accountString = ["개인정보","저장됨","친한 친구","계정 상태","아바타","언어","캡션","민감한 내용이 포함된 콘텐츠 관리하기","연락처 동기화","다른 앱과 공유","데이터 사용","원본 사진","인증 요청","활동 검토","브랜디드 콘텐츠","계정 삭제"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(row: Int) {
        label.text = settingStrings[row]
    }
    
    func updateAccoutUI(row: Int) {
        label.text = accountString[row]
    }
}
