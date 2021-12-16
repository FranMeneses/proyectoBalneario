package logica;

import java.util.Scanner;

public class App {
    private static Balneario sistema = new BalnearioImpl();
    public static void main(String[] args) throws Exception {
        Scanner teclado = new Scanner(System.in);
		//se implementa un pequeño menu de 3 opciones
		boolean salir = false;
		while(!salir) {
			sistema.imprimirMenu();
			String n = teclado.nextLine();			
			while(!n.equals("OP1") && !n.equals("OP2") && !n.equals("OP3")){
				System.out.println("Ingrese la opción correcta");
				sistema.imprimirMenu();
				n = teclado.nextLine();
			}
        }
        teclado.close();
    }//Fin del Main
}
