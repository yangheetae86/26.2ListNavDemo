//
//  AddNewCar.swift
//  26.2ListNavDemo
//
//  Created by HEE TAE YANG on 2020/06/09.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct AddNewCar: View {
    
    @ObservedObject var carStore: CarStore
    
    @State var isHybrid = false // : 타입 값이없다. = 타입 값이 있다.
    @State var name = ""
    @State var description = ""
    
    var body: some View {
        Form{
            Section(header: Text("Car Details")) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isHybrid) {
                    Text("Hybrid").font(.headline)
                }.padding()
            }
            
            Button(action: addNewCar) {
                Text("Add Car")
            }
        }
    }
    func addNewCar() {
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
        carStore.cars.append(newCar)
        
    }
    
//    func addNewCar() {
//        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
//        carStore.cars.append(newCar) 새로운 car 객체를 carStore의 배열에 추가한다.
//
//    }
}

struct DataInput: View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    .padding()
    }
}

struct AddNewCar_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCar(carStore: CarStore(cars: carData))
    }
}
