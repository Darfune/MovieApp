//
//  Resolver.swift
//  NovibetAssignment
//
//  Created by Jason Charalampidis on 23/11/24.
//

import Swinject

class Resolver {
    static var shared = Resolver()
    private final let container: Container = Container()
    
    func resolve<T>(_ type: T.Type, _ name: String? = nil) -> T? {
        return container.resolve(T.self, name: name)
    }
    
    func getContainer() -> Container {
        return container
    }
}
