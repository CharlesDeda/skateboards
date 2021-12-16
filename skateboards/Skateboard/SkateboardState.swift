//
//  Skateboard State.swift
//  skateboards
//
//  Created by Nick Deda on 12/16/21.
//

import Foundation
import SwiftUI

struct Skateboard {
  let name: String
  var backgroundColor: Color
  var wheelColor: Color
  var trucksColor: Color
  let description: String
}

let mock = Skateboard(
  name: "Plan B",
  backgroundColor: .red,
  wheelColor: .gray,
  trucksColor: .blue,
  description: .lorumIpsum
)
