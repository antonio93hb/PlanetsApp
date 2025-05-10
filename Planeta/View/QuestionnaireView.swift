//
//  QuestionnaireView.swift
//  Planeta
//
//  Created by Antonio Hernández Barbadilla on 8/5/25.
//

import SwiftUI

struct QuestionnaireView: View {
    
    enum Temas: String {
        case planetas, lunas, sistemaSolar
    }
    
    enum Field: Hashable {
        case name
        case email
    }
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var selectedTema: Temas = .planetas
    @State private var isPresented = false
    @FocusState private var focusedField: Field?

    //    func sendEmail(_ name: String, _ email: String) -> Bool {
    //        //Comprobar que no se rellene con espacios en blanco "trimingcaracter"
    //        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
    //            return true
    //        }
    //        // Expresión regular para validar email
    //        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    //
    //        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    //
    //        if !emailPred.evaluate(with: email) {
    //            return true
    //        }
    //        return false
    //    }
    
    var isFormValid: Bool {
        // Comprobar que no se rellene con espacios en blanco
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return true
        }
        // Expresión regular para validar email
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return !emailPred.evaluate(with: email)
    }
    
    var body: some View {
        VStack{
            Form {
                Section{
                    EmptyView()
                }
                header:{
                    
                    HStack{
                        
                        Spacer()
                        Text("QUESTIONNAIRE")
                            .frame(width: .infinity ,alignment: .center)
                            .foregroundStyle(.black)
                            .font(.callout)
                            .bold()
                        Spacer()
                    }
                }
                Section{
                    
                    TextField("Name", text: $name)
                        .focused($focusedField, equals: .name)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedField = .email
                        }
                    
                    TextField("Email", text: $email)
                        .focused($focusedField, equals: .email)
                        .submitLabel(.done)
                        .onSubmit {
                            focusedField = nil
                        }
                }
                header: {
                    Text("YOUR INFORMATION")
                }
                
                Section{
                    
                    Picker("Theme", selection: $selectedTema) {
                        
                        Text("Planets").tag(Temas.planetas)
                        Text("Moons").tag(Temas.lunas)
                        Text("Solar Systeme").tag(Temas.sistemaSolar)
                    }
                }
                header: {
                    Text("What do you want to know?")
                }
                
                Button("Send") {
                    isPresented = true
                }
                .disabled(isFormValid)
                //                .disabled(sendEmail(name, email))
                .alert(isPresented: $isPresented) {
                    Alert(title: Text(name),
                          message: Text("Thank you \(name). We have received your email. We will contact you for \(email) about \(selectedTema.rawValue)"),
                          dismissButton: .default(Text("OK")))
                }
            }
        }
        .onAppear {
            focusedField = .name
        }
    }
}

#Preview {
    QuestionnaireView()
}
