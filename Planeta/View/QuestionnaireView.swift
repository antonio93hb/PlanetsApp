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
                        Text("Suscripción a la información")
                            .frame(width: .infinity ,alignment: .center)
                            .foregroundStyle(.black)
                            .font(.callout)
                            .bold()
                        Spacer()
                    }
                }
                Section{
                    TextField("Nombre", text: $name)
                        .focused($focusedField, equals: .name)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedField = .email
                        }
                    TextField("Correo electrónico", text: $email)
                        .focused($focusedField, equals: .email)
                        .submitLabel(.done)
                        .onSubmit {
                            focusedField = nil
                        }
                }
                header: {
                    Text("TUS DATOS")
                }
                
                Section{
                    Picker("Tema", selection: $selectedTema) {
                        Text("Planetas").tag(Temas.planetas)
                        Text("Lunas").tag(Temas.lunas)
                        Text("Sistema Solar").tag(Temas.sistemaSolar)
                    }
                }
                header: {
                    Text("¿SOBRE QUÉ TE GUSTARÍA SABER MÁS?")
                }
                
                Button("Enviar") {
                    isPresented = true
                }
                .disabled(isFormValid)
                //                .disabled(sendEmail(name, email))
                .alert(isPresented: $isPresented) {
                    Alert(title: Text(name),
                          message: Text("Recibido. Le contestaremos a \(email) sobre su duda de \(selectedTema.rawValue)"),
                          dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

#Preview {
    QuestionnaireView()
}
