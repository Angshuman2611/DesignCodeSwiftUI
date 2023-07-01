//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Angshuman Das on 01/07/23.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

