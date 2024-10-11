import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/order/models/add_cart_req.dart';
import 'package:e_commerce_app/data/order/models/order_regestration_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddCartReq addCartReq);
  Future<Either> getCartProducts();
  Future<Either> removeCartProducts(String id);
  Future<Either> orderRegistration(OrderRegestrationReq order);
}

class OrderFirebaseServiceImpl extends OrderFirebaseService {
  @override
  Future<Either> addToCart(AddCartReq addCartReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .add(addCartReq.toMap());

      return const Right('Added to cart');
    } catch (e) {
      return const Right('please try again later');
    }
  }

  @override
  Future<Either> getCartProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      var returnedData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .get();

      List<Map> products = [];
      for (var item in returnedData.docs) {
        var data = item.data();
        data.addAll({'id': item.id});
        products.add(data);
      }
      return Right(products);

      // return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> removeCartProducts(String id) async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .doc(id)
          .delete();
      return const Right('Removed from cart');
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> orderRegistration(OrderRegestrationReq order) async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Orders')
          .add(order.toMap());

      for (var item in order.products) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('Cart')
            .doc(item.id)
            .delete();
      }

      return const Right('Order registered successfully');
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
