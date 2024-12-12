import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/questions_cubit.dart';
import '../services/questions.dart';
import 'home_page.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuestionsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Empréstimos'),
        ),
        body: BlocBuilder<QuestionsCubit, int>(
          builder: (context, pageIndex) {
            final start = pageIndex * 5;
            final end =
                (start + 5 > questions.length) ? questions.length : start + 5;
            final pageQuestions = questions.sublist(start, end);

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: Text(
                      "Precisamos de algumas infromações para personalizar mais ofertas para você."),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(18),
                    itemCount: pageQuestions.length,
                    itemBuilder: (context, index) {
                      final question = pageQuestions[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8, top: 8),
                        child: buildQuestionField(context, question),
                      );
                    },
                  ),
                ),
                buildPagination(context, pageIndex),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _showSubmissionDialog(context);
                  },
                  child: Text('Simular'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildQuestionField(
      BuildContext context, Map<String, dynamic> question) {
    switch (question['type']) {
      case 1:
        return TextFormField(
          decoration: InputDecoration(
              labelText: question['name'], border: OutlineInputBorder()),
        );
      case 2:
        TextEditingController dateController =
            TextEditingController(text: question['value'] ?? '');

        return TextFormField(
          decoration: InputDecoration(
            labelText: question['name'],
          ),
          controller: dateController,
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('dd/MM/yyyy').format(pickedDate);
              dateController.text = formattedDate;
            }
          },
        );
      case 3:
        return TextFormField(
          decoration: InputDecoration(
              labelText: question['name'], border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
        );
      case 4:
        return TextFormField(
          decoration: InputDecoration(
              labelText: question['name'],
              prefixText: 'R\$ ',
              border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
        );
      case 5:
        return DropdownButtonFormField<String>(
          value: question['value'],
          items: (question['optionsList'] as List<dynamic>)
              .map((option) => DropdownMenuItem<String>(
                    value: option['id'].toString(),
                    child: Text(option['name']),
                  ))
              .toList(),
          onChanged: (value) {},
          decoration: InputDecoration(
              labelText: question['name'], border: OutlineInputBorder()),
        );
      default:
        return Container();
    }
  }

  Widget buildPagination(BuildContext context, int pageIndex) {
    final totalPages = (questions.length / 5).ceil();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: GestureDetector(
            onTap: () {
              context.read<QuestionsCubit>().setPage(index);
            },
            child: CircleAvatar(
              backgroundColor:
                  pageIndex == index ? Colors.deepPurple : Colors.grey[300],
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: pageIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void _showSubmissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Simulação Enviada'),
        content:
            Text('Recebemos seus dados, retornaremos com as melhores ofertas.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (Route<dynamic> route) => false,
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}