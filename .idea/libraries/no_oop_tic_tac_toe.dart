import 'dart:io';

void main() {
  int continuarJogo = 0;
  List<List<String>> matrice = [
    ['-', '-', '-'],
    ['-', '-', '-'],
    ['-', '-', '-']
  ];

  print('Iniciado jogo\n');
  print('  0 1 2');
  for (int linha = 0; linha < 3; linha++) {
    int coluna = 0;
    print('$linha ' +
        matrice[linha][coluna] +
        ' ' +
        matrice[linha][coluna + 1] +
        ' ' +
        matrice[linha][coluna + 2]);
  }
  do {
    print('Digite a linha:');
    String? coletarLinha = stdin.readLineSync();

    print('Digite a coluna:');
    String? coletarColuna = stdin.readLineSync();
    print('Digite X ou 0:');
    String? coletarEscolha = stdin.readLineSync();

    int linha = int.parse(coletarLinha!);
    int coluna = int.parse(coletarColuna!);

    matrice[linha][coluna] = coletarEscolha!.toUpperCase();

    print('matriz depois da escolha:\n');

    print('  0 1 2');
    for (int linha = 0; linha < 3; linha++) {
      int coluna = 0;
      print('$linha ' +
          matrice[linha][coluna] +
          ' ' +
          matrice[linha][coluna + 1] +
          ' ' +
          matrice[linha][coluna + 2]);
    }
    for (int resultadosPossiveis = 0;
    resultadosPossiveis < 8;
    resultadosPossiveis++) {
      String? resultado = null;
      switch (resultadosPossiveis) {
        case 0:
          resultado = matrice[0][0] + matrice[0][1] + matrice[0][2];
          break;
        case 1:
          resultado = matrice[1][0] + matrice[1][1] + matrice[1][2];
          break;
        case 2:
          resultado = matrice[2][0] + matrice[2][1] + matrice[2][2];
          break;
        case 3:
          resultado = matrice[0][0] + matrice[1][0] + matrice[2][0];
          break;
        case 4:
          resultado = matrice[0][1] + matrice[1][1] + matrice[2][1];
          break;
        case 5:
          resultado = matrice[0][2] + matrice[1][2] + matrice[2][2];
          break;
        case 6:
          resultado = matrice[0][0] + matrice[1][1] + matrice[2][2];
          break;
        case 7:
          resultado = matrice[0][2] + matrice[1][1] + matrice[2][0];
          break;
      }
      if (resultado == 'XXX') {
        print('Jogador X foi o vencedor!!');
        return null;
      }
      if (resultado == 'OOO') {
        print('Jogador O foi o vencedor!!');
        return null;
      }
      if (resultadosPossiveis == 8) {
        print('EMPATE!!');
        return null;
      }
    }
    print('Continuar jogo? 0 para não, 1 para sim');
    String? coletarContinuar = stdin.readLineSync();
    continuarJogo = int.parse(coletarContinuar!);
    do {
      if (continuarJogo > 1 || continuarJogo < 0) {
        print('Numero incorreto. 0 para não, 1 para sim');
        String? coletarContinuar = stdin.readLineSync();
        continuarJogo = int.parse(coletarContinuar!);
      }
    } while (continuarJogo > 1 || continuarJogo < 0);
  } while (continuarJogo == 1);
}

