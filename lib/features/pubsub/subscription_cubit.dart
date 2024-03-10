import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_client/mqtt_client.dart';

typedef SubscriptionState = Map<String, List<MqttPublishMessage>>;

/// A class that handle subscription state
class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super({});

  void clear(){
    emit({});
    return;
  }

  bool isTopicSubscribed(String topic){
    return state[topic] != null;
  }
  /// add topic subscription into state (if topic not exist)
  void addSubscription(String topic) {
    final isFound = state[topic] != null;
    if (isFound) {
      return;
    }
    emit(
      {
        ...state,
        topic: List<MqttPublishMessage>.empty(
          growable: true,
        ),
      },
    );
    return;
  }

  /// remove topic subscription from state (if topic exist)
  void removeSubscription(String topic) {
    final isFound = state[topic] != null;

    if (!isFound) {
      return;
    }

    final oldState = state;
    oldState.removeWhere((key, value) => key == topic);

    emit({...oldState});
    return;
  }

  /// Update messages in topic (if topic already subscribed)
  void onUpdatesTopic(String topic, MqttPublishMessage message) {
    final topicMessages = state[topic];
    if (topicMessages == null) {
      return;
    }
    topicMessages.add(message);

    emit({
      ...state,
      topic: [
        ...topicMessages,
      ]
    });
    return;
  }
}
