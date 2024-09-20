import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/helpers/app_logger.dart';
import '../../../../../core/network/net_exception.dart';
import '../../../../../core/network/net_result.dart';
import '../models/personal_behavior_model.dart';

abstract class BehaviorPredictionDataSource {
  Future<Result> fetchPeopleBehaviors();
}

class BehaviorPredictionDataSourceImpl implements BehaviorPredictionDataSource {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  @override
  Future<Result> fetchPeopleBehaviors() async {
    Result result = Result();
    List<PeopleBehaviorModel> behaviorList = [];
    try {
      QuerySnapshot snapshot =
          await firestoreInstance.collection('human-behavior').get();
      for (var doc in snapshot.docs) {
        if (doc.data() != null) {
          Log.info("behavior data --->${doc.data()}");
          final data =
              PeopleBehaviorModel.fromJson(doc.data() as Map<String, dynamic>);
          behaviorList.add(data);
        }
      }
      result.result = behaviorList;
      return result;
    } catch (error) {
      Log.err("fetch behaviors err $error");
      result.exception = NetException(
          message: '$error',
          messageId: CommonMessageId.SOMETHING_WENT_WRONG,
          code: ExceptionCode.CODE_000);
      return result;
    }
  }
}
