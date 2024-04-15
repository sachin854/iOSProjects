import SwiftUI

struct HomeView: View {
    @StateObject  var vm = SignIn_withGoogle_VM()
    @State var labelColor=false
    @ObservedObject var viewModelfeeds = ViewModelFeeds()

    var body: some View {
        
//        VStack{
//            ScrollView{
//                VStack(spacing: 0, content: {
//                    List(viewModelfeeds.feeds, id: \._id) { feeds in
//                        PostDetails(feeds: feeds)
//                    }
//
////                    ForEach(0..<10) { _ in
////                        HStack(alignment: .top,spacing: 0, content: {
////                            PostDetails(feeds: feeds)
////
////                        })
////                    }
//
//
//                })
//                .navigationBarItems(leading: NavBarLeadingItems())
//                .statusBar(hidden: true)
//
//            }
//            BottomTabBar()
//        }.onAppear {
//            viewModelfeeds.feedPosts(
//                token:"Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjlhNTE5MDc0NmU5M2JhZTI0OWIyYWE3YzJhYTRlMzA2M2UzNDFlYzciLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc3RyYW5nZS10b3VyaXNtIiwiYXVkIjoic3RyYW5nZS10b3VyaXNtIiwiYXV0aF90aW1lIjoxNjk2NDAwMjI2LCJ1c2VyX2lkIjoiblRYUTg3MzVhWWRQMHNNcVBzYWU0eE1hUG5UMiIsInN1YiI6Im5UWFE4NzM1YVlkUDBzTXFQc2FlNHhNYVBuVDIiLCJpYXQiOjE2OTY0NDE0MzQsImV4cCI6MTY5NjQ0NTAzNCwicGhvbmVfbnVtYmVyIjoiKzkxOTg3NjU0MzIxMCIsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsicGhvbmUiOlsiKzkxOTg3NjU0MzIxMCJdfSwic2lnbl9pbl9wcm92aWRlciI6InBob25lIn19.VR_3tg0dpVWGZfptg3vqjx7Z2TR-JQ9C_BXnnUzBkUpiQasI_7G5OHv0JsaqyXCzLox_liJAXKdOoKW6h_znZf9OnrWXq0tAJt-JQYyB0ygZVXwespg97Gs66JROu_0LvJlP5az5InvDS2ZMzEQDaMkMhCyRz5cxR_e8yQPOAZe3jaMMCm9TkeK5dNMQ8uAY_LuhHqS-XVR8V750yVSWSqzC6DS5oFEdztRhxxXnuRXJANnP9dbp5cgixNT4SC3vZMC0vtUpjgsg0Y7xi6jWxVLTlp8i86sGgpfm3S3orFiz1NDA_eDoYGHXxskyULUe3Xjtuy2bp58nfXGjOH44tQ"
//            )
//
//        }
//
        

        NavigationView {
            List(viewModelfeeds.feeds, id: \._id) { feeds in
                FeedView(feeds: feeds)
            }
            .navigationBarTitle("Posts")

        }
        .onAppear {
            viewModelfeeds.feedPosts(
                token:"Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjlhNTE5MDc0NmU5M2JhZTI0OWIyYWE3YzJhYTRlMzA2M2UzNDFlYzciLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc3RyYW5nZS10b3VyaXNtIiwiYXVkIjoic3RyYW5nZS10b3VyaXNtIiwiYXV0aF90aW1lIjoxNjk2NDAwMjI2LCJ1c2VyX2lkIjoiblRYUTg3MzVhWWRQMHNNcVBzYWU0eE1hUG5UMiIsInN1YiI6Im5UWFE4NzM1YVlkUDBzTXFQc2FlNHhNYVBuVDIiLCJpYXQiOjE2OTY0NDE0MzQsImV4cCI6MTY5NjQ0NTAzNCwicGhvbmVfbnVtYmVyIjoiKzkxOTg3NjU0MzIxMCIsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsicGhvbmUiOlsiKzkxOTg3NjU0MzIxMCJdfSwic2lnbl9pbl9wcm92aWRlciI6InBob25lIn19.VR_3tg0dpVWGZfptg3vqjx7Z2TR-JQ9C_BXnnUzBkUpiQasI_7G5OHv0JsaqyXCzLox_liJAXKdOoKW6h_znZf9OnrWXq0tAJt-JQYyB0ygZVXwespg97Gs66JROu_0LvJlP5az5InvDS2ZMzEQDaMkMhCyRz5cxR_e8yQPOAZe3jaMMCm9TkeK5dNMQ8uAY_LuhHqS-XVR8V750yVSWSqzC6DS5oFEdztRhxxXnuRXJANnP9dbp5cgixNT4SC3vZMC0vtUpjgsg0Y7xi6jWxVLTlp8i86sGgpfm3S3orFiz1NDA_eDoYGHXxskyULUe3Xjtuy2bp58nfXGjOH44tQ"
            )

        }

        
    }
}

struct FeedView: View {
    var feeds: FeedsViewModelElement // Assuming FeedsViewModelElement is your model
    
