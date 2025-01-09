// import 'dart:convert';

// import 'package:chatnew/utils/socket.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:chatnew/Screens/Chats/Controller/chat_controller.dart';
// import 'package:chatnew/Screens/Chats/Model/get_messages_list_model.dart';
// import 'package:chatnew/utils/http_utils.dart';

// import 'package:socket_io_client/socket_io_client.dart';
// // ignore: library_prefixes
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// import '../CommonComponents/common_services.dart';
// import '../CommonComponents/snack_bar_widget.dart';
// import '../Routes/app_pages.dart';
// import '../Screens/Chats/Model/get_chat_users_list_model.dart';

// final chatController = Get.put(ChatController());

// class SocketUtils {
//   // ignore: constant_identifier_names
//   // static const String SOCKET_BASE_URL = 'ws://192.168.1.42:3000/';
//   // static const String SOCKET_BASE_URL = 'ws://144.24.97.26:5001';
//   // static const String SOCKET_BASE_URL = 'ws://144.24.97.26:5001';

//   static IO.Socket? socket;
//   static socketLogin() {
//     // IO.Socket? socket;
//     socket = IO.io(HttpUtils.API_IO_SERVER_PREFIX, <String, dynamic>{
//       'autoConnect': false,
//       'transports': ['websocket'],
//     });
//     if (!socket!.connected) {
//       socket!.connect();
//     }
//     print("Print Scoket Connection Status:::::${socket!.connected}");
//     socket!.onConnect((_) {
//       debugPrint('Connection established');
//       debugPrint('Device Id:::::${CommonService.instance.deviceId}');
//       socket!.emit('login', {'jwt_token': CommonService.instance.accessToken, 'device_uuid': CommonService.instance.deviceId});
//     });
//     socket!.on('login_feedback', (data) {
//       debugPrint("Getting In Login Event");
//       debugPrint("Printing Socket Id:::::::::::::${socket!.id}");
//       debugPrint(data);
//     });
//     socket!.on('typing', (data) {
//       debugPrint("Getting In Typing Event");
//       debugPrint("Printing Socket Id:::::::::::::${socket!.id}");
//       debugPrint("Printing Socket Id:::::::::::::${data['typing']}");
//       chatController.isTyping = data['typing'];
//     });
//     socket!.on('ai_stream_message_complete', (data) {
//       // debugPrint("Getting In ai_stream_message_complete Event");
//       // debugPrint("Printing Socket Id:::::::::::::${socket!.id}");
//       // debugPrint("Printing Streamed  Id:::::::::::::${data['chunk']}");
//       // chatController.isTyping = data['typing'];
//     });
//     socket!.on('ai_stream_message_chunk', (data) {
//       // debugPrint("Getting In ai_stream_message_complete Chunk Event");
//       // debugPrint("Printing Socket Id Chunk :::::::::::::${socket!.id}");
//       // debugPrint("Printing Streamed  Id Chunk:::::::::::::${data}");
//       // chatController.isTyping = data['typing'];
//     });
//     final client = StreamingClient(socket!);
//     client.onMessage((chunk, chatId, messageId) {
//       // Process each chunk as it arrives
//       // debugPrint("Printing Streamed  Id Chunk:::::::::::::${chunk}");
//       debugPrint("Printing Streamed  Id Message:::::::::::::${messageId}");
//       debugPrint("Printing Streamed  Id Chat:::::::::::::${chatId}");
//       // print(chunk is String ? chunk : chunk.toString());
//       if (chunk['event'] == 'token') {
//         // chatController.streamedMsg += chunk['data'];
//         var chunkMsg = chunk['data'];
//         // var dat = chatController.streamedMessages.where((entry) => entry.key == chatId);
//         // if (dat) {
//         //   chatController.streamedMessages({chatId: dat.value + msg });
//         // } else {
//         if (chatController.streamedMessages != null && chatController.streamedMessages.containsKey(chatId)) {
//           var msg = chatController.streamedMessages[chatId];
//           chatController.streamedMessage(chatId, msg + chunkMsg);
//           chatController.update();
//         } else {
//           chatController.streamedMessage(chatId, chunkMsg);
//           chatController.update();
//         }

