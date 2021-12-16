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
            //Switch que contiene las opciones
            switch(n) {
                case "OP1":
                    sistema.registrarUsuario();
                    break;
                case "OP2":
                    if (sistema.iniciarSesion()) {
                        boolean sesion = false;
                        while(!sesion){
                            sistema.menuCliente();
                            String op = teclado.nextLine();

                            while(!op.equals("OP1") && !op.equals("OP2") && !op.equals("OP3") && !op.equals("OP4") && !op.equals("OP5")){
								System.out.println("Ingrese la opción correcta");
								sistema.menuCliente();
								op = teclado.nextLine();
							}

                            switch(op) {
                                case "OP1":
                                    break;
                                case "OP2":
                                    break;
                                case "OP3":
                                    break;
                                case "OP4":
                                    break;
                                case "OP5":
                                    sesion = true;
                                    break;
                            }
                        }
                    } else {
                        System.out.println("Error al iniciar sesion, cliente no encontrado");
                    }
                    break;
                case "OP3":
                    System.out.println("--------------------- Fin Aplicacion ---------------------");
                    salir = true;
                    break;
            }
        }
        teclado.close();
    }//Fin del Main
}
