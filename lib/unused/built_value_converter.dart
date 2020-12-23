// import 'package:chopper/chopper.dart';
// import 'package:built_collection/built_collection.dart';
// import 'serializers.dart';
//
// class BuiltValueConverter extends JsonConverter {
//   @override
//   Request convertRequest(Request request) {
//     return super.convertRequest(
//       request.replace(
//         // request.body is of type dynamic, but we know that it holds only BuiltValue classes (BuiltPost).
//         // Before sending the request to the network, serialize it to a List/Map using a BuiltValue serializer.
//         body: serializers.serializeWith(
//           // Since convertRequest doesn't have a type parameter, Serializer's type will be determined at runtime
//           serializers.serializerForType(request.body.runtimeType),
//           request.body,
//         ),
//       ),
//     );
//   }
// }