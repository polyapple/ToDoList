//
//  AddView.swift
//  ToDoList
//
//  Created by polyappledev on 2023/03/16.
//


/* Add Item View */

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    // View의 presentation mode로 접근할 수 있게 한다 (주로 modal 구현에 사용)
    @EnvironmentObject var listViewModel: ListViewModel
    // EnvironmantObject로 ListViewModel을 끌어온다
    @State var textFieldText: String = ""
    // 빈 문자열 State를 생성
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    // Add 화면에서 글자수 제한 팝업 출력을 위한 문자열과 불린값 State 생성
    
    var myColor: [UIColor] = [#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)]
    // 변수를 선언해 #colorLiteral()로 컬러픽커를 사용가능
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something Here...", text: $textFieldText)
                    // TextField에 입력되는 텍스트 내용을 담을 State를 바인딩
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(myColor[0]))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        // 프레임을 좌우로 확장
                        .background(Color.accentColor)
                        // iOS 내의 강조 컬러 사용
                        .cornerRadius(10)
                })
                
            }
            .padding(14)
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate() {
            // textIsAppropriate가 true라면
            listViewModel.addItem(title: textFieldText)
            // EnvironmentObject로 끌어온 listViewModel에 textFieldText에 입력된 값을 추가한다
            presentationMode.wrappedValue.dismiss()
            // save버튼을 누르면 현재 presentation mode로 출력중인 modal창이 사라진다
        }
    }

    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new To-Do item must be at least 3 characters long.🥹"
            showAlert.toggle()
            return false
        }
        return true
    }
    // textFieldText의 글자수에 따라 에러 메세지 출력하는 함수
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    // 에러 메세지창 출력 함수
    
}
    struct AddView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                AddView()
            }
            .environmentObject(ListViewModel())
        }
    }

    
