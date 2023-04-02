//
//  ListRowView.swift
//  ToDoList
//
//  Created by polyappledev on 2023/03/16.
//



/* Checklist */

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            // 체크박스 삽입
            Text(item.title)
            Spacer()
            // Space-Between처럼 화면을 분할하며 늘어나는 공간 삽입
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    // Preview용으로 사용하는 값
    
    static var item1 = ItemModel(title: "First Item", isCompleted: false)
    static var item2 = ItemModel(title: "Second Item", isCompleted: true)

    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        // Preview를 대상의 사이즈에 맞춰서 출력한다 (Selectable탭에서 확인 가능)
    }
}
