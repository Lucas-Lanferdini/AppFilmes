//
//  SheetIView.swift
//  Property Wapper
//
//  Created by LucasLanferdini on 27/10/23.
//

import SwiftUI




struct SheetIView: View {
    
    var imagem: Image = Image("ima")
    var nome: String = "Missao impossivel"
    var descricao: String = "Ethan Hunt e sua equipe embarcam em sua missão mais perigosa: rastrear uma nova arma aterrorizante que ameaça toda a humanidade antes que caia em mãos erradas. Com o controle do futuro e o destino do mundo em jogo e as forças sombrias do passado de Ethan se aproximando, uma corrida mortal ao redor do globo começa. Confrontado por um inimigo misterioso e todo-poderoso, Ethan é forçado a considerar que nada pode importar mais do que sua missão – nem mesmo a vida daqueles com quem ele mais se importa."
    var review: String = "10"
    var genero: String = "Acao, Aventura"
    
    @State private var showingDetail = false
    
    
    
    var body: some View {
        
        @Environment(\.dismiss) var dismiss

        
        VStack(alignment: .leading){
            HStack{
                Text("Details")
                    .padding()
                Spacer()
                Button("X"){
                    dismiss()
                    
                }
                .padding()
            }
                HStack{
                    imagem
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 12), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                        .padding()
                    VStack{
                        Text(nome)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text(genero)
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                        HStack{
                            Image(systemName: "star")
                                .foregroundStyle(.gray)
                                .font(.system(size: 12))
                            Text(review)
                                .foregroundStyle(.gray)
                                .font(.system(size: 12))
                        }
                    }
                }
                
                Text("OverView")
                    .font(.title)
                    .bold()
                    .padding()
                Text(descricao)
                    .padding()
                    .font(.caption)
            
                
            }
        }
    
}

#Preview {
    SheetIView()
}
