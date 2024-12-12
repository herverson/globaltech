import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> banners = [
      {
        'title': 'Ofertas Especiais',
        'description': 'Aproveite as melhores ofertas',
      },
      {
        'title': 'Avisos Importantes',
        'description': 'Novidades e atualizações',
      },
      {
        'title': 'Serviços',
        'description': 'Confira nossos serviços',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          children: [
            CircleAvatar(child: Text("EN")),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  suffixIcon: Icon(Icons.search, color: Colors.blueAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(child: Icon(Icons.notifications)),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    final banner = banners[index];
                    return Padding(
                      padding: const EdgeInsets.all(18),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: Colors.deepPurpleAccent,
                        child: Container(
                          width: 300,
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(Icons.image, size: 40, color: Colors.white),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    banner['title'] ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white, // Texto branco
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    banner['description'] ?? '',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Divider(),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Última proposta",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.remove_red_eye_sharp),
                            ],
                          ),
                          Chip(
                            label: Text("Estado jornada"),
                            backgroundColor: Colors.blueAccent[100],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Home Equity",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent[700],
                            ),
                          ),
                          Text(
                            "Valor: R\$ ••••",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text("Mais detalhes >"),
                            backgroundColor: Colors.greenAccent[100],
                          ),
                          Text(
                            "Data: 10/04/2024",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Divider(),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Feito para você",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 2.0,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/questions');
                      },
                      child: buildGridButton("Empréstimos",
                          Icons.monetization_on, Colors.tealAccent[400]),
                    ),
                    buildGridButton("Consórcios", Icons.account_balance,
                        Colors.purpleAccent),
                    buildGridButton("Financiamentos", Icons.attach_money,
                        Colors.orangeAccent),
                    buildGridButton(
                        "Investimentos", Icons.bar_chart, Colors.greenAccent),
                    buildGridButton("Plano de Saúde", Icons.local_hospital,
                        Colors.redAccent),
                    buildGridButton(
                        "Seguros", Icons.security, Colors.blueAccent),
                    buildGridButton(
                        "Outros", Icons.more_horiz, Colors.pinkAccent),
                    buildGridButton(
                        "Promoções", Icons.local_offer, Colors.amber),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey[50],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.blueAccent[100],
              child: Icon(Icons.home, color: Colors.black),
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.blueAccent[100],
              child: Icon(Icons.file_copy, color: Colors.black),
            ),
            label: 'Propostas Contratos',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.blueAccent[100],
              child: Icon(Icons.local_offer, color: Colors.black),
            ),
            label: 'Promoções',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.blueAccent[100],
              child: Icon(Icons.help, color: Colors.black),
            ),
            label: 'Ajuda',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.blueAccent[100],
              child: Icon(Icons.menu, color: Colors.black),
            ),
            label: 'Menu',
          ),
        ],
      ),
    );
  }

  Widget buildGridButton(String title, IconData icon, Color? color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
