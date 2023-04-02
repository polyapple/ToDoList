//
//  ListViewModel.swift
//  ToDoList
//
//  Created by polyappledev on 2023/03/16.
//

import Foundation

/* CRUD FUNCTIONS (Create, Read, Update, Delete)
 데이터를 생성, 읽기, 수정(갱신), 삭제하는 기능을 구현하는 것 */

class ListViewModel: ObservableObject {
    /* ObservableObject
     - 관찰 가능 오브젝트. class에서만 사용 가능한 프로토콜
     - 클래스 내 인스턴스를 관찰하고 값이 변경되면 업데이트한다
     - 현재 뷰를 새로 로드하므로 다른 곳에서 전달된 View에서만 사용해야한다
     */
    
    @Published var items: [ItemModel] = []
    // ItemModel이라는 빈 배열을 생성한다
    /* @Published
     - 값이 변경될 경우 View에 자동으로 즉시 알리는 관찰 가능 오브젝트 (ObservableObject를 만들 수 있다
     - 해당 속성의 오브젝트가 변경되면 오브젝트를 사용하는 모든 View가 다시 로드되어 변경사항을 반영한다
     - state는 View에서만 사용할 수 있으므로, class에서는
       Published 사용
     */


    
    init() {
        getItems()
        // ListViewModel이 생성되면, 바로 항목 생성 함수를 호출한다
    }
    
    /* 항목 생성 함수*/
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the First title!", isCompleted: false),
            ItemModel(title: "This is the Second title!", isCompleted: true),
            ItemModel(title: "This is the Third title!", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    // getItems가 실행되면, 더미데이터를 생성하고 items 배열에 삽입한다.
    
    // ListView에서 Model들을 옮겨온다
    // State는 View에서만 쓸 수 있으므로 Published 사용
    
    /* 항목 삭제 함수 */
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    /* 항목 이동 함수 */
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    /* 항목 추가 함수*/
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    /* 항목 토글 함수 */
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
            // item의 해당index 순번의 내용을 ItemModel의 updateCompletion 내용으로 덮어씌워 업데이트한다.
        }
        
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            run this code
//        }
    }
}

