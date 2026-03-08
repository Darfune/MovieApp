//
//  Injector.swift
//  NovibetAssignment
//
//  Created by Jason Charalampidis on 23/11/24.
//

import Foundation
import Swinject


@propertyWrapper
struct Inject<I> {
    public var wrappedValue: I?
    
    public init(named: String? = nil) {
        self.wrappedValue = Resolver.shared.resolve(I.self, named)
    }
    
    public init(wrappedValue: I?) {
        self.wrappedValue = wrappedValue
    }
}
