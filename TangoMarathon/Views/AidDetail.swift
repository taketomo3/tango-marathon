//
//  AidDetail.swift
//  TangoMarathon
//
//  Created by 竹田智哉 on 2022/09/13.
//

import SwiftUI

struct AidDetail: View {
    var aid: Aid

    var body: some View {
        NavigationView {
            List {
                Section {
                    Text(aid.drink)
                } header: {
                    Text("ドリンク")
                }

                Section {
                    Text("\(aid.food)")
                } header: {
                    Text("フード")
                }

                Section {
                    Text("\(aid.dist.nextAid.description)km")
                } header: {
                    Text("次のエイドまで")
                }

                Section {
                    HStack {
                        Text("時間")
                        Spacer()
                        Text("\(aid.toNextCP.time)")
                            .foregroundColor(.secondary)
                    }

                    HStack {
                        Text("距離")
                        Spacer()
                        Text("\(aid.toNextCP.dist)")
                            .foregroundColor(.secondary)
                    }

                    HStack {
                        Text("平均ペース")
                        Spacer()
                        Text("\(aid.toNextCP.averagePace)")
                            .foregroundColor(.secondary)
                    }
                } header: {
                    HStack {
                        Text("次の関所まで")
                        Spacer()
                        Text("現在時刻: \(aid.now)")
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationTitle("\(aid.dist.fromStart.description) \(aid.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AidDetail_Previews: PreviewProvider {
    static var previews: some View {
        AidDetail(aid: aids[0])
    }
}
