#!/usr/bin/perl -w
use strict;

#Eliminar User's.

if(@ARGV!=1){     
 	die("\nDeve inserir um argumento!\n\n"); 
}


if(! -f $ARGV[0]){
	die("Erro - Argumento não é ficheiro\n");
}

my @fich = `cat $ARGV[0]`;
chomp(@fich);

foreach my $it (@fich){
	my @tmp = split (/:/,$it);
	
	`userdel  $tmp[0]`
}

