//SetView.swift
//作成日：2021/02/13.
//
//概要
//設定画面のView
//各設定をリスト表示する

import UIKit

class SetView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ナビゲーションバーの表示
//        navigationController?.navigationBar.isHidden = false
//        title = "あいおうえ"
        
        //おまじない
        self.tableView = {
            let tableView = UITableView(frame: self.view.bounds,style: .plain)
            tableView.autoresizingMask = [
                .flexibleWidth,
                .flexibleHeight
            ]
            //余計なセルを消す
            tableView.tableFooterView = UIView()
            tableView.delegate = self
            tableView.dataSource = self
            
            self.view.addSubview(tableView)
            
            return tableView
        }()
    }
    
    //Tableをインスタンス化
    var tableView:UITableView = UITableView()
    //設定画面セクション
    let setViewSec = ["カテゴリ設定","シフト設定","ホーム設定","お問い合わせ"]
    //中身
    let cateDet = ["新規","セット","フリー（本走）","フリー（客打ち）"]
    let shiftDet = ["新規","麻雀ランド39"]
    let homeDet = ["ホームの表示"]
    let contact = ["お問い合わせ"]
    
    // セクション数を返すメソッド
        func numberOfSections(in tableView: UITableView) -> Int {
            return setViewSec.count
        }
    
    // セクション名を返すメソッド
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return setViewSec[section]
        }
    
    // セクションデータ数（Detの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return cateDet.count
        case 1:
            return shiftDet.count
        case 2:
            return homeDet.count
        case 3:
            return contact.count
        default:
            return 0
        }
    }
    
    // セルにデータ（Det）を設定するメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        switch indexPath.section {
        case 0:
            cell.textLabel!.text = cateDet[indexPath.row]
        case 1:
            cell.textLabel!.text = shiftDet[indexPath.row]
        case 2:
            cell.textLabel!.text = homeDet[indexPath.row]
        case 3:
            cell.textLabel!.text = contact[indexPath.row]
        default:
            break
        }
        return cell
    }
    
    //セルの高さを固定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
    
    //セルタップ時の操作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //カテゴリ設定画面へ遷移
        let setCVC = SetCategoryView.init()
        self.navigationController?.pushViewController(setCVC, animated:true )
    }
}
