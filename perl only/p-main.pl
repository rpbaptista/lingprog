###############################################################################
#* Copyright (C) Renata P. Baptista & Vinicius M. de Pinho - All Rights Reserved
#* Unauthorized copying of this file, via any medium is strictly prohibited
#* Proprietary and confidential
#* Written by: Renata P. Baptista <rpbaptista@poli.ufrj.br
#*             Vinicius M. de Pinho <viniciusmesquita@poli.ufrj.br>
#*
#* November 2016
#*
#* Electronic and Computing Engineering Department (DEL)
#* Polytechnic School (Poli)
#* Federal University of Rio de Janeiro (UFRJ)
#* Course: Programming Languages - 2016.2
# Professor: Miguel Elias Mitre Campista
###############################################################################

#apresenta warnings durante a executcao casa haja pontenciais problemas
use warnings;
#para a excecucao caso haja potenciais problemas
use strict;
use Switch;

our $nomeArquivo = 'bd.txt';
###############################################################################
sub mostraMenu {

  system("clear");

  print ("BEM-VINDO AO SEU GERENCIADOR DE NOTAS FAVORITO.\n");
  print ("Desenvolvido por: Renata Porciuncula e Vinicius Mesquita.");
  print ("\n");
  print ("\n");
  print ("# OPCOES: \n");
  print ("# 1. Ver o arquivo inteiro de banco de dados.\n");
  print ("# 2. Mostrar as materias na base de dados.\n");
  print ("# 3. Sair do programa.\n");
  print (" \n");

  print ("O que queres, humano? Opcao: ");
  my $opcao = <STDIN>;
  chomp $opcao;
  while ($opcao < 1 || $opcao > 3 )
  {
    print ("Digite uma opcao valida.\n");
    print ("O que queres, humano? Opcao: ");
    $opcao = <STDIN>;
    chomp $opcao;
  }
  return $opcao;
}
###############################################################################


###############################################################################
sub lerBancoDeDados {
system("clear");

#abre arquivo
open (my $in, '<:encoding(UTF-8)', $nomeArquivo) or die "Nao foi possivel abrir o arquivo: $!";

#realiza a leitura do arquivo
while (my $row = <$in>) {
  chomp $row;
  print "$row\n";
}
print ("\n");
print ("\n");
print ("Fim do banco de dados.\n");

print ("\n");
print ("Aperte uma tecla para voltar ao menu.\n");
#fechar arquivo
close $in or die "Nao foi possivel fechar o arquivo: $!";
}
###############################################################################

###############################################################################
sub mostrarMaterias {

system("clear");

  #abrir o arquivo
  open (my $in, '<:encoding(UTF-8)', $nomeArquivo) or die "Nao foi possivel abrir o arquivo: $!";
  print ("As materias presentes na base de dados sao: \n");
  my $qtdMaterias = 1;

  print ("\n");

  while (my $row = <$in>) {
    chomp $row;
    #dividr a linha em palavras
    my @all_lines = split /\n/, $row;

    foreach my $line (@all_lines) {
    (my $materia) = $line =~ m/MATERIA:([^s]+)/g;
    if($materia) {
      print  ("   $qtdMaterias. $materia \n");
      $qtdMaterias = $qtdMaterias + 1;
      }
    }
  }
  print ("\n");
  print ("Aperte uma tecla para voltar ao menu.\n");

  #fechar o arquivo
  close $in or die "Nao foi possivel fechar o arquivo: $!";

}
###############################################################################

###############################################################################
sub sairPrograma {

  system("clear");

  print ("\n");
  print ("Voce escolheu sair do programa. \n");
  print ("Adeus!!\n");
  die "\n";
}
###############################################################################






###############################################################################
# main
#mostrando o menu eternamente, ate a pessoa escolher a opcao de sair
while (1) {
my $opcaoRetornada = mostraMenu ();

  switch ($opcaoRetornada) {
    case 1 {
      lerBancoDeDados();
    }
    case 2 {
      mostrarMaterias();
    }
    case 3 {
      sairPrograma ();
    }
  }
  #esperar uma tecla ser apertada
  <STDIN>;
}
###############################################################################
