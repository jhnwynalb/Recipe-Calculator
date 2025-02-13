import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //2
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //3
      body: SafeArea(
          // TODO: Replace child: Container()
          child: ListView.builder(
        //5
        itemCount: Recipe.samples.length,
        //6
        itemBuilder: (BuildContext context, int index) {
          //7
          return GestureDetector(
            //8
            onTap: () {
              //9
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    //10
                    //TODO: Replace return with return RecipeDetail()
                    return RecipeDetail(recipe: Recipe.samples[index]);
                  },
                ),
              );
            },
            //11
            child: buildRecipeCard(Recipe.samples[index]),
          );
        },
      )),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    //1
    return Card(
      elevation: 2.0,
      //2
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        //4
        child: Column(
          children: [
            Image(image: AssetImage(recipe.imageUrl)),
            //5
            const SizedBox(height: 14.0),
            //6
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}
