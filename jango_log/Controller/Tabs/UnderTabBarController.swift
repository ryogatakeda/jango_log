//UnderTabBarController.swift
//作成日：2021/2/13
//
//概要
//画面下に表示するTabBarの画面遷移先を記述
//ホーム画面、カレンダー画面、収支画面、設定画面に遷移

import UIKit

class UnderTabBarController: UITabBarController {

    //画面ロード
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTabBar()
    }
    
    //TabBarの設定
    func initTabBar(){
        //ホーム画面を配置
        let homeView = HomeView()
        homeView.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        //上バーを配置
        
        //カレンダー画面を配置
        let calView = CalendarView()
        calView.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        //収支画面を配置
        let statsView = StatsView()
        statsView.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        //設定画面を配置
        let setView = SetView()
        setView.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
        //ナビゲーションバーのやつ
        let setVC = UINavigationController(rootViewController: setView)
        setView.title = "しごやめ"
        
        
        //まとめておく
        setViewControllers([homeView,calView,statsView,setVC], animated: false)
    }
}

