//
//  AddView.swift
//  ListAList
//
//  Created by Zefanya Sharon on 04/04/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var titleList: String = ""
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    var body: some View {
        ScrollView{
            VStack{
                Text("Title")
                    .fontWeight(.bold)
                    .font(.headline)
                    .frame(width: 300, height: 25, alignment: .leading)
                    .padding(.leading, -50)
                
                TextField("Input New List", text: $titleList)
                    .foregroundColor(Color("PurplePrimary"))
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("OrangeSecondary"), lineWidth: 1.5)
                    )
                
                Button(action: saveButtonClicked, label: {
                    Text("Save")
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.green)
                                .frame(width: 150, height: 30, alignment: .center)
                        }
                        .padding()
                }) //button
            } //vstack
        }
        .padding()
        .navigationTitle("Add New List ✍🏻")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonClicked() {
        if textIsAppropriate() {
            listViewModel.addItem(title: titleList)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if titleList.count < 3 {
            alertTitle = "Please write at least 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView(titleList: "")
        }
        .environmentObject(ListViewModel())
    }
}
