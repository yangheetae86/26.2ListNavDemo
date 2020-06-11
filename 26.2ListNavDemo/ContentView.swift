//
//  ContentView.swift
//  26.2ListNavDemo
//
//  Created by HEE TAE YANG on 2020/06/09.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var carStore = CarStore(cars: carData)
   
    var body: some View {
        
        NavigationView {
            List {
                ForEach(carStore.cars) {car in
                    ListCell(car: car)
                }
            .onDelete(perform: deleteItems)
            .onMove(perform: moveItems)
            }
            .navigationBarTitle(
                Text("Ev Cars"),
                displayMode: .inline)
            .navigationBarItems(leading:
                NavigationLink(destination:
                                AddNewCar(carStore: self.carStore)){
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    func deleteItems(at offets: IndexSet) {
        carStore.cars.remove(atOffsets: offets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    
    var car: Car
    
    var body: some View {
        
        return NavigationLink(destination: CarDetail(selectedCar: car)) {
            HStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
            }
        }
    }
}

//        var newCar = Car(id: "S", name: "s", description: "d", isHybrid: true, imageName: "tesla_model_s")
