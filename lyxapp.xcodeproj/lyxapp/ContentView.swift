import SwiftUI

struct ContentView: View {
    @State private var imageList: [String] = []
    @State private var searchKey: String = ""
    
    var filterList: [String] {
        if searchKey.isEmpty {
            return imageList
        } else {
            return imageList.filter{ $0.localizedCaseInsensitiveContains(searchKey) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 110), spacing:12)
                ], spacing:12) {
                    ForEach(filterList, id:\.self) { name in
                        RoundedRectangle(cornerRadius:16)
                            .fill(.ultraThinMaterial)
                            .frame(height:140)
                            .overlay(Text(name)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.center)
                                .padding(8)
                            )
                    }
                }
                .padding()
                
                if filterList.isEmpty {
                    Text("没有找到图片")
                        .foregroundColor(.secondary)
                        .padding(.top,40)
                }
            }
            .searchable(text:$searchKey, prompt:"输入名字搜索")
            .navigationTitle("lyx图库")
        }
    }
}

#Preview {
    ContentView()
}
