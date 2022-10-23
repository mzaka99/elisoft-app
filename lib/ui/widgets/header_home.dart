import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth_cubit.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final user = context.select((AuthCubit data) => data.dataUser);
      return SizedBox(
        height: 25,
        child: RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            children: [
              const TextSpan(
                text: 'Welcome, ',
              ),
              TextSpan(
                text: user!.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
