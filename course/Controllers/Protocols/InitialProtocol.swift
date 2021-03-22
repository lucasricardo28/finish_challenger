//
//  InitialProtocol.swift
//  course
//
//  Created by Ricardo Martins on 15/03/21.
//

import Foundation
protocol InitialProtocol {
    func load()
    func close()
    func showMessage(_ message:String, _ isSuccess:Bool)
}
