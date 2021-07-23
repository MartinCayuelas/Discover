import 'package:flutter/cupertino.dart';
import 'package:shoesapp/models/shoes_model.dart';

class ListShoes {
  List<Shoes> listShoesPuma = [
    Shoes(
      id:1,
        brandName: "Puma",
        name: "Performer Clay Trainers",
        price: 100.0,
        imageName: "puma1",
        color: Color(0xFFb2cec2),
        description:
            "Cette basket vraisemblablement la plus audacieuse de PUMA Tennis est un modèle innovant doté d'empiècements en forme d'éclairs sur la matière supérieure. La Performance Clay ..."),
    Shoes(
        id:2,
        brandName: "Puma",
        name: "PUMA x THE HUNDREDS",
        price: 110.0,
        imageName: "puma2",
        color: Color(0xFF333132),
        description:
            "The Hundreds propose une nouvelle interprétation de la forme des années 90 pour le 21ème siècle. Avec ses blocs de couleurs asymétriques et son profil plat en daim souple."),
    Shoes(
        id:3,
        brandName: "Puma",
        name: "Future Rider Play On Trainers",
        price: 90.0,
        imageName: "puma3",
        color: Color(0xFF68b972),
        description: "lorem impsum dolor si amet"),
    Shoes( id:4,
        brandName: "Puma",
        name: "R78 Runner Trainers",
        price: 60.0,
        imageName: "puma4",
        color: Color(0xFF8d2d2e),
        description: "lorem impsum dolor si amet"),
  ];

  List<Shoes> listShoesNike = [
    Shoes(
        id:5,
        brandName: "Nike",
        name: "Nike Killshot OG SP",
        price: 90.0,
        imageName: "nike1",
        color: Color(0xFFd2ccc1),
        description: "lorem impsum dolor si amet"),
    Shoes(
        id:6,
        brandName: "Nike",
        name: "Nike Metcon 5",
        price: 130.0,
        imageName: "nike2",
        color: Color(0xFFc2c0ba),
        description: "lorem impsum dolor si amet"),
    Shoes(
        id:7,
        brandName: "Nike",
        name: "Jordan Max 200",
        price: 140.0,
        imageName: "nike3",
        color: Color(0xFFb8402b),
        description: "lorem impsum dolor si amet"),
    Shoes(
        id:8,
        brandName: "Nike",
        name: "Nike Air Zoom Pegasus 36 Trail",
        price: 130.0,
        imageName: "nike4",
        color: Color(0xFFa6bebd),
        description: "lorem impsum dolor si amet"),
  ];
  List<Shoes> listShoesAdidas = [
    Shoes(
        id:9,
        brandName: "Adidas",
        name: "CHAUSSURE CONTINENTAL 80",
        price: 99.95,
        imageName: "adidas1",
        color: Color(0xFFb3a385),
        description: "lorem impsum dolor si amet"),
    Shoes(
        id:10,
        brandName: "Adidas",
        name: "CHAUSSURE 4D RUN 1.0",
        price: 199.95,
        imageName: "adidas2",
        color: Color(0xFF979794),
        description: "lorem impsum dolor si amet"),
    Shoes(

        id:11,
        brandName: "Adidas",
        name: "CHAUSSURE GAZELLE",
        price: 94.95,
        imageName: "adidas3",
        color: Color(0xFF1a1a17),
        description: "lorem impsum dolor si amet"),
    Shoes(
        id:12,
        brandName: "Adidas",
        name: "CHAUSSURE STAN SMITH",
        price: 94.95,
        imageName: "adidas4",
        color: Color(0xFFe2e2e4),
        description: "lorem impsum dolor si amet"),
  ];

  List<Shoes> newShoesPuma = [
    Shoes(
        id:13,
        brandName: 'Puma',
        name: 'Style Rider Stream',
        price: 100.0,
        imageName: "puma5",
        color: Color(0xff3d4438),
        description: "lorem impsum dolor si amet"),
    Shoes(
        id:14,
        brandName: 'Puma',
        name: 'PUMA x THE HUNDREDS',
        price: 120.0,
        imageName: "puma6",
        color: Color(0xffb1496a),
        description: "lorem impsum dolor si amet")
  ];
  List<Shoes> newShoesNike = [
    Shoes(
        id:15,
        brandName: 'Nike',
        name: 'Nike Air Max 200 SE',
        price: 125.0,
        imageName: "nike5",
        color: Color(0xff245958),
        description: "lorem impsum dolor si amet"),
    Shoes(
        id:16,
        brandName: 'Nike',
        name: 'NikeCourt Air Zoom',
        price: 140.0,
        imageName: "nike6",
        color: Color(0xffdd2449),
        description: "lorem impsum dolor si amet")
  ];
  List<Shoes> newShoesAdidas = [
    Shoes(
        id:17,
        brandName: 'Adidas',
        name: 'CHAUSSURE SL 72',
        price: 89.95,
        imageName: "adidas5",
        color: Color(0xff2e5686),
        description: "lorem impsum dolor si amet"),
    Shoes(
        id:18,
        brandName: 'Adidas',
        name: 'CHAUSSURE SL 80',
        price: 99.95,
        imageName: "adidas6",
        color: Color(0xffcdccce),
        description: "lorem impsum dolor si amet")
  ];
}
