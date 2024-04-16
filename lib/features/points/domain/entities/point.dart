import 'package:equatable/equatable.dart';

class Point extends Equatable{
  final int ?id;
  final String serviceType;
  final String images;
  final int numOfPoints;

  const Point({this.id, required this.serviceType, required this.images, required this.numOfPoints});

  @override
  List<Object?> get props => [id, serviceType, images, numOfPoints];

  
}