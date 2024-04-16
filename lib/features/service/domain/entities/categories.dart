import 'package:equatable/equatable.dart';

class Categories extends Equatable{
  final int ?id;
  final String serviceType;
  final String images;

  const Categories({this.id, required this.serviceType, required this.images});

  @override
  List<Object?> get props => [id, serviceType, images];

  
}