import 'package:flutter/material.dart';

import 'acte_naissance1.dart';
class Naissance extends StatefulWidget {
  const Naissance({super.key});

  @override
  State<Naissance> createState() => _NaissanceState();
}
enum reponse{OUI,NON}
class _NaissanceState extends State<Naissance> {

  final formkey = GlobalKey<FormState>();

  validationform() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();

      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (_) =>const Naissance1())
      // );
      switch (await showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title:const Text("Etes vous sur d'avoir bien rempli les informations demandees?",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.redAccent),
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SimpleDialogOption(
                  child:const Text("Oui"),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>const Naissance1())
                    );
                  },
                ),
                SimpleDialogOption(
                  child:const Text("Non"),
                  onPressed: (){
                    Navigator.pop(context,reponse.NON);
                  },
                ),
              ],
            )

          ],
        ),
      )
      ){}
      //formkey.currentState!.reset();
    } else {
      debugPrint("Erreur ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Conception de l'acte de naissance",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.only(
              top: 35,right: 35,left: 35
          ),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const Text("Veuillez remplir le formulaire ci-dessous pour concevoir un acte de naissance",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("Nom de l'enfant"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le nom de l'enfant" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("Prenom de l'enfant"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le prenom de l'enfant" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("Sexe de l'enfant"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le sexe de l'enfant" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label:const Text("Date de naissance l'enfant"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer la date de naissance de l'enfant" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("lieu de naissance de l'enfant"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le lieu de naissance de l'enfant" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("Nom du pere"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le nom du pere" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("Lieu de naissance du pere"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer le lieu de naissance du pere" : null,

                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    label: Text("Date de naissance du pere"),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  validator: (val) => val!.isEmpty ? "Entrer la date de naissance du pere" : null,
                  //onSaved: (val) => mail = val!,
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.all(13)
                    ),
                    onPressed: validationform,
                    child:const Text("Suivant",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
