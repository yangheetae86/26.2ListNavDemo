//
//  CarDetail.swift
//  26.2ListNavDemo
//
//  Created by HEE TAE YANG on 2020/06/09.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct CarDetail: View {
    
    let selectedCar: Car
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(selectedCar.imageName)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12.0)
                .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("Hybrid")
                        .font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }
            }
        }
    }
}

struct CarDetail_Previews: PreviewProvider {
    static var previews: some View {
        CarDetail(selectedCar: carData[0])
    }
}
