//
//  TokenRequestRepo.swift
//  AppAuthDemo
//
//

import Foundation

protocol TokenRequestRepoInterface {
    func getToken(request:AuthRequest) async throws -> Token
}
