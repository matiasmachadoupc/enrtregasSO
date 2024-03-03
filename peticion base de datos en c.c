//#include <my_global.h> 

#include <mysql.h> 

#include <string.h> 

#include <stdlib.h> 

#include <stdio.h> 

int main(int argc, char **argv) 
	
{ 
	
	MYSQL *conn; 
	
	int err1; 
	int err2; 
	
	// Estructura especial para almacenar resultados de consultas  
	
	MYSQL_RES *resultado1; 
	
	MYSQL_ROW row1; 
	
	
	MYSQL_RES *resultado2; 
	
	MYSQL_ROW row2; 
	
	

	int contador=0;
	
	//Creamos una conexion al servidor MYSQL  
	
	conn = mysql_init(NULL); 
	
	if (conn==NULL) { 
		
		printf ("Error al crear la conexi?n: %u %s\n",  
				
				mysql_errno(conn), mysql_error(conn)); 
		
		exit (1); 
		
	} 
	
	//inicializar la conexin 
	
	conn = mysql_real_connect (conn, "localhost","root", "mysql", "Torneo",0, NULL, 0); 
	
	if (conn==NULL) { 
		
		printf ("Error al inicializar la conexion: %u %s\n",  
				
				mysql_errno(conn), mysql_error(conn)); 
		
		exit (1); 
		
	} 
	int jugador1;
	int jugador2;
	
	// Pregunto los nombre de los dos jugadores 
	
	printf ("Dame el ID de un jugador\n");  
	
	scanf ("%s", jugador1); 
	
	printf ("Dame el ID de otro jugador\n");  
	
	scanf ("%s", jugador2); 
	
	char consulta1[80];
	char consulta2[80];

	strcpy (consulta1,"SELECT Partida.ID FROM Jugador,Partida,participacion WHERE participacion.Jugador.ID=");
	
	strcat(consulta1, jugador1);
	
	strcpy (consulta2,"SELECT Partida.ID FROM Jugador,Partida,participacion WHERE Jugador.Username=");
	
	strcat(consulta2, jugador2);
	

	
	err1=mysql_query (conn, consulta1); 
	
	if (err1!=0) { 
		
		printf ("Error al consultar datos de la base %u %s\n", 
				
				mysql_errno(conn), mysql_error(conn)); 
		
		exit (1); 
		
	} 
	
	err2=mysql_query (conn, consulta2); 
	
	if (err2!=0) { 
		
		printf ("Error al consultar datos de la base %u %s\n", 
				
				mysql_errno(conn), mysql_error(conn)); 
		
		exit (1); 
		
	} 
	
	resultado1 = mysql_store_result (conn);
	
	row1=mysql_fetch_row (resultado1);
	resultado2 = mysql_store_result (conn);
	
	row2=mysql_fetch_row (resultado2);
	
	
	
	if (row1 ==row2) {
		
		contador++;
		row1 = mysql_fetch_row (resultado1); 
		row2 = mysql_fetch_row (resultado2); 
	}
	
	else {
		if(row1 ==NULL){
			printf ("NO se han obtenido datos en la consulta\n");
			if(contador != 0){
				printf("Ambos jugador han jugado juntos un total de partidas equivalente a: %s\n", contador); 
			}
		}
		else{
			row1 = mysql_fetch_row (resultado1); 
			row2 = mysql_fetch_row (resultado2); 
		}
		
	} 

	// Pregunto los nombre de los dos jugadores 

	
		
	mysql_close (conn); 
		
	exit(0); 
		
}
