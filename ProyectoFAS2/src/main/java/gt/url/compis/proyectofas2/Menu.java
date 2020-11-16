/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gt.url.compis.proyectofas2;

//import static gt.url.compis.proyectofas1.Main.Escribir;

//import static gt.url.compis.proyectofas1.Main.convertStringArrayToString;
import java.awt.Graphics;
import java.awt.Image;
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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextArea;

/**
 *
 * @author Charly Ponce
 */
public class Menu extends javax.swing.JFrame {

    /**
     * Creates new form FrmPrincipal
     */
    public Menu() {

        initComponents();
        txtResultado.setLineWrap(true);
        txtResultado.setWrapStyleWord(true);
        this.setLocationRelativeTo(null);
    }

    public static String PreguntaSiNo(String strMensaje) {
        int seleccion = JOptionPane.showOptionDialog(
                null,
                strMensaje,
                "Seleccione una opción",
                JOptionPane.YES_NO_CANCEL_OPTION,
                JOptionPane.QUESTION_MESSAGE,
                null,
                new Object[]{"Si", "No"},
                "Si");

        if (seleccion != -1) {
            if ((seleccion + 1) == 1) {
                return "SI";
            } else {
                return "NO";
            }
        }
        return null;
    }

    public void Escribir(String texto) throws IOException {

        File archivo;
        FileWriter escribir;
        PrintWriter linea;
        archivo = new File("codigo.txt");
        if (!archivo.exists()) {
            try {
                archivo.createNewFile();
                escribir = new FileWriter(archivo, true);
                linea = new PrintWriter(escribir);
                linea.println(texto);
                linea.close();
                escribir.close();
            } catch (Exception e) {
            }

        } else {
            try {
                escribir = new FileWriter(archivo, true);
                linea = new PrintWriter(escribir);
                linea.println(texto);
                linea.close();
                escribir.close();
            } catch (Exception e) {
            }

        }
    }

    public void Escribir2(String texto) throws IOException {

        File archivo;
        FileWriter escribir;
        PrintWriter linea;
        archivo = new File("tablaGraf.txt");
        if (!archivo.exists()) {
            try {
                archivo.createNewFile();
                escribir = new FileWriter(archivo, true);
                linea = new PrintWriter(escribir);
                linea.println(texto);
                linea.close();
                escribir.close();
            } catch (Exception e) {
            }

        } else {
            try {
                escribir = new FileWriter(archivo, true);
                linea = new PrintWriter(escribir);
                linea.println(texto);
                linea.close();
                escribir.close();
            } catch (Exception e) {
            }

        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnAnalizar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtResultado = new javax.swing.JTextArea();
        btnAnalizar1 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnAnalizar.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        btnAnalizar.setText("Analizar");
        btnAnalizar.setToolTipText("Seleccionar y Analizar archivo");
        btnAnalizar.setBorder(new javax.swing.border.MatteBorder(null));
        btnAnalizar.setContentAreaFilled(false);
        btnAnalizar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnAnalizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarActionPerformed(evt);
            }
        });
        getContentPane().add(btnAnalizar, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 340, 150, 50));

        txtResultado.setColumns(20);
        txtResultado.setRows(5);
        jScrollPane1.setViewportView(txtResultado);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(12, 15, 940, 290));

        btnAnalizar1.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        btnAnalizar1.setText("Mostrar");
        btnAnalizar1.setToolTipText("Ver tabla");
        btnAnalizar1.setBorder(new javax.swing.border.MatteBorder(null));
        btnAnalizar1.setContentAreaFilled(false);
        btnAnalizar1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnAnalizar1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizar1ActionPerformed(evt);
            }
        });
        getContentPane().add(btnAnalizar1, new org.netbeans.lib.awtextra.AbsoluteConstraints(590, 340, 150, 50));

        jLabel1.setBackground(new java.awt.Color(0, 204, 255));
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(-10, 10, 970, 430));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnAnalizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarActionPerformed
        // TODO add your handling code here  

       
        
       


    }//GEN-LAST:event_btnAnalizarActionPerformed

    private void btnAnalizar1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizar1ActionPerformed
        File archivo = new File("tablaGraf.txt");
        txtResultado.setText(null);
        try {
            BufferedReader leer = new BufferedReader(new FileReader(archivo));
            try {
                String linea = leer.readLine();
                while (linea != null) {
                    txtResultado.append(linea + "\n");
                    linea = leer.readLine();
                }
            } catch (IOException ex) {
                Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }


    }//GEN-LAST:event_btnAnalizar1ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Menu().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAnalizar;
    private javax.swing.JButton btnAnalizar1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea txtResultado;
    // End of variables declaration//GEN-END:variables

}
