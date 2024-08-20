import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/image_entity.dart';
import '../bloc/home/home_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 204, 204, 204),
                        borderRadius: BorderRadius.circular(11)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "July 14,2023",
                        style: TextStyle(
                            color: Color.fromARGB(255, 170, 170, 170),
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "Hello ,",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "abd",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  OutlinedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                    ),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(1),
                        minimumSize: Size(40, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                        side: BorderSide(
                            color: Color.fromARGB(255, 217, 217, 217)),
                        backgroundColor: Colors.white),
                  )
                  // ButtonIcon(icon: Icons.notifications_none_outlined,background: Colors.white,color: Colors.black,)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // product section

              Flexible(
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Text(
                        //   "All images",
                        //   style: TextStyle(
                        //     fontSize: 22,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 217, 217, 217),
                              ),
                              prefixIcon: Icon(Icons.search),
                              
                              
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Spacer(),
                        BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            List<ImageEntity> images = [];
                            if (state is HomeSuccessLoading) {
                              images = state.images;
                            }
                            return OutlinedButton(
                              onPressed: () {
                                context.read<HomeBloc>().add(
                                    ImageSearched(term: searchController.text));
                                
                              },
                              child: Icon(
                                Icons.search,
                                color: Color.fromARGB(255, 217, 217, 217),
                              ),
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.all(2),
                                  minimumSize: Size(40, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9)),
                                  side: BorderSide(
                                      color:
                                          Color.fromARGB(255, 217, 217, 217)),
                                  backgroundColor: Colors.white),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //cardsl
                    Expanded(
                        // child: ListView.builder(
                        //   itemCount: 10,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return ItemCard();
                        //   },
                        // ),

                        child: BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                      if (state is HomeSuccessLoading) {
                        List<ImageEntity> images = state.images;

                        List<Widget> allCards = images.map((image) {
                          return ItemCard(image: image);
                        }).toList();
                        return ListView(
                          children: allCards,
                        );
                      } else if (state is HomeImageLoading) {
                        return CircularProgressIndicator();
                      } else {
                        return Text("error ");
                      }
                    })
                        //  ListView(
                        //   children: allCards,
                        // )
                        )
                  ],
                ),
              )
            ],
          ),
        ),
       
      ),
    );
  }
}





class ItemCard extends StatelessWidget {
  ItemCard({super.key, required this.image});

  ImageEntity image;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: () => {
          // Navigator.pushNamed(
          //   context,
          //   '/detail',
          //   arguments: product,
          // )
          print("image.card")
        },
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(image.imageUrl,fit: BoxFit.fitWidth,),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          image.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    
                      
                    ],
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
