import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/locator_service.dart' as depinjections;
import 'common/app_theme.dart';
import 'feature/product/data/datasources/cart_page_userchange.dart';
import 'feature/product/presentation/bloc/bloc_observer.dart';
import 'feature/home/presentation/bloc/home_bloc.dart';
import 'feature/home/presentation/widgets/bottombar/home_bottombar_widgets.dart';
import 'feature/product/presentation/bloc/product_bloc.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await depinjections.initializeDependencies();

  runApp(
    ChangeNotifierProvider(
      create: (context) => CartDataProvider(), 
      child: const MyApp(), 
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => injection<HomeBloc>()..add(const HomeLoadEvent()),
          ),
          BlocProvider<ProductBloc>(
            create: (context) =>injection<ProductBloc>()..add(const ProductLoadEvent()),
        ),
        ],
        child: MaterialApp(
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          home: const HomeBottomWidget(),
        )
    );
  }
}
