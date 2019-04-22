////
////  GenreViewController.swift
////  FlashCard
////
////  Created by sue on 2019/04/05.
////  Copyright © 2019 sue. All rights reserved.
////
//
//import UIKit
//import RealmSwift
//
//class GenreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    @IBOutlet weak var tableView: UITableView!
//    
//    let realm = try! Realm()
//    // DB内のタスクが格納されるリスト。
//    // 日付近い順\順でソート：降順
//    // 以降内容をアップデートするとリスト内は自動的に更新される。
//    var fcArray = try! Realm().objects(FlashCard.self).sorted(byKeyPath: "date", ascending: false)
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    //SearchBarに文字が入力されたら、入力された文字を使ってカテゴリを検索する
////    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
////        print("searchText: \(searchText)")
////        let predicate = NSPredicate(format: "category BEGINSWITH %@",searchText)
////        taskArray = realm.objects(Task.self).filter(predicate)
////        tableView.reloadData()
////    }
/////    【TODO】countのところ
//    // MARK: UITableViewDataSourceプロトコルのメソッド
//    // データの数（＝セルの数）を返すメソッド
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return fcArray.count
//    }
/////    【TODO】cellのところ
//    // 各セルの内容を返すメソッド
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // 再利用可能な cell を得る
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        // Cellに値を設定する.
//        let task = fcArray[indexPath.row]
//        cell.textLabel?.text = task.en
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm"
//        
//        let dateString:String = formatter.string(from: task.date as Date)
//        cell.detailTextLabel?.text = dateString
//        
//        return cell
//    }
//    // MARK: UITableViewDelegateプロトコルのメソッド
//    // 各セルを選択した時に実行されるメソッド
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "cellSegue",sender: nil)
//    }
//    // セルが削除が可能なことを伝えるメソッド
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle {
//        return UITableViewCell.EditingStyle.delete
//    }
////     segue で画面遷移するに呼ばれる
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        let addVC: AddViewController = segue.destination as! AddViewController
//
//        if segue.identifier == "cellSegue" {
//            let indexPath = self.tableView.indexPathForSelectedRow
//            addVC.flashCard = fcArray[indexPath!.row]
//        } else {
//            let flashCard = FlashCard()
//            flashCard.date = NSDate()
//
//            if fcArray.count != 0 {
//                flashCard.id = fcArray.max(ofProperty: "id")! + 1
//            }
//
//            addVC.flashCard = flashCard
//        }
//    }
//    // 入力画面から戻ってきた時に TableView を更新させる
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//    }
//    // Delete ボタンが押された時に呼ばれるメソッド
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//        
//            // 削除されたタスクを取得する
//            let task = self.fcArray[indexPath.row]
//            
//            // ローカル通知をキャンセルする
////            let center = UNUserNotificationCenter.current()
////            center.removePendingNotificationRequests(withIdentifiers: [String(task.id)])
//            
//            // データベースから削除する
//            try! realm.write {
//                self.realm.delete(task)
//                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)
//            }
//            
//            // 未通知のローカル通知一覧をログ出力
////            center.getPendingNotificationRequests { (requests: [UNNotificationRequest]) in
////                for request in requests {
////                    print("/---------------")
////                    print(request)
////                    print("---------------/")
////                }
////            }
//        }
//    }
//}
