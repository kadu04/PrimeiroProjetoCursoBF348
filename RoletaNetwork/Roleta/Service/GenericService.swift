//
//  GenericService.swift
//  Roleta
//
//  Created by Ricardo Massaki on 04/04/23.
//

import Foundation

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
