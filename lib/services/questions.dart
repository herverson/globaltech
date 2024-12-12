final List<Map<String, dynamic>> questions = [
  {"name": "Nome", "type": 1, "value": null},
  {"name": "Documento", "type": 1, "value": null},
  {"name": "E-mail", "type": 1, "value": null},
  {"name": "Telefone", "type": 1, "value": null},
  {"name": "Data de Nascimento", "type": 2, "value": "31/10/  "},
  {
    "name": "GÊNERO",
    "type": 5,
    "value": null, // id.toString(): "120"
    "optionsList": [
      {"id": 120, "name": "MULHER CIS"},
      {"id": 124, "name": "HOMEM CIS"},
      {"id": 125, "name": "MULHER TRANS"},
      {"id": 121, "name": "HOMEM TRANS"},
      {"id": 126, "name": "NÃO BINÁRIO"}
    ]
  },
  {
    "name": "ESTADO CIVIL",
    "type": 5,
    "value": "107", // SOLTEIRO(A)
    "optionsList": [
      {"id": 107, "name": "SOLTEIRO(A)"},
      {"id": 110, "name": "CASADO(A)"},
      {"id": 105, "name": "EM UNIÃO ESTÁVEL"},
      {"id": 108, "name": "DIVORCIADO(A)"},
      {"id": 111, "name": "VIÚVO(A)"},
      {"id": 112, "name": "SEPARADO(A) JUDICIALMENTE"},
      {"id": 106, "name": "SEPARADO(A)"},
      {"id": 109, "name": "DESQUITADO(A)"}
    ]
  },
  {"name": "Valor do empréstimo", "type": 4, "value": "60000.00"},
  {"name": "Número de Parcelas", "type": 3, "value": null},
  {
    "name": "Data vencimento",
    "type": 2,
    "value": "26/01/2025" // Seguir o formato do valor
  },
  {"name": "Nome da mãe", "type": 1, "value": null}
];
