import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              PortfolioCard(),
              PortfolioCard(),
            ],
          ),
          Row(
            children: <Widget>[
              PortfolioCard(),
              PortfolioCard(),
            ],
          ),
          Row(
            children: <Widget>[
              PortfolioCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class PortfolioCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 6,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Kaymu"),
                SizedBox(
                  height: 8.0,
                ),
                Image.network(
                  "https://source.unsplash.com/300x200/?technology",
                  width: 150,
                  height: 100,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Kaymu is the world’s fastest growing online marketplace, offering a platform to local buyers and sellers. At Kaymu’s online store you can buy, sell and advertise a comprehensive range of products including fashion like T-shirts and dresses, footwear, mobile phones, computers, jewelry, watches, electronics, home & living products, items for sports & outdoors, food & beverages and much more products that you have never heard of before.",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
