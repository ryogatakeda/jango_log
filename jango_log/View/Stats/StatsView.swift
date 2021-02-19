//StatsView.swift
//作成日：2021/02/13.
//
//概要
//収支画面のView
//各カテゴリの収支をリスト表示する

import UIKit

class StatsView: UIViewController ,UITableViewDelegate, UITableViewDataSource{

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

            self.view.addSubview(tableView)

            return tableView

          }()  }
   
    var tableView: UITableView?
      let items = ["Apple","Banana","Orange"]
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
      ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")

      cell.textLabel?.text = self.items[indexPath.row]

      return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print("Selected! \(self.items[indexPath.row])")
    }
}

