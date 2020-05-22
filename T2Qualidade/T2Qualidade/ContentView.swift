//
//  ContentView.swift
//  T2Qualidade
//
//  Created by Mariela on 16/05/20.
//  Copyright © 2020 Mariela. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user: String = ""
    @State private var pssw: String = ""
    @State private var email: String = ""
    @State private var email_c: String = ""
    @State private var birth_date = Date()
    @State private var receive = false
    
    var body: some View {
      NavigationView {
        
        Form {
            
            Section(header: Text("Criação de conta")){
                
                HStack {
                    Text("Usuário")
                    Spacer()
                    TextField("", text: $user).accessibility(identifier: "userTextField")
                }
                HStack {
                    Text("Senha")
                    Spacer()
                    TextField("", text: $pssw).accessibility(identifier: "passwordTextField")
                }
                HStack {
                    Text("Email")
                    Spacer()
                    TextField("", text: $email).accessibility(identifier: "emailTextField")
                }
                HStack {
                    Text("Confirmação email")
                    Spacer()
                    TextField("", text: $email_c).accessibility(identifier: "emailConfirmationTextField")
                }
                
                DatePicker(selection: $birth_date, displayedComponents: .date, label: { Text("Data Nascimento") }).accessibility(identifier: "datePickerNascimento")
            }
            
            Toggle(isOn: $receive){
                Text("Receber notificações via email")
            }.accessibility(identifier: "receberEmailToggle")

            Button(action: {
                
            }) {
                Text("Enviar").accessibility(identifier: "sendFormButton")
            }
        }.padding(.trailing, 10.0) .navigationBarTitle("Inscrição")
        
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
