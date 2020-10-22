//
//  UploadImageApp.swift
//  UploadImage
//
//  Created by Nitin Bhatt on 10/22/20.
//

import SwiftUI

@main
struct UploadImageApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
