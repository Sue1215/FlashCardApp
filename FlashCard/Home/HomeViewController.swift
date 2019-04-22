//
//  HomeViewController.swift
//  FlashCard
//
//  Created by sue on 2019/03/31.
//  Copyright © 2019 sue. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet private weak var tableView: UITableView!
    let genre = ["daily", "conversation", "mail", "call", "restaurant", "publicInstitution", "hospital", "other"]
//    enum genre {
//        case daily
//        case conversation
//        case mail
//        case call
//        case restaurant
//        case publicInstitution
//        case hospital
//        case other
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genre.count
    }

    //セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = genre[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    // セルが削除が可能なことを伝えるメソッド
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle {
//        return UITableViewCell.EditingStyle.delete
//    }
    
    // Delete ボタンが押された時に呼ばれるメソッド
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//    }
}
