import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/list.dart';
import '../modal/homemodal.dart';
import '../provider/homeprovider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    quoteModelText = QuoteModal.toList(l1: quoteList);
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          scrolledUnderElevation: 0.1,
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: const Icon(
            Icons.account_circle,
            size: 30,
            color: Colors.white,
          ),
          title: const Text(
            'Quotes',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: ListView.builder(
            itemCount: quoteModelText.quoteModelList.length,
            itemBuilder: (context, index) => Card(
              color: Colors.grey[200],
              child: ListTile(
                leading: Text('${index + 1}'),
                title: Text(quoteModelText.quoteModelList[index].quote!),
                subtitle: Text(quoteModelText.quoteModelList[index].author!),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Do you want to delete'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              homeProviderFalse.removeQuoteAtIndex(index);
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Form(
                key: formKey,
                child: AlertDialog(
                  title: const Text('Enter Quote And Author Name'),
                  actions: [
                    inputTextField(label: 'Quote', controller: txtQuote),
                    inputTextField(label: 'Author', controller: txtAuthor),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            bool response = formKey.currentState!.validate();
                            if (response) {
                              homeProviderFalse.addDetailsInProvider();
                              homeProviderFalse.addQuoteInList();
                              Navigator.of(context).pop();
                            }
                            formKey.currentState!.reset();
                          },
                          child: const Text('OK'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  TextFormField inputTextField(
      {required label, required TextEditingController controller}) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required';
        }
        return null;
      },
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
    );
  }
}

GlobalKey<FormState> formKey = GlobalKey();
var txtQuote = TextEditingController();
var txtAuthor = TextEditingController();
QuoteModal quoteModelText = QuoteModal();
