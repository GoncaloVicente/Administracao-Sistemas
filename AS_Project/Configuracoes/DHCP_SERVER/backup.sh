#!/bin/bash
##############################
#
# Backup de Ficheiros
#
##############################
#Pastas e Ficheiro para fazer Backup (separado por espaços)
backup_files="/Backups"
#Nome para o ficheiro de Backup
daySemana=$(date +%A) dayDia=$(date +%F) dayHoras=$(date +%R) 
hostname=$(hostname -s) 
fileName="Backup-$hostname-$daySemana-$dayDia-$dayHoras.tgz"
#MENSAGEM: Inicio do Backup
echo "A INICIAR: Backup de: $backup_files"
#echo
logger -i -s -p info -t 'Backup' "Inicio do Backup!"
#Criação do Ficheiro .TAR e envio por SSH para outra máquina.
tar -cvpz $backup_files | ssh ubuntu@10.10.30.10 -p 2221 "(cat > /home/ubuntu/Central_Backups/DHCP_SERVER/$fileName.tar.gz)"
#MENSAGEM: Fim de Backup.
echo "Backup terminado com sucesso" echo "Realizado a:"
#Data
logger -i -s -p info -t 'Backup' "Backup executado com sucesso!"