//         // }
//         // print("Print Data Of Streamed Message0:::::$dat");
//         // print("Print Data Of Streamed Message0:::::${chatController.streamedMessages}");
//       } else if (chunk['event'] == 'end') {
//         // chatController.streamedMsg+=' -------end';
//         client.reset();
//         // var msg = chunk['data'];
//         // LastMessage lastMsg = LastMessage(message: chatController.streamedMessages[chatId]);
//         // print("Last Message Json::::::${lastMsg.toJson()}");
//         // chatController.onChatUserMessage(GetUsersChatListData.fromJson(msg['chat']), LastMessage.fromJson(lastMsg.toJson()));
//         // chatController.update();
//         print("Print Msg Id in End ::::$messageId");
//         print("Print Msg Id in End ::::${chatController.messagesList.first.id}");
//         if (chatController.chatDetails.data != null && chatController.chatDetails.data!.chat!.id == chatId) {
//           try {
//             var msg = chatController.messagesList.firstWhere((message) => message.id == messageId);
//             print("Print Message in End Event :::::$msg");
//             msg.isStreaming = false;
//             msg.message = chatController.streamedMessages[chatId] != null ? chatController.streamedMessages[chatId] ?? '' : 'Failed To Generate AI Message Try Again';
//             // chatController.messagesList.

//             // chatController.streamedMessage(chatId, '');
//             chatController.streamedMessages.remove(chatId);
//             chatController.update();
//           } catch (error) {
//             print("Print Error In End Event :::::::$error");
//           }
//         }
//       } else if (chunk['event'] == 'init') {
//         debugPrint("On Init Event ::::::::::::::::::::: ");
//         var msg = chunk['message'];
//         print("Print MSg LKNFNDNFJ:$msg");
//         LastMessage lastMsg = LastMessage(message: msg['message']);
//         print("On Init Last Message Json::::::${lastMsg.toJson()}");
//         chatController.onChatUserMessage(GetUsersChatListData.fromJson(msg['chat']), LastMessage.fromJson(lastMsg.toJson()));
//         chatController.update();
//         debugPrint(
//             "In Init Before if ::::::::::::::::::::: chatController.chatDetails.data != null && chatController.chatDetails.data!.chat!.id == msg['chat']['_id']");
//         debugPrint("${chatController.chatDetails.data != null} ${chatController.chatDetails.data!.chat!.id == msg['chat']['_id']}");
//         if (chatController.chatDetails.data != null && chatController.chatDetails.data!.chat!.id == msg['chat']['_id']) {
//           chatController.onChatMessage(GetMessagesListData.fromJson(msg));
//           // socketReadMessage(chatController.chatDetails.data!.chat!.id, chatController.messagesList.last.id);
//           chatController.update();
//         }
//       }else if(chunk['event'] == 'error'){
//         var msgs = 'Failed To Generate';
//         print("Print Msg Id in End ::::$messageId");
//         print("Print Msg Id in End ::::${chatController.messagesList.first.id}");
//         if (chatController.chatDetails.data != null && chatController.chatDetails.data!.chat!.id == chatId) {
//           try {
//             var msg = chatController.messagesList.firstWhere((message) => message.id == messageId);
//             print("Print Message in End Event cfghghghhf:::::${msg.toJson()}");
//             // msg.isStreaming = false;
//             msg.message =  msgs;
//             // chatController.messagesList.

//             // chatController.streamedMessage(chatId, '');
//             // chatController.streamedMessages.remove(chatId);
//             chatController.update();
//           } catch (error) {
//             print("Print Error In End Event :::::::$error");
//           }
//         }
//       }
//       // chatController.update();

//       // if (chatController.chatDetails.data != null && chatController.chatDetails.data!.chat!.id == chatId) {
//       //   chatController.onChatMessage(GetMessagesListData.fromJson(chunk['data']));
//       //   socketReadMessage(chatController.chatDetails.data!.chat!.id, chatController.messagesList.last.id);
//       //   chatController.update();
//       // }
//       // chatController.update();
//     });
//     socket!.on('ai_message_error', (data) {
//       debugPrint("Getting In ai_stream_message_complete Chunk Event");
//       debugPrint("Printing Socket Id Chunk :::::::::::::${socket!.id}");
//       debugPrint("Printing Streamed  Error Chunk:::::::::::::${data}");
//     });
//     socket!.on('receive_message', (data) {
//       debugPrint("Getting In Receive Event");
//       debugPrint("Printing Socket Id:::::::::::::${data}");
//       debugPrint("Printing Socket Id:::::::::::::${data['message']['chat']}");

