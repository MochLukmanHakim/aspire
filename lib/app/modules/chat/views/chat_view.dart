import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ENUM MessageType
enum MessageType { text, audio }

// MODEL Message
class Message {
  final String content;
  final bool isMine;
  final MessageType type;
  final DateTime timestamp;

  Message({
    required this.content,
    required this.isMine,
    required this.type,
    required this.timestamp,
  });
}

// CONTROLLER
class ChatController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final RxList<Message> messages = <Message>[].obs;
  final RxBool hasText = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialMessages();
    textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    hasText.value = textController.text.trim().isNotEmpty;
  }

  void _loadInitialMessages() {
    messages.addAll([
      Message(
        content: 'Hi, Apakah Ada yang bisa dibantu',
        isMine: false,
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      Message(
        content: 'lorem',
        isMine: true,
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
      ),
      Message(
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada',
        isMine: false,
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      ),
      Message(
        content: 'audio',
        isMine: false,
        type: MessageType.audio,
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      Message(
        content: 'audio',
        isMine: true,
        type: MessageType.audio,
        timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      ),
      Message(
        content: 'Cihuyyyyyyyyy',
        isMine: true,
        type: MessageType.text,
        timestamp: DateTime.now(),
      ),
    ]);
  }

  void sendMessage() {
    if (textController.text.trim().isNotEmpty) {
      messages.add(Message(
        content: textController.text.trim(),
        isMine: true,
        type: MessageType.text,
        timestamp: DateTime.now(),
      ));
      textController.clear();
    }
  }

  void recordAudio() {
    // Implementasi record audio
    print('Recording audio...');
  }

  @override
  void onClose() {
    textController.removeListener(_onTextChanged);
    textController.dispose();
    super.onClose();
  }
}

// VIEW
class ChatView extends StatelessWidget {
  ChatView({Key? key}) : super(key: key);

  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 97, 97, 97).withOpacity(0.1), // warna bayangan
                spreadRadius: 1, // sebaran bayangan
                blurRadius: 3,   // seberapa blur
                offset: const Offset(0, 1), // posisi bayangan (x, y)
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // menghilangkan shadow default
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2A6352)),
              onPressed: () => Get.back(),
            ),
            title: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/konselor1.png'),
                    radius: 18,
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bpk. Rahmat S.Pd',
                        style: TextStyle(
                          color: Color(0xFF2A6352),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF64B6AC),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Online',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9FFF8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.phone,
                    color: Color(0xFF2A6352),
                    size: 20,
                  ),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  itemCount: controller.messages.length + 1, // +1 untuk date divider
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      // Date divider di posisi pertama
                      return _buildDateDivider();
                    }
                    final message = controller.messages[index - 1]; // -1 karena date divider
                    return _buildMessageItem(message);
                  },
                )),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildDateDivider() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            DateFormat('dd MMM yyyy').format(DateTime.now()),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageItem(Message message) {
    final isMe = message.isMine;

    if (message.type == MessageType.text) {
      return Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isMe ? const Color(0xFF2A6352) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(18),
                    topRight: const Radius.circular(18),
                    bottomLeft: Radius.circular(isMe ? 18 : 4),
                    bottomRight: Radius.circular(isMe ? 4 : 18),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.75,
                ),
                child: Text(
                  message.content,
                  style: TextStyle(
                    fontSize: 15,
                    color: isMe ? Colors.white : const Color(0xFF2A6352),
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                DateFormat('HH:mm').format(message.timestamp),
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    } else if (message.type == MessageType.audio) {
      return Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isMe ? const Color(0xFF2A6352) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(18),
                    topRight: const Radius.circular(18),
                    bottomLeft: Radius.circular(isMe ? 18 : 4),
                    bottomRight: Radius.circular(isMe ? 4 : 18),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.6,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.white.withOpacity(0.2) : const Color(0xFF2A6352).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        size: 18,
                        color: isMe ? Colors.white : const Color(0xFF2A6352),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: isMe ? Colors.white.withOpacity(0.3) : const Color(0xFF2A6352).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '0:15',
                      style: TextStyle(
                        fontSize: 12,
                        color: isMe ? Colors.white : const Color(0xFF2A6352),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                DateFormat('HH:mm').format(message.timestamp),
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFFD9FFF8),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.grey[600],
                      size: 22,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller.textController,
                      decoration: const InputDecoration(
                        hintText: 'Ketik pesan...',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF2A6352),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.attach_file,
                      color: Colors.grey[600],
                      size: 22,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Obx(() => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A6352),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2A6352).withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      controller.hasText.value ? Icons.send : Icons.mic,
                      key: ValueKey(controller.hasText.value),
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  onPressed: controller.hasText.value 
                      ? controller.sendMessage 
                      : controller.recordAudio,
                ),
              )),
        ],
      ),
    );
  }
}