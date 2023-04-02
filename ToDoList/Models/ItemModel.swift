//
//  ItemModel.swift
//  ToDoList
//
//  Created by polyappledev on 2023/03/16.
//

import Foundation

/* Immutable Struct (불변 구조체)
 
 - 생성 후 Property를 변경할 수 없는 구조.
 - Swift에서 var는 변경 가능한 변수, let은 변경 불가능한 상수 선언
 - 모든 Property의 State는 let으로 선언한다.
 - 불변 구조체의 복사본을 만들고 그 값을 수정하여 업데이트 하는 방식
 
 */

/* Item Model 생성 */
struct ItemModel: Identifiable {
    // ForEach문으로 항목을 뿌려주기 위한 ID값을 부여하기 위해 Identifiable 사용
    let id: String
    // 범용 고유 식별자(UUID, Universally Unique IDentifier) - 랜덤 고유 ID값을 부여함
    let title: String
    // 항목별 제목값이 들어갈 문자열 변수 선언
    let isCompleted: Bool
    // 완료 여부를 표시하는 불린값 변수 선언
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    // Item Model의 초기값 양식을 지정. 상단 id에서 지정해주었던 UUID 관련 내용도 옮겨온다
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    // id와 title이 같지만 isCompleted값이 반대인(토글) item값을 새롭게 생성
}

