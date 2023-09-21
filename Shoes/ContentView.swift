import SwiftUI
////
////  ContentView.swift
////  Tesla
////
////  Created by mishu on 27.07.2022.
////
//
//import SwiftUI
////
////class Storage:ObservableObject{
////    @Published var text:String=""
////}
////
//struct ContentView: View {
//    //    @StateObject var text = Storage()
//    var body: some View {
//        //        Read().environmentObject(text)
//        ZStack {
//
//            background_color.ignoresSafeArea()
//            VStack {
//    //            NavigationView{
//    //                NavigationLink(destination: {SecondView().navigationBarHidden(true)}){
//    //                    Text("First")
//    //                }
//
//                ZStack {
//                    RoundedRectangle(cornerRadius: 30)
//                        .fill(blue)
//                        .frame(width: (UIScreen.main.bounds.width - 100)/2, height: 50)
////                        .innerOuterShadow(color: blue)
//                    Text("Buy")
//                        .foregroundColor(gray1)
//                        .font(.system(size: 30))
//                        .fontWeight(.semibold)
//                }
//
//                ZStack {
//                    RoundedRectangle(cornerRadius: 30)
//                        .fill(blue)
//                        .frame(width: (UIScreen.main.bounds.width - 100)/2, height: 50)
//                        .innerOuterShadow(color: blue)
//                    Text("Buy")
//                        .foregroundColor(gray1)
//                        .font(.system(size: 30))
//                        .fontWeight(.semibold)
//                }
//
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(.blue)
//                        .modifier(Shadow(color: .blue))
//                        .frame(width: 300, height: 400)
//
//            }
//        }
//        }
//    }
////}
//struct SecondView:View{
//
//    @Environment(\.dismiss) var dismiss
//    @State var isShown = false
//
//    var body: some View{
//        NavigationView{
//            VStack{
//                Text("Go back")
//                    .onTapGesture{
//                        dismiss()
//                    }
//
//                Spacer()
//
//
//                NavigationLink(destination:ThirdView().navigationBarHidden(true),isActive: $isShown){
//                    Text("Second")
//                }
//                .isDetailLink(false)
//                .onTapGesture{
//                    dismiss()
//                    isShown.toggle()
//                }
//            }
//        }
//
//
//    }
//}
//
//struct ThirdView:View{
//    @Environment(\.dismiss) var dismiss
//    var body: some View{
//        VStack{
//            Text("Go back")
//                .onTapGesture{
//                    dismiss()
//                }
//
//            Spacer()
//            Text("Third")
//        }
//
//    }
//}
//
////struct Read:View{
////    @EnvironmentObject var text:Storage
////    var body: some View{
////        VStack{
////            TextField("Enter", text: $text.text)
////            Display()
////        }
////    }
////}
////
////struct Display:View{
////    @EnvironmentObject var text:Storage
////    var body: some View{
////        Text(text.text)
////    }
////}
//
////struct ContentView_Previews: PreviewProvider {
////    static var previews: some View {
////        ContentView()
////    }
////}
///
///
///
///
struct Main:View{
    @State var selected = false
    var body: some View{
        ZStack {
            
            background_color.ignoresSafeArea()
            
            Button {
                selected = true
            } label: {
                
                Text("3")
            }

            if selected{
                Second()
                    .transition(.slide)
            }
        }
    }
}

struct Second:View{
    var body: some View{
        ZStack{
            background_color.ignoresSafeArea()
            Text("second")
        }
    }
}

struct Pre:PreviewProvider{
    static var previews: some View{
        Main()
    }
}
