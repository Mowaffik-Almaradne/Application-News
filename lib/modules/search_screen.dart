// ignore_for_file: must_be_immutable, missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/components/artical_builder.dart';
import 'package:news_application/shared/cubit_pages.dart';
import 'package:news_application/shared/states_pages.dart';

import '../components/custom_text_filed.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextFiled(
                  prefixIcon: Icons.search,
                  label: 'Search ',
                  inputText: TextInputType.text,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'search most be not empaty';
                    }
                    return null;
                  },
                  onChange: (value) {
                    NewsCubit.get(context).getSearch(value!);
                  },
                  controller: textController,
                ),
              ),
              Expanded(child: ArticalBuilder(list, context, isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
