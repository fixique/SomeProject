//
//  KeychainService.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 12/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import Foundation
import Security

enum KeychainServiceError: Error {
    case stringToDataConversionError
    case dataToStringConversionError
    case unhandledError

    var errorDescription: String? {
        switch self {
        case .stringToDataConversionError:
            return L10n.Keychainserviceerror.stringToData
        case .dataToStringConversionError:
            return L10n.Keychainserviceerror.dataToString
        case .unhandledError:
            return L10n.Keychainserviceerror.unhandled
        }
    }
}

final class KeychainService {

    // MARK: - Internal Methods

    func save(data: String, forKey key: String) throws {
        guard let encodedData = data.data(using: .utf8, allowLossyConversion: false) else {
            throw KeychainServiceError.stringToDataConversionError
        }
        let query = keychainQuery(withKey: key)
        var status = SecItemCopyMatching(query as CFDictionary, nil)
        switch status {
        case errSecSuccess:
            var attributesToUpdate: [String: Any] = [:]
            attributesToUpdate[String(kSecValueData)] = encodedData

            status = SecItemUpdate(query as CFDictionary,
                                   attributesToUpdate as CFDictionary)
            if status != errSecSuccess {
                throw KeychainServiceError.unhandledError
            }
        case errSecItemNotFound:
            query[String(kSecValueData)] = encodedData

            status = SecItemAdd(query as CFDictionary, nil)
            if status != errSecSuccess {
                throw KeychainServiceError.unhandledError
            }
        default:
            throw KeychainServiceError.unhandledError
        }

    }

    func load(forKey key: String) throws -> String? {
        let query = keychainQuery(withKey: key)
        query.setValue(kCFBooleanTrue, forKey: kSecReturnData as String)
        query.setValue(kCFBooleanTrue, forKey: kSecReturnAttributes as String)

        var queryResult: AnyObject?
        let status = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(query as CFDictionary, $0)
        }

        switch status {
        case errSecSuccess:
            guard
                let queriedItem = queryResult as? [String: Any],
                let objectData = queriedItem[String(kSecValueData)] as? Data,
                let data = String(data: objectData, encoding: .utf8)
                else {
                    throw KeychainServiceError.dataToStringConversionError
            }
            return data
        case errSecItemNotFound:
            return nil
        default:
            throw KeychainServiceError.unhandledError
        }
    }

    func removeValue(forKey key: String) throws {
        let query = keychainQuery(withKey: key)

        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainServiceError.unhandledError
        }
    }

}

// MARK: - Private Methods

private extension KeychainService {

    private func keychainQuery(withKey key: String) -> NSMutableDictionary {
        let result = NSMutableDictionary()
        result.setValue(kSecClassGenericPassword, forKey: kSecClass as String)
        result.setValue(key, forKey: kSecAttrService as String)
        result.setValue(kSecAttrAccessibleAlwaysThisDeviceOnly, forKey: kSecAttrAccessible as String)
        return result
    }

}
