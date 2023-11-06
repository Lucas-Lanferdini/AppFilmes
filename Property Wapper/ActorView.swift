//
//  ActorView.swift
//  Property Wapper
//
//  Created by LucasLanferdini on 27/10/23.
//

import SwiftUI


struct Ator: Identifiable{
    var id = UUID()
    var imagem: Image
    var nome: String
    var descricao: String
    var portifolio: String
}

struct AtorPage: View{
    var ator: Ator
    var body: some View {
        HStack{
            ator.imagem
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 12), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading){
                Text(ator.nome)
                    .font(.title)
                    .padding([.bottom], 2)
                Text(ator.descricao)
                    .font(.caption2)
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                    .lineLimit(3)
                HStack{
                    Image(systemName: "star")
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                    Text(ator.portifolio)
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                        .lineLimit(1)

                }
            }
            
        }
    }
    
}

struct ActorView: View {
    var atores: [Ator] = [Ator(imagem: Image("tom"), nome: "Tom Cruise", descricao: "Thomas Cruise Mapother IV é um ator e produtor de cinema norte-americano. Em 2007 foi listado pela revista Forbes como a celebridade mais popular de 2006, venceu três Globos de Ouro e foi indicado quatro vezes ao Oscar e é responsável pelo Estúdio Cinematográfico United Artists fundado por Charlie Chaplin.", portifolio: " Missão Impossível 8"), Ator(imagem: Image("chris"), nome: "Chris Hemsworth", descricao: "Christopher Hemsworth é um ator australiano, sendo mais conhecido por interpretar Thor no Universo Cinematográfico Marvel.", portifolio: "Furiosa, Avengers: Secret War, Avengers: The Kang Dynasty, Transformers: A New Generation")]
    var body: some View {
        VStack(alignment: .leading){
            Text("Atores")
                .font(.title)
                .padding()
                .bold()
            
            Divider()
            
            
            List {
                
                ForEach(atores){ator in
                    
                    
                    AtorPage(ator: ator)
                }
            }.listStyle(.plain)
        }

    }
}

#Preview {
    ActorView()
}
