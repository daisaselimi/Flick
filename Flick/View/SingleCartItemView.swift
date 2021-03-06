//
//  SingleCartItemView.swift
//  Flick
//
//  Created by Isa  Selimi on 12.8.21.
//

import SwiftUI
import Kingfisher

struct SingleCartItemView: View {
    
    @ObservedObject var cartViewModel = ShoppingCartViewModel()
    var cartItem: CartItem
    
    var body: some View {
        HStack {
            KFImage(URL(string: cartItem.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(cartItem.name)
                    .font(.system(size: 16))
                HStack {
                    Button(action: {
                        cartViewModel.decreaseQuantity(cartItem: cartItem)
                    }, label: {
                        Image(systemName: "chevron.left")
                    })
                    Text("\(Int(cartItem.quantity))")
                        .padding(.horizontal)
                    Button(action: {
                        cartViewModel.increaseQuantity(cartItem: cartItem)
                    }, label: {
                        Image(systemName: "chevron.right")
                    })
                }
            }
            Spacer()
            Text("$\(cartItem.cost.clean)")
                .font(.system(size: 20)).bold()
        }
        .foregroundColor(.black)
        .padding(.horizontal)
    }
}

struct SingleCartItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCartItemView(cartItem:mockCartItem)
    }
}
