//
//  ContentView.swift
//  Property Wapper
//
//  Created by LucasLanferdini on 26/10/23.
//

import SwiftUI

//struct Movie: Identifiable {
//    var id = UUID()
//    var foto: String
//    var title: String
//    var description: String
//    var review: String
//    var liked: Bool = false
//}
//
//struct MovieHori: Identifiable {
//    var id = UUID()
//    var foto: String
//    var title: String
//    var review: String
//}
//
//
//
//
//struct MovieListHori: View{
//    
//    var movie: MovieHori
//    var body: some View {
//        
//        
//        VStack(){
//            Image(movie.foto)
//                .resizable()
//                .scaledToFill()
//                .frame(width: 100, height: 150)
//                .clipShape(RoundedRectangle(cornerRadius: 12), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
//            
//            Text(movie.title)
//                .font(.subheadline)
//                .padding([.leading], 10)
//                .lineLimit(1)
//            HStack{
//                Image(systemName: "star")
//                    .foregroundStyle(.gray)
//                    .font(.system(size: 12))
//                
//                Text(movie.review)
//                    .foregroundStyle(.gray)
//                    .font(.system(size: 12))
//            }.padding([.leading], 10)
//                .padding([.bottom], 2)
//        }
//    }
//}
//struct MovieList: View{
//    
//    var movie: Movie
//    var body: some View {
//
//        HStack{
//            
//            Image(movie.foto)
//                .resizable()
//                .scaledToFill()
//                .frame(width: 100, height: 150)
//                .clipShape(RoundedRectangle(cornerRadius: 12), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
//            
//            
//            
//            VStack(alignment: .leading){
//                Text(movie.title)
//                    .font(.title)
//                Text(movie.description)
//                    .font(.caption2)
//                    .foregroundStyle(.gray)
//                    .padding(.bottom)
//                    .lineLimit(3)
//                HStack{
//                    Image(systemName: "star")
//                        .foregroundStyle(.gray)
//                        .font(.system(size: 12))
//                    
//                    Text(movie.review)
//                        .foregroundStyle(.gray)
//                        .font(.system(size: 12))
//                    
//                    Spacer()
//                    
//                    Image(systemName: movie.liked ? "heart.fill" : "heart")
//                        .foregroundStyle(movie.liked ? .red : .gray)
//                        .font(.system(size: 12))
//
//                }
//            }
//            
//        }
//    }
//}
struct ContentView: View {
    @State private var showingDetail = false

    var body: some View {
        TabView{
            FilmeView()
                .tabItem{
                    Label("Movie", systemImage: "movieclapper")
                }
            
            ActorView()
                .tabItem{
                    Label("Actor", systemImage: "person.crop.rectangle.stack")
                }
            
            
        }
      
        
        
        
    }
}
#Preview {
    ContentView()
}
