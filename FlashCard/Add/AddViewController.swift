//
//  AddViewController.swift
//  FlashCard
//
//  Created by sue on 2019/03/31.
//  Copyright © 2019 sue. All rights reserved.
//

import UIKit
import RealmSwift
import UserNotifications

class AddViewController: UIViewController {
    @IBOutlet private weak var EnglishLabel: UILabel!
    @IBOutlet private weak var EnglishText: UITextField!
    @IBOutlet private weak var JapaneseLabel: UILabel!
    @IBOutlet private weak var JapaneseText: UITextField!
    @IBOutlet private weak var GenreLabel: UILabel!
    @IBOutlet private weak var GenreText: UITextField!
    
    var flashCard: FlashCard!
    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        //lsじょf；ボイ
//        pickerはこんな感じ
//        datePicker.date = task.date as Date
        EnglishText.text = flashCard.en
        JapaneseText.text = flashCard.jpn
        GenreText.text = flashCard.genre    ///pickerにする
    }
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            
//            self.task.date = self.datePicker.date as NSDate
            self.flashCard.en = self.EnglishText.text!
            self.flashCard.jpn = self.JapaneseText.text!
            self.flashCard.genre = self.GenreText.text!     ///pickerにする
            self.realm.add(self.flashCard, update: true)
        }
        
//        setNotification(fc: flashCard)
        super.viewWillDisappear(animated)
    }
    
    // タスクのローカル通知を登録する
//    func setNotification(fc: FlashCard) {
//        let content = UNMutableNotificationContent()
//        content.title = task.title
//        content.body  = task.contents       // bodyが空だと音しか出ない
//        content.sound = UNNotificationSound.default()
//
//        // ローカル通知が発動するtrigger（日付マッチ）を作成
//        let calendar = NSCalendar.current
//        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: task.date as Date)
//        let trigger = UNCalendarNotificationTrigger.init(dateMatching: dateComponents, repeats: false)
//
//        // identifier, content, triggerからローカル通知を作成（identifierが同じだとローカル通知を上書き保存）
//        let request = UNNotificationRequest.init(identifier: String(task.id), content: content, trigger: trigger)
//
//        // ローカル通知を登録
//        let center = UNUserNotificationCenter.current()
//        center.add(request) { (error) in
//            print(error ?? "ローカル通知登録 OK")  // error が nil ならローカル通知の登録に成功したと表示します。errorが存在すればerrorを表示します。
//        }
//
//        // 未通知のローカル通知一覧をログ出力
//        center.getPendingNotificationRequests { (requests: [UNNotificationRequest]) in
//            for request in requests {
//                print("/---------------")
//                print(request)
//                print("---------------/")
//            }
//        }
//    }

    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
