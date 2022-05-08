//
//  SectionModel.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 02.05.2022.
//

import Foundation

struct SectionModel: Identifiable {
    var id: String {
        return letter
    }
    
    var letter: String
    let names: [String]
}

extension SectionModel {
    
    func DictionaryFromArray( array: [String]) -> [SectionModel] {
        
        var sections = [SectionModel]()
        
        let groupedDictionary = Dictionary(grouping: array,
                                           by: {String($0.prefix(1))})
        let keys = groupedDictionary.keys.sorted()
        
        sections = keys.map{ SectionModel(
            letter: $0,
            names: groupedDictionary[$0]!.sorted()) }
        
        return sections
    }
}
