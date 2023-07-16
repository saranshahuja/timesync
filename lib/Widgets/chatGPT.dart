import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatGPT {
  final String _apiKey = 'YOUR_OPENAI_API_KEY';

  Future<String> getTaskDetails(String task) async {
    var url = Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions');

    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'prompt': 'Generate a detailed description for the task: "$task"',
        'max_tokens': 150,
      }),
    );

    var data = jsonDecode(response.body);
    return data['choices'][0]['text'].trim();
  }
  Future<Map<String, dynamic>> parseMeetingCommand(String command) async {
    var url = Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions');

    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'prompt': 'Extract the action and the person involved from the following command: "$command"',
        'max_tokens': 60,
      }),
    );

    var data = jsonDecode(response.body);
    String extractedInfo = data['choices'][0]['text'].trim();

    // TODO: parse extractedInfo into a more structured format
    // This will depend on how you expect the GPT model to format its output
    // For simplicity, let's assume it returns "Action: ..., Person: ..."

    var parts = extractedInfo.split(', ');
    var action = parts[0].split(': ')[1];
    var person = parts[1].split(': ')[1];

    return {'action': action, 'person': person};}
}
