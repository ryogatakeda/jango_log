//StatsView.swift
//作成日：2021/02/13.
//
//概要
//収支画面のView
//各カテゴリの収支をリスト表示する

import UIKit
class ShopCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var textLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
class ShopTableViewCell: UITableViewCell {

     var shopCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // カスタムセルの登録
        let nib = UINib(nibName: "ShopCollectionViewCell", bundle: nil)
        shopCollectionView.register(nib, forCellWithReuseIdentifier: "ShopCollectionViewCell2")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {

        shopCollectionView.delegate = dataSourceDelegate
        shopCollectionView.dataSource = dataSourceDelegate
        shopCollectionView.tag = row
        shopCollectionView.reloadData()
    }
}


class StatsView: UIViewController , UITableViewDelegate , UITableViewDataSource , UICollectionViewDelegateFlowLayout , UICollectionViewDelegate , UICollectionViewDataSource{
    var categori1 = [["name" : "サクラキ",
                     "imageName" : "sl3.jpg"],
                    ["name" : "サクラキ",
                     "imageName" : "sl3.jpg"],
                    ["name" : "サクラキ",
                     "imageName" : "sl3.jpg"]]
    var categori2 = [["name" : "散歩",
                      "imageName" : "sl4.jpg"],
                     ["name" : "散歩",
                      "imageName" : "sl4.jpg"],
                     ["name" : "散歩",
                      "imageName" : "sl4.jpg"]]
    var categori3 = [["name" : "散歩後",
                      "imageName" : "sl5.jpg"],
                     ["name" : "散歩後",
                      "imageName" : "sl5.jpg"],
                     ["name" : "散歩後",
                      "imageName" : "sl5.jpg"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.tableView = {
            let tableView = UITableView(frame: self.view.bounds, style: .plain)
            tableView.autoresizingMask = [
              .flexibleWidth,
              .flexibleHeight
            ]
            tableView.delegate = self
            tableView.dataSource = self
            ////tableViewの使わないセルの区切り線を消す
            tableView.tableFooterView = UIView()
            //tableViewの高さ指定
            tableView.rowHeight = 200
            tableView.register(ShopTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(ShopTableViewCell.self))
            self.view.addSubview(tableView)

            return tableView
            
        }()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 3
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 240, height: 180)
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCollectionViewCell2", for: indexPath) as! ShopCollectionViewCell

                switch (collectionView.tag) {
                case 0:
                    cell.imageView.image = UIImage(named: categori1[indexPath.row]["imageName"]!)
                    cell.textLabel.text = categori1[indexPath.row]["name"]

                case 1:
                    cell.imageView.image = UIImage(named: categori2[indexPath.row]["imageName"]!)
                    cell.textLabel.text = categori2[indexPath.row]["name"]

                case 2:
                    cell.imageView.image = UIImage(named: categori3[indexPath.row]["imageName"]!)
                    cell.textLabel.text = categori3[indexPath.row]["name"]

                default:
                    print("section error")
                }
        return cell
    }
    var tableView: UITableView?
    //セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
      return 3
    }
     
    //セクション内のセル数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            guard let cell = cell as? ShopTableViewCell else { return }

            //ShopTableViewCell.swiftで設定したメソッドを呼び出す(indexPath.section)
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTableViewCell2", for: indexPath) as! ShopTableViewCell

            //ShopTableViewCell.swiftで設定したメソッドを呼び出す(indexPath.row)
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            cell.shopCollectionView.reloadData()
            return cell
        }
    
}

