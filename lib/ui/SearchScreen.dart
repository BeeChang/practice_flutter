import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/CustomData.dart';

class SearchScreen extends StatelessWidget {
  final bool fromCart;

  const SearchScreen({super.key, this.fromCart = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('검색 ${fromCart ? "(장바구니에서 이동)" : ""}'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('상품 1'),
            onTap: () {
               context.push(
                '/product/1',
                extra: {
                  'intValue': 100,
                  'stringValue': '상품1_데이터',
                  'customData': CustomData(id: 1, name: '커스텀데이터1'),
                },
              );
            },
          ),
          ListTile(
            title: const Text('상품 2'),
            onTap: () {
              context.push(
                '/product/2',
                extra: {
                  'intValue': 200,
                  'stringValue': '상품2_데이터',
                  'customData': CustomData(id: 2, name: '커스텀데이터2'),
                },
              );
            },
          ),
          ListTile(
            title: const Text('상품 3'),
            onTap: () {
              context.push(
                '/product/3',
                extra: {
                  'intValue': 300,
                  'stringValue': '상품3_데이터',
                  'customData': CustomData(id: 3, name: '커스텀데이터3'),
                },
              );
            },
          ),
          ListTile(
            title: const Text('상품 4'),
            onTap: () {
              context.push(
                '/product/4',
                extra: {
                  'intValue': 400,
                  'stringValue': '상품4_데이터',
                  'customData': CustomData(id: 4, name: '커스텀데이터4'),
                },
              );
            },
          ),
        ],
      ),
    );
  }
}