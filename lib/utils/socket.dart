// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class StreamingClient {
//   // final String serverUrl;
//   late IO.Socket _socket;
//   final Map<int, dynamic> _messageBuffer = {};
//   int _currentOrder = 1;
//   Function(dynamic,String? chatId,String?messageId)? onMessageCallback;

//   StreamingClient(this._socket) {
//     _setupSocketListeners();
//   }

//   void _setupSocketListeners() {
//     _messageBuffer.clear();
//     _currentOrder = 1;

//     _socket.on('ai_stream_message_chunk', (data) {
//       // print('Received stream chunk: $data');
//       print("_currentOrder  in ai_stream_message_chunk :::::$_currentOrder");
//       _handleChunk(data);
//     });

//   }
//   void reset(){
//     _messageBuffer.clear();
//     _currentOrder = 0; // reseting it to zero because again process buffer increase by one
//     print("Print Current Index$_currentOrder");
//   }

//   void _handleChunk(Map<String, dynamic> data) {
//     final int order = data['order'];
//     final dynamic chunk = data['chunk'];
//     print("Print Order :::::$order");
//     print("Print Chunk :::::$chunk");
//     print("Print Chunk Index:::::${_currentOrder} : ${order == _currentOrder} ${order > _currentOrder}");
//     if (order == _currentOrder) {
//       // Process the chunk immediately
//       // print("Print Chunk Index:::::$_currentOrder");
//       if (onMessageCallback != null) {
//         // print("Print Order Index :::::$onMessageCallback");
//        try{
//          onMessageCallback!(chunk,data['chat_id'],data['message_id']);
//        }catch(e){
//          print("Print Error In Catch $chunk");
//          print("Print Handle Chunk Exception ::::::$e");
//          rethrow;

//        }
//       }
//       _currentOrder++;

//       // Process buffered chunks
//       _processBuffer(data['chat_id'],data['message_id']);
//     } else if (order > _currentOrder) {
//       print("Print Current Order:::::::$order");
//       _messageBuffer[order] = chunk;

//     }
//   }

//   void _processBuffer(chatID,messageId) {
//     // print("Print Message CallBack :::::${onMessageCallback}");
//     while (_messageBuffer.containsKey(_currentOrder)) {
//       final chunk = _messageBuffer[_currentOrder];
//       // print("Print Message CallBack :::::${onMessageCallback}");
//       if (onMessageCallback != null) {
//         onMessageCallback!(chunk,chatID,messageId);
//       }
//       _messageBuffer.remove(_currentOrder);
//       _currentOrder++;
//     }
//   }

//   // void startStreaming() {
//     // Reset state


//     // _socket.emit('startStreaming', {
//     //   'chatflowId': chatflowId,
//     //   'question': question,
//     // });
//   // }

//   void onMessage(Function(dynamic,String? chatId,String?messageId) callback) {
//     // print('Received chunk Data ::::::::: $callback');
//     onMessageCallback = callback;
//   }

//   // void connect() {
//   //   // _socket.connect();
//   // }
//   //
//   // void disconnect() {
//   //   _socket.disconnect();
//   // }
// }