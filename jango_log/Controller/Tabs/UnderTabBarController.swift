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
        //ナビゲーションバーの設定
        let homeVC = UINavigationController(rootViewController: homeView)
        homeView.title = "ホーム"
        
        //カレンダー画面を配置
        let calView = CalendarView()
        calView.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        //ナビゲーションバーの設定
        let calVC = UINavigationController(rootViewController: calView)
        calView.title = "カレンダー"
        
        //分析画面を配置
        let statsView = StatsView()
        statsView.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        //ナビゲーションバーの設定
        let statsVC = UINavigationController(rootViewController: statsView)
        statsView.title = "分析"
        
        //設定画面を配置
        let setView = SetView()
        setView.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
        //ナビゲーションバーの設定
        let setVC = UINavigationController(rootViewController: setView)
        setView.title = "設定"
        
        
        //まとめておく
        setViewControllers([homeVC,calVC,statsVC,setVC], animated: false)
    }
}

