import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        this.id,
        this.foto,
        this.carga,
        this.nombre_carga = '',
        this.tipo = '',
        this.ubicacion_inicio = '',
        this.ubicacion_destino = '',
        this.precio = 0.0,
        this.peso = '',
        this.disponible = true,
        this.descripcion_carga = '',
    });

    String id;
    String foto;
    String carga;
    String nombre_carga;
    String tipo;
    String ubicacion_inicio;
    String ubicacion_destino;
    double precio;
    String peso;
    bool disponible;
    String descripcion_carga;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        foto: json["foto"],
        carga: json["carga"],
        nombre_carga: json["nombre_carga"],
        tipo: json["tipo"],
        ubicacion_inicio: json["ubicacion_inicio"],
        ubicacion_destino: json["ubicacion_destino"],
        precio: json["precio"],
        peso: json["peso"],
        disponible: json["disponible"],
        descripcion_carga: json["descripcion_carga"],
    );

    Map<String, dynamic> toJson() => {
        //"id": id,
        "foto": foto,
        "carga": carga,
        "nombre_carga": nombre_carga,
        "tipo": tipo,
        "ubicacion_inicio": ubicacion_inicio,
        "ubicacion_destino": ubicacion_destino,
        "precio": precio,
        "peso": peso,
        "disponible": disponible,
        "descripcion_carga": descripcion_carga,
    };
}
