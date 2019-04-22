//
//  FlashCard.swift
//  FlashCard
//
//  Created by sue on 2019/04/05.
//  Copyright © 2019 sue. All rights reserved.
//

import RealmSwift
///【TODO】　parameter変更！！！！
class FlashCard: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0
    
    // 英語
    @objc dynamic var en = ""
    
    // 日本語
    @objc dynamic var jpn = ""
    
    //ジャンル
    @objc dynamic var genre = ""
    
    /// 日時
    @objc dynamic var date = NSDate()
    
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
}