    var body: some View {
       /* VStack(alignment: .leading) {
            
            Text(feeds.user!.profilePic)
            
        
            Text(feeds.location).foregroundColor(.white).font(.caption2)
                .background(.black)
            Text(feeds.postDate).foregroundColor(.white)
                .background(.black)
            Text(feeds.postText!).foregroundColor(.white)
                .background(.black)
            
            TabView {
                ForEach(feeds.media, id: \.id) { media in
                    ImageView(media: media) // Extract the image view to a separate sub-expression
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .frame(width: 400, height: 400)
        }*/
        
        VStack(alignment: .leading) {
            
            HStack {
                Image(feeds.user!.profilePic)
                    .resizable()
                    .background(Color.black)
                    .frame(width: 50, height: 50)
                    .cornerRadius(36)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                    
                VStack(alignment: .leading) {
                    Text(feeds.user!.userName.rawValue)
                        .bold()
                        .bold()
                    Text(feeds.postDate)
                }.padding(.leading,5)
            }.padding(.leading)
                .padding(.top)
            Text(feeds.postText ?? "")
                .padding(.horizontal, 10)
            ImageSlider(feeds: feeds)
            HStack(spacing: 0) {
                Image("heart_img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text("\(feeds.likeCount )")
            
                Spacer()
                
                Image("comment_img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Image("save_img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Image("share_img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }.frame( height: 50)
                .padding(.trailing)
        }
    }
}

struct ImageView: View {
    var media: Media
    
    var body: some View {
        Image(media.mediaFile) // Assuming 'media' has a 'mediaFile' property
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.top, 6)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct NavBarLeadingItems: View {
    @State var isHeartTapped = false
    var body: some View {
        HStack(content: {
            Image("home_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50,height: 50)
                .padding(.top,6)
                .padding(.bottom,10)
            Spacer()
            HStack(spacing: 0) {
                Image("heart_img")
                              .foregroundColor(isHeartTapped ? .red : .gray)
                              .font(.title2)
                              .padding(.leading, 190)
                              .onTapGesture {
                                  isHeartTapped.toggle()
                              }
                
                Image("chat").background(.gray)
                            .font(.title2)
            }
            
        })
    }
}

struct PostDetails: View {
    @StateObject  var vm = SignIn_withGoogle_VM()
//    @StateObject private var viewModelfeeds = ViewModelFeeds()
    var feeds: FeedsViewModelElement
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(feeds.user!.profilePic)
                    .resizable()
                    .background(Color.black)
                    .frame(width: 50, height: 50)
                    .cornerRadius(36)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                    
                VStack(alignment: .leading) {
                    Text(feeds.user!.userName.rawValue)
                        .bold()
                        .bold()
                    Text(feeds.postDate)
                }.padding(.leading,5)
            }.padding(.leading)
                .padding(.top)
            Text(feeds.postText ?? "")
                .padding(.horizontal, 10)
            ImageSlider(feeds: feeds)
            HStack(spacing: 0) {
                Image("heart_img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text("\(feeds.likeCount ?? 0)")
                
                Spacer()
                
                Image("comment_img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Image("save_img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Image("share_img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }.frame( height: 50)
                .padding(.trailing)
        }
                .onAppear {
//                    viewModelfeeds.feedPosts(withUID:vm.uid )
//                    ViewModel().fetchPosts(withUID: vm.uid)
                }
        .padding(.leading)
        
    }
}

struct ImageSlider: View {
    var feeds: FeedsViewModelElement
    var body: some View {
        TabView {
            ForEach(feeds.media, id: \.id) { mediaItem in
                if mediaItem.mediaType == .image {
                    // Display image
                    Image(mediaItem.mediaFile)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, 6)
                } else if mediaItem.mediaType == .shortVideo {
                    // Display video (you'll need to handle videos differently)
                    Text("Video: \(mediaItem.mediaFile)")
                    // Replace with your video player
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .frame(width: 400, height: 400)
    }
}


struct BottomTabBar: View {
    @State private var selectedTab: Int = 0
    
    var tabItems: [(imageName: String, text: String)] = [
        ("home", "Home"),
        ("map", "Plan"),
        ("add", "Post"),
        ("search", "Search"),
        ("user", "Profile")
    ]
    
    var body: some View {
        HStack {
            
            ForEach(0..<tabItems.count) { tabIndex in
                Spacer()
                TabBarButton(
                    imageName: tabItems[tabIndex].imageName,
                    text: tabItems[tabIndex].text,
                    tabIndex: tabIndex,
                    selectedTab: $selectedTab
                )
                .onTapGesture {
                    selectedTab = tabIndex
                }
                Spacer()
                
            }
        }
        .background(CustomColor.customColor)
    }
}

struct TabBarButton: View {
    var imageName: String
    var text: String
    var tabIndex: Int
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            
            Text(text)
                .foregroundColor(selectedTab == tabIndex ? CustomColor.labelColor : .white)
        }
        .padding(.top)
    }
}

