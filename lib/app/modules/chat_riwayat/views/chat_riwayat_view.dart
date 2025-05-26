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

// CONTROLLER untuk Chat Riwayat
class ChatRiwayatController extends GetxController {
  final RxList<Message> messages = <Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadChatHistory();
  }

  void _loadChatHistory() {
    // Simulasi data riwayat chat
    messages.addAll([
      Message(
        content: 'Hi, Apakah Ada yang bisa dibantu',
        isMine: false,
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 5)),
      ),
      Message(
        content: 'Saya ingin berkonsultasi mengenai masalah akademik',
        isMine: true,
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 4)),
      ),
      Message(
        content: 'Baik, silakan ceritakan masalah akademik yang sedang Anda hadapi. Saya siap mendengarkan dan membantu.',
        isMine: false,
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 3)),
      ),
      Message(
        content: 'audio',
        isMine: true,
        type: MessageType.audio,
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 2)),
      ),
      Message(
        content: 'Saya mengerti situasi Anda. Mari kita diskusikan langkah-langkah yang bisa diambil untuk mengatasi masalah ini.',
        isMine: false,
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2, minutes: 1)),
      ),
      Message(
        content: 'Terima kasih atas sarannya, sangat membantu!',
        isMine: true,
        type: MessageType.text,
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
      ),
    ]);
  }

  void startNewConversation() {
    // Navigasi ke halaman chat baru atau panggil fungsi untuk memulai percakapan baru
    Get.back(); // Kembali ke halaman sebelumnya
    // Atau navigasi ke ChatView baru:
    // Get.to(() => ChatView());
    print('Memulai percakapan baru...');
  }
}

// VIEW untuk Chat Riwayat
class ChatRiwayatView extends StatelessWidget {
  ChatRiwayatView({Key? key}) : super(key: key);

  final ChatRiwayatController controller = Get.put(ChatRiwayatController());

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
                color: const Color.fromARGB(255, 97, 97, 97).withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
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
                        'Ibu. Sujiati S.Pd',
                        style: TextStyle(
                          color: Color(0xFF2A6352),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'Riwayat Chat',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Banner info riwayat chat
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFD9FFF8),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF64B6AC).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A6352).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.history,
                    color: Color(0xFF2A6352),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Ini adalah riwayat percakapan Anda sebelumnya',
                    style: TextStyle(
                      color: Color(0xFF2A6352),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.messages.length + 1, // +1 untuk date divider
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _buildDateDivider();
                    }
                    final message = controller.messages[index - 1];
                    return _buildMessageItem(message);
                  },
                )),
          ),
          // Tombol Mulai Percakapan
          _buildStartConversationButton(),
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
            DateFormat('dd MMM yyyy').format(controller.messages.first.timestamp),
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

  Widget _buildStartConversationButton() {
    return Container(
      width: double.infinity,
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
      child: ElevatedButton(
        onPressed: controller.startNewConversation,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2A6352),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0,
          shadowColor: const Color(0xFF2A6352).withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chat_bubble_outline,
                size: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Mulai Percakapan Baru',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}