//       debugPrint("Print MSGS Length:::::::::${chatController.messagesList.length}");
//       debugPrint("Print Socket Id:::::::::${socket!.id}");
//       debugPrint("Print Socket Message:::::::::${data['message']['message']}");
//       debugPrint("Print Socket Type:::::::::${data['message']['type']}");
//       debugPrint("Print Socket CreatedOn:::::::::${data['message']['created_on']}");
//       LastMessage lastMsg = LastMessage(message: data['message']['message'], createdOn: DateTime.parse(data['message']['created_on']));
//       print("Last Message Json::::::${lastMsg.toJson()}");
//       chatController.onChatUserMessage(GetUsersChatListData.fromJson(data['chat']), LastMessage.fromJson(lastMsg.toJson()));
//       chatController.update();
//       if (chatController.chatDetails.data != null && chatController.chatDetails.data!.chat!.id == data['chat']['_id']) {
//         chatController.onChatMessage(GetMessagesListData.fromJson(data['message']));
//         socketReadMessage(chatController.chatDetails.data!.chat!.id, chatController.messagesList.last.id);
//         chatController.update();
//       }

//       // debugPrint("Print MSGS cvngng Length:::::::::${chatController.messagesList.last.message}");

//       debugPrint(data);
//     });
//     socket!.onDisconnect((_) => debugPrint('Connection Disconnection'));
//     socket!.onConnectError((err) => debugPrint(err.toString()));
//     socket!.onError((err) => debugPrint(err.toString()));
//   }

//   static socketLocation(lat, long) {
//     // socket = IO.io(HttpUtils.IO_PREFIX, <String, dynamic>{
//     //   'autoConnect': true,
//     //   'transports': ['websocket'],
//     // });
//     // socket!.connect();
//     // socket!.onConnect((_) {
//     //   debugPrint('Connection established');
//     //   debugPrint("Socket ID::::: ${socket!.id}");
//     if (!socket!.connected) {
//       print("Socket Failed");
//       socketLogin();
//     }
//     socket!.emit('update_location', {'lat': lat.toString().substring(0, 9), 'lng': long.toString().substring(0, 9)});
//     //   // socket!.emit('login',{ 'access_token':CommonService.instance.accessToken, 'device_uuid': CommonService.instance.deviceId });
//     // });
//     socket!.on('update_location', (data) {
//       debugPrint("Getting In Login Event");
//       debugPrint("Printing Socket Id:::::::::::::${socket!.id}");
//       debugPrint(data);
//     });
//   }

//   static socketMsgUpdate(chatId, message, isAIChat) {
//     // socket = IO.io(HttpUtils.IO_PREFIX, <String, dynamic>{
//     //   'autoConnect': true,
//     //   'transports': ['websocket'],
//     // });
//     // socket!.connect();
//     // socket!.onConnect((_) {
//     //   debugPrint('Connection established');
//     //   debugPrint("Socket ID::::: ${socket!.id}");
//     debugPrint("Chat Id :::::$chatId");
//     debugPrint("Chat Message :::::$message");
//     debugPrint("Socket Connect Status  :::::${socket!.connected}");
//     if (!socket!.connected) {
//       print("Socket Failed");
//       socketLogin();
//     }
//     // socket!.onConnect((_) {
//     //   debugPrint('Connection established');
//     //   debugPrint('Device Id:::::${CommonService.instance.deviceId}');
//     //   socket!.emit('send_message', {'chat_id': chatId, 'message': message});
//     // });
//     if (isAIChat == false) {
//       print("Socket Chat Type:::::::::: $isAIChat");
//       socket!.emit('send_message', {'chat_id': chatId, 'message': message});
//     } else {
//       print("Socket Chat Type:::::::::: $isAIChat");
//       socket!.emit('send_ai_message', {'chat_id': chatId, 'message': message});
//     }
//     // socket!.emit('send_message', {'chat_id': chatId, 'message': message});
//     //
//     // socket!.emit('send_ai_message', {'chat_id': chatId, 'message': message});

//     //   // socket!.emit('login',{ 'access_token':CommonService.instance.accessToken, 'device_uuid': CommonService.instance.deviceId });
//     // });
//     socket!.on('receive_message', (data) {
//       debugPrint("Getting In Receive Event");
//       debugPrint("Printing Socket Id:::::::::::::${data}");
//       debugPrint("Printing Socket Id:::::::::::::${data['message']['chat']}");

