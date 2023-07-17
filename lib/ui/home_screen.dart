import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie_app/ui/widgets/custom_app_bar.dart';
import 'package:foodie_app/ui/widgets/food_card.dart';
import '../blocs/product_bloc.dart';
import '../core/constant/constant/svg_path.dart';
import '../core/models/app_state.dart';
import '../core/models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),
      appBar: CustomAppBar(
        leading: SizedBox(
          height: 30,
          width: 30,
          child: SvgPicture.asset(SvgPath.parralelLogo, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: SvgPicture.asset(SvgPath.shoppingCart),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 40),
            child: const Text(
              "Delicious \nfood for you",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 28),
          Container(
            margin: const EdgeInsets.only(left: 40, right: 30),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xffEFEEEE),
                filled: true,
                hintText: "Search",
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 12),
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        "assets/svgs/search.svg",
                        fit: BoxFit.fitWidth,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          DefaultTabController(
            length: 4,
            child: TabBar(
              isScrollable: true,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 3,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              tabs: const [
                Tab(text: "Food"),
                Tab(text: "Drinks"),
                Tab(text: "Snacks"),
                Tab(text: "Sauce"),
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Expanded(child: ProductListView())
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: const IconThemeData(color: Color(0xFF4DAB95)),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Theme.of(context).primaryColor,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: Color(0xffADADAF),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgPath.userLogo,
              color: const Color(0xffADADAF),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Color(0xffADADAF),
            ),
            label: '',
          ),
        ],
        onTap: (_) {},
      ),
    );
  }
}

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});
  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, AppState<Product>>(
      listener: (context, state) {
        if (state is FailureAppState<Product>) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$state"),
            backgroundColor: Colors.red,
          ));
        }
      }, // show snackbars, perform actions here.
      builder: (context, state) {
        if (state is LoadingAppState<Product>) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SuccessListAppState<Product>) {
          return ListView.builder(
            itemCount: state.data.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: FoodCard(
                product: state.data[index],
              ),
            ),
          );
        }

        return const Center(child: Text("No product available"));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProductBloc>().add(FetchProductEvent());
    });
  }
}
