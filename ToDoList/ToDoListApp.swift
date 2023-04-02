//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by polyappledev on 2023/03/16.
//

/*
 MVVM(Model-View-ViewModel) Architecture
 View - ViewModel - Model로 구성된 아키텍처 패턴.
 
 - View는 ViewModel을 소유하고, ViewModel은 Model을 소유한다.
 - Model에서 데이터가 바뀌면 ViewModel에 그 사실을 알리고, ViewModel에서 UI를 업데이트하면 View에 반영된다.
 - Model의 값이 바뀌면 자동으로 UI가 변경되도록 연결해놓는 것을 데이터 바인딩(Data Binding)이라고 한다.
 
 View - UI. 화면을 보여주는 곳
 ViewModel - Manages Models for View. View에서 보여주기 위한 데이터를 관리하는 곳
 Model - Data Point. 데이터들의 구성 그 자체
 */

/* View 쪼개기 - 복잡한 코드를 관리하게 좋게 정리
// 1.분리할 부분을 SubView로 만든다 (코드는 파일 하단으로 이동)
// 2.View의 이름과 동명의 파일을 생성하고 하단의 코드를 옮겨옴
// 3.원하는 곳에서 끌어와 활용한다
 */

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    // StateObject로 만드려면 원본이 ObservableObject여야만 한다
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            //NavigationView 안에 다른 View를 담음
            
            .environmentObject(listViewModel)
            // 모든 View가 읽을 수 있는 공유 모델 데이터 설정. 데이터 업데이트 시 자동 반영됨
        }
    }
}
