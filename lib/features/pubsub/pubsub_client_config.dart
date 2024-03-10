import 'package:equatable/equatable.dart';

/// Pubsub client config object
class PubsubClientConfig extends Equatable {
  final String host;
  final int port;
  final String username;
  final String password;

  const PubsubClientConfig({
    required this.host,
    required this.port,
    required this.username,
    required this.password,
  });

  String get address => '$host:$port';

  @override
  List<Object?> get props => [
        host,
        port,
        username,
        password,
      ];
}
