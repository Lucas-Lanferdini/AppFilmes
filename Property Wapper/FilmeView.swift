//
//  FilmeView.swift
//  Property Wapper
//
//  Created by LucasLanferdini on 27/10/23.
//




import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    var foto: String
    var title: String
    var description: String
    var review: String
    var liked: Bool = false
}

struct MovieHori: Identifiable {
    var id = UUID()
    var foto: String
    var title: String
    var review: String
}




struct MovieListHori: View{
    
    var movie: MovieHori
    var body: some View {
        
        
        VStack(){
            Image(movie.foto)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 12), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
            
            Text(movie.title)
                .font(.subheadline)
                .padding([.leading], 10)
                .lineLimit(1)
            HStack{
                Image(systemName: "star")
                    .foregroundStyle(.gray)
                    .font(.system(size: 12))
                
                Text(movie.review)
                    .foregroundStyle(.gray)
                    .font(.system(size: 12))
                
            }.foregroundStyle(.gray)
                .font(.system(size: 12))
        }
    }
}
struct MovieList: View{
    
    var movie: Movie
    var body: some View {

        HStack{
            
            Image(movie.foto)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 12), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
            
            
            
            VStack(alignment: .leading){
                Text(movie.title)
                    .font(.title)
                Text(movie.description)
                    .font(.caption2)
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                    .lineLimit(3)
                HStack{
                    Image(systemName: "star")
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                    
                    Text(movie.review)
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                    
                    Spacer()
                    
                    Image(systemName: movie.liked ? "heart.fill" : "heart")
                        .foregroundStyle(movie.liked ? .red : .gray)
                        .font(.system(size: 12))

                }
            }
            
        }
    }
}

struct FilmeView: View {
    
  
    @State var movies: [Movie] = [Movie(foto: "ima", title: "Missao Impossivel", description: "Ethan Hunt e sua equipe embarcam em sua missão mais perigosa: rastrear uma nova arma aterrorizante que ameaça toda a humanidade antes que caia em mãos erradas. Com o controle do futuro e o destino do mundo em jogo e as forças sombrias do passado de Ethan se aproximando, uma corrida mortal ao redor do globo começa. Confrontado por um inimigo misterioso e todo-poderoso, Ethan é forçado a considerar que nada pode importar mais do que sua missão – nem mesmo a vida daqueles com quem ele mais se importa.", review: "8.4"), Movie(foto: "duro", title: "Duro de Matar", description: "Um alemao roubou ouro do banco e tem uma bomba numa praca", review: "10"), Movie(foto: "futuro", title: "De volta para o futuro", description: "Um carro viaja no tempo e bagunca tudo no passado", review: "9.5"), Movie(foto: "ima", title: "Missao impossivel 2", description: "O inimigo agora é outro", review: "10"), Movie(foto: "blue", title: "Besouro Azul", description: "Jovem do cobra kai vira o homem de ferro azul e bla bla bla", review: "6.0")]
    
    var movieshori: [MovieHori] = [MovieHori(foto: "ima", title: "Missao Impossivel", review: "8.4"), MovieHori(foto: "duro", title: "Duro de Matar", review: "10.0"), MovieHori(foto: "futuro", title: "De volta para o futuro", review: "9.5"), MovieHori(foto: "blue", title: "Blue Beetle", review: "6.0")]
    
    
    
    @State private var showingDetail = false

    @State var searchText: String = ""
    var body: some View {
        
       
        VStack(alignment: .leading){
            
            
            Text("MoviesDB")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding([.leading], 10)
            
            VStack(alignment: .leading){
                NavigationStack(){
                    Text("Now Playing")
                        .padding([.trailing], 250)
                    ScrollView (.horizontal){
                      HStack {
                        ForEach(movieshori) { movie in
                          MovieListHori(movie: movie)
                                .onTapGesture {
                                    showingDetail.toggle()
                                }.sheet(isPresented: $showingDetail) {
                                    SheetIView()
                                }
                          Divider()
                        }

                      }
                    }
                    
                }
                .searchable(text: $searchText)
                
               

                NavigationStack {
                    
                    List {
                        
                        ForEach(movies){movie in
                            
                            
                            MovieList(movie: movie)
                                .swipeActions(edge: .trailing, allowsFullSwipe: true, content:{
                                    
                                    Button(action: {
                                        if let movieIndex = movies.firstIndex(where: {$0.id == movie.id}) {
                                            movies[movieIndex].liked.toggle()
                                        }
                                    }, label: {
                                        Image(systemName: movie.liked  ? "heart": "heart.slash")
                                            .foregroundStyle(.red)
                                        
                                    }).tint(.red)
                                    
                                })
                            
                        }
                        .navigationTitle("Popular Movie")
                        .font(.headline)
                        
                        
                        
                        
                    }.listStyle(.plain)
                }
                
                
            }
            
        }
        
    }
    
    
}

#Preview {
    ContentView()
}
