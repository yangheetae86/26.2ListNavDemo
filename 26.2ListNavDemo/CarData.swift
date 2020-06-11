//
//  CarData.swift
//  26.2ListNavDemo
//
//  Created by HEE TAE YANG on 2020/06/09.
//  Copyright © 2020 yht. All rights reserved.
//
import UIKit
import SwiftUI

//var carData: [Car] =
var carData: [Car] = loadJson("carData.json")

func loadJson<T: Decodable>(_ filename: String) -> T {// Decodable:[암호화된 코드를] 원래 코드로 되돌리다.
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
        fatalError("\(filename) 파일을 찾지 못했습니다.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("로딩할 수 없습니다\(filename): (error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): (error)")
    }
}

struct CarData_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