//       debugPrint("Print MSGS Length:::::::::${chatController.messagesList.length}");
//       debugPrint("Print Socket Id:::::::::${socket!.id}");
//       debugPrint("Print Socket Message:::::::::${data['message']['message']}");
//       debugPrint("Print Socket Type:::::::::${data['message']['type']}");
//       debugPrint("Print Socket CreatedOn:::::::::${data['message']['created_on']}");
//       LastMessage lastMsg = LastMessage(message: data['message']['message'], createdOn: DateTime.parse(data['message']['created_on']));
//       print("Last Message Json::::::${lastMsg.toJson()}");
//       if (chatController.chatDetails.data!.chat!.id == data['chat']['_id']) {
//         chatController.onChatMessage(GetMessagesListData.fromJson(data['message']));
//         // chatController.messageTextConrtoller.clear();
//       }
//       chatController.onChatUserMessage(GetUsersChatListData.fromJson(data['chat']), LastMessage.fromJson(lastMsg.toJson()));
//       chatController.update();
//       // chatController.messagesList.add(GetMessagesListData.fromJson(data['message']['chat']));
//       // chatController.update();

//       // debugPrint("Print MSGS cvngng Length:::::::::${chatController.messagesList.last.message}");

//       debugPrint(data);
//     });
//     socket!.onDisconnect((_) => debugPrint('Connection Disconnection'));
//     socket!.onConnectError((err) => debugPrint(err.toString()));
//     socket!.onError((err) => debugPrint(err.toString()));
//   }

//   static socketReadMessage(chatId, messageId) {
//     debugPrint("Chat Id :::::$chatId");
//     debugPrint("Chat Message :::::$messageId");
//     debugPrint("Socket Connect Status  :::::${socket!.connected}");
//     if (!socket!.connected) {
//       print("Socket Failed");
//       socketLogin();
//     }
//     socket!.emit('read_msg', {'chat': chatId, 'msg_read': messageId});
//     // socket!.emit('ai_stream_message_complete', {'chat': chatId, 'msg_read': messageId});
//   }

//   static socketTypingEvent(chatId, status) {
//     // socket = IO.io(HttpUtils.IO_PREFIX, <String, dynamic>{
//     //   'autoConnect': true,
//     //   'transports': ['websocket'],
//     // });
//     // socket!.connect();
//     // socket!.onConnect((_) {
//     //   debugPrint('Connection established');
//     //   debugPrint("Socket ID::::: ${socket!.id}");
//     debugPrint("Chat Id :::::$chatId");
//     debugPrint("Chat Message :::::$status");
//     debugPrint("Socket Connect Status  :::::${socket!.connected}");
//     if (!socket!.connected) {
//       print("Socket Failed");
//       socketLogin();
//     }
//     // socket!.onConnect((_) {
//     //   debugPrint('Connection established');
//     //   debugPrint('Device Id:::::${CommonService.instance.deviceId}');
//     //   socket!.emit('send_message', {'chat_id': chatId, 'message': message});
//     // });
//     socket!.emit('typing', {'chat_id': chatId, 'typing': status});

//     //   // socket!.emit('login',{ 'access_token':CommonService.instance.accessToken, 'device_uuid': CommonService.instance.deviceId });
//     // });
//     // socket!.on('receive_message', (data) {
//     //   debugPrint("Getting In Receive Event");
//     //   debugPrint("Printing Socket Id:::::::::::::${data}");
//     //   debugPrint("Printing Socket Id:::::::::::::${data['message']['chat']}");
//     //
//     //   debugPrint("Print MSGS Length:::::::::${chatController.messagesList.length}");
//     //   debugPrint("Print Socket Id:::::::::${socket!.id}");
//     //   debugPrint("Print Socket Message:::::::::${data['message']['message']}");
//     //   debugPrint("Print Socket Type:::::::::${data['message']['type']}");
//     //   debugPrint("Print Socket CreatedOn:::::::::${data['message']['created_on']}");
//     //   LastMessage lastMsg = LastMessage(message: data['message']['message'],createdOn: DateTime.parse(data['message']['created_on']));
//     //   print("Last Message Json::::::${lastMsg.toJson()}");
//     //   if(chatController.chatDetails.data!.chat!.id ==data['chat']['_id'] ){
//     //     chatController.onChatMessage(GetMessagesListData.fromJson(data['message']));
//     //     chatController.messageTextConrtoller.clear();
//     //   }
//     //   chatController.onChatUserMessage(GetUsersChatListData.fromJson(data['chat']),LastMessage.fromJson(lastMsg.toJson()));
//     //   chatController.update();
//     //   // chatController.messagesList.add(GetMessagesListData.fromJson(data['message']['chat']));
//     //   // chatController.update();
//     //
//     //   debugPrint("Print MSGS cvngng Length:::::::::${chatController.messagesList.last.message}");
//     //
//     //   debugPrint(data);
//     // });
//   }

//   static socketLogout() {
//     socket!.disconnect();
//   }
// }
