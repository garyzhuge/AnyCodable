//
//  Example.swift
//  AnyCodable
//
//  Created by Gary Zhuge on 10/23/22.
//

import Foundation

func parseHeteroArray() {
    let json = """
        {
          "Disk": [
            {
              "Dir1": [
                "file 1",
                "file 2",
                "file 3",
                "file 4",
                "file 5",
                "file 6",
                "file 7",
                "file 8",
                "file 9",
                "file 10",
                {
                  "dir 1.1": [
                    "file 1.1.1",
                    "file 1.1.2",
                    "file 1.1.3",
                    {
                      "dir 1.1.4": [
                        "file 1.1.4.1"
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "Dir2": [
                "file 1",
                "file 2",
                "file 3",
                "file 4",
                "file 5",
                "file 6",
                "file 7",
                "file 8",
                "file 9",
                "file 10",
                {
                  "dir 2.1": [
                    "file 1.1.1",
                    "file 1.1.2",
                    "file 1.1.3",
                    {
                      "dir 2.1.4": [
                        "file 1.1.4.1"
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        }
    """.data(using: .utf8)!

    let decoder = JSONDecoder()
    let dictionary = try! decoder.decode([String: AnyCodable].self, from: json)
    print(dictionary)
    let children = dictionary["Disk"]!
    var continueParsing = true
    var index = 0
    while continueParsing {
        if let node = children[dynamicMember: String(index)], node != nil {
            
            print(node)
            index += 1
        } else {
            continueParsing = false
        }
    }
}
 
