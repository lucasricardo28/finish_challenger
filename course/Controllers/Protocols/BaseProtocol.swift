//
//  BaseProtocol.swift
//  course
//
//  Created by Ricardo Martins on 22/03/21.
//

import Foundation
protocol BaseProtocol {
    func showLoading()
    func hideLoading()
    func showMessage(_ title:String, _ message:String)
}
