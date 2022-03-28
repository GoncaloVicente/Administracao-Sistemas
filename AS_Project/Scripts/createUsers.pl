#!/usr/bin/perl -w
use strict;

#Adicionar User's a partir de um argumento(ficheiro).

if(@ARGV!=1){     
 	die("\nDeve inserir um argumento!\n\n"); 
}


if(! -f $ARGV[0]){
	die("Erro - Argumento não é ficheiro\n");
}

my @fich = `cat $ARGV[0]`;
chomp(@fich);

foreach my $i (@fich){
	my @tmp = split (/:/,$i);
	my $pass = $tmp[1];
	
	`useradd $tmp[0] -d /home/$tmp[0] -m -p $pass -s /bin/sh`;
}

