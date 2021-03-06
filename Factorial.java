/*
 * Programmer Name: hotRODNIK
 * Program Description: Simple Yet Effective and/or Elegant Factorial Solver
 * Warning: This program uses recursion => stack overflow errors may occur... use at your own risk and/or with dilligence 
 */
 
package recursive.factorial.solver;

/**
 *
 * @author hotRODNIK
 */

import java.util.Scanner;

public class RecursiveFactorialSolver {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int number, factorial;
        Scanner sc = new Scanner(System.in);
        
        System.out.print("Enter a number to take the factorial of --> ");
        number = sc.nextInt();
        factorial = Factorial(number);
        
        System.out.println("The factorial of " + number + " is " + factorial);
    }
    
    public static int Factorial(int num){
        if (num == 0)
            return 1;
        else
            return num * Factorial(num - 1);
    }
}
