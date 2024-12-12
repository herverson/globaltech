import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Definir altura personalizada
        title: Row(
          children: [
            CircleAvatar(child: Text("EN")), // Avatar
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  suffixIcon: Icon(Icons.search), // Ícone sempre visível
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 6, horizontal: 5), // Ajusta a altura
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
              // Banner
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.grey[300],
                  height: 100,
                  child: Center(child: Text("Banner\nOfertas/Avisos/etc")),
                ),
              ),

              // Última proposta
              Divider(),
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
                              Text("Última proposta",
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.remove_red_eye_sharp)
                            ],
                          ),
                          Chip(label: Text("Estado jornada")),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Home Equity",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("Valor: R\$ ••••",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text("Mais detalhes >"),
                            backgroundColor: Colors.grey[300],
                          ),
                          Text("Data: 10/04/2024",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              // Feito para você - Grid de botões
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
                    buildGridButton("Empréstimos", Icons.monetization_on),
                    buildGridButton("Consórcios", Icons.account_balance),
                    buildGridButton("Financiamentos", Icons.attach_money),
                    buildGridButton("Investimentos", Icons.bar_chart),
                    buildGridButton("Plano de Saúde", Icons.local_hospital),
                    buildGridButton("Seguros", Icons.security),
                    buildGridButton("Outros", Icons.more_horiz),
                    buildGridButton("Promoções", Icons.local_offer),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Sempre mostrar os labels
        backgroundColor: Colors.white, // Cor de fundo
        selectedItemColor: Colors.blue, // Cor do item selecionado
        unselectedItemColor: Colors.grey, // Cor dos itens não selecionados
        items: [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.grey[300], // Cor de fundo do círculo
              child: Icon(Icons.home,
                  color: Colors.black), // Ícone dentro do círculo
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.grey[300], // Cor de fundo do círculo
              child: Icon(Icons.file_copy,
                  color: Colors.black), // Ícone dentro do círculo
            ),
            label: 'Propostas',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.grey[300], // Cor de fundo do círculo
              child: Icon(Icons.local_offer,
                  color: Colors.black), // Ícone dentro do círculo
            ),
            label: 'Promoções',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.grey[300], // Cor de fundo do círculo
              child: Icon(Icons.help,
                  color: Colors.black), // Ícone dentro do círculo
            ),
            label: 'Ajuda',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.grey[300], // Cor de fundo do círculo
              child: Icon(Icons.menu,
                  color: Colors.black), // Ícone dentro do círculo
            ),
            label: 'Menu',
          ),
        ],
      ),
    );
  }

  Widget buildGridButton(String title, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(
            8.0), // Ajuste para adicionar espaçamento dentro do card
        child: Stack(
          children: [
            // Texto no canto inferior esquerdo
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Ícone no canto superior direito
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                icon,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
