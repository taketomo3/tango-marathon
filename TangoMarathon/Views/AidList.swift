//
//  AidList.swift
//  TangoMarathon
//
//  Created by 竹田智哉 on 2022/09/15.
//

import SwiftUI

struct AidList: View {
    var body: some View {
        NavigationView {
            List(aids) { aid in
                let arrivedAt = UserDefaults.standard.string(forKey: "arrived_\(aid.id)")

                NavigationLink {
                    AidDetail(aid: aid)
                } label: {
                    HStack {
                        Text(aid.dist.fromStart.description)

                        Text(aid.name)
                        
                        Text(arrivedAt ?? "")
                    }
                }
                .foregroundColor(arrivedAt != nil ? Color.secondary : (aid.isCheckPoint ? Color.blue : .none))
            }
            .navigationTitle("エイドリスト")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
}

struct AidList_Previews: PreviewProvider {
    static var previews: some View {
        AidList()
    }
}
