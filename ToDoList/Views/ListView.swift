//
//  ListView.swift
//  ToDoList
//
//  Created by polyappledev on 2023/03/16.
//

/* To-Do List */

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    // ItemModel에서 세팅한 모델 값을 EvironmentObject로 활용하므로 items State를 선언할 필요 없음
    
//    @State var items: [ItemModel] = [
//        ItemModel(title: "This is the First title!", isCompleted: false),
//        ItemModel(title: "This is the Second title!", isCompleted: true),
//        ItemModel(title: "This is the Third title!", isCompleted: false)]

    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                // ForEach문으로 ListRowView에 items 배열의 내용을 담아 뿌려줌
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                            // Tap시 선택한 item의 내용을 listViewModel에 update한다
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            // 항목 삭제 기능 추가
            .onMove(perform: listViewModel.moveItem)
            // 항목 이동 기능 추가
        }
        .listStyle(PlainListStyle())
        // List의 스타일을 지정
        .navigationTitle("✏️ To-Do List")
        // Navigation 제목
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView())
                            )
        // Navigation 상단에 Edit과 Add 버튼을 추가
        // Add 버튼의 도착지를 AddView로 설정
    }
    
    
//    /* 항목 삭제 함수 */
//    func deleteItem(indexSet: IndexSet) {
//        items.remove(atOffsets: indexSet)
//    }
//    /* 항목 이동 함수 */
//    func moveItem(from: IndexSet, to: Int){
//        items.move(fromOffsets: from, toOffset: to)
//    }

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                ListView()
            }
            .environmentObject(ListViewModel())
        }
    }
}


