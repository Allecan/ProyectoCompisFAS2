/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gt.url.compis.proyectofas2;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.Arrays;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main {

    public static void main(String[] args) throws IOException {
        String codigo = "";
        codigo = args[0];
        try {
            Lexico lex = new Lexico(new FileReader(codigo));
            Sintactico sint = new Sintactico(lex);
            String s = sint.parse().toString();
            if (s.contains("#0")) {
                System.out.println("COMPILACION EXITOSA");
            } else {
                System.out.println("COMPILACION FALLIDA, REVISE");
            }

        } catch (FileNotFoundException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
//            System.out.println("COMPILACION FALLIDA, REVISE");
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
