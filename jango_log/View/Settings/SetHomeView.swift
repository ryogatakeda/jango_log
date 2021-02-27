//SetHomeView.swift
//作成日：2021/02/13.
//
//概要
//ホーム設定画面のView
//ホーム画面に表示する情報を設定する画面を表示する

import UIKit

class SetHomeView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //テーブルビューインスタンス作成
    var tableView: UITableView  =   UITableView()
    //セクション名
    var secName = "総合収支表示"
    //セルの内容
    var cellData = "収支＋場代＋給与"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スクリーンの情報取得
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height
        // ナビゲーションバーの高さを取得
        let navigationController: UINavigationController = UINavigationController()
        let navigationBarHeight = navigationController.navigationBar.frame.size.height
        
        //余計なセルを消す
        tableView.tableFooterView = UIView()
        //ナビゲーションバーにテーブルビューが潜る現象対応
        edgesForExtendedLayout = []

        
        //テーブルビュー初期化、関連付け
        tableView.frame         =   CGRect(x: 0, y: 0, width: screenWidth, height: 105)
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel!.text = cellData
        cell.textLabel!.font = UIFont(name: "Arial", size: 18)
        
        return cell
    }
    //セルの高さを固定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
    
    // セクション名を返すメソッド
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return secName
        }
}
