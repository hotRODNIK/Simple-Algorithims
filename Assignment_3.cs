/* Programmer Name: Nick Eekhof | Trent ID#: 0641711
 * Program Description: This program helps a user balance their bank account
 * Date: October 16th 2018
 * Variables List:
 * userI - char which holds user input for menu selection
 * balance - double which holds the user's bank balance
 * amount - double which holds amount user wants to deposit or withdraw
 */

using System;
public class AssignThree
{
    public static void Main()
    {
        // Declaring and intializing variables
        char userI;
        double balance = 0, amount = 0;

        // Welcome statement
        Console.Write("Welcome to the bank balancer. Press enter to continue... ");
        Console.ReadLine();

        // Reads input from the user and calls the appropriate method
        do 
        {
            // Read data command from user
            Console.Write("Please enter W to make a withdrawal, enter D to make a deposit, enter P to print bank balance, or Q to quit --> ");
            userI = Convert.ToChar(Console.ReadLine());

            // Calls methods based on user input
            switch (char.ToUpper(userI))
            {
                case 'W':
                    amount = GetAmount();
                    Withdrawal(amount, ref balance);
                    break;
                case 'D':
                    amount = GetAmount();
                    Deposit(amount, ref balance);
                    break;
                case 'P':
                    Print(balance);
                    break;
                case 'Q':
                    break;
                default:
                    Console.WriteLine("Please enter a valid command ");
                    break;
            }
            
        } while (char.ToUpper(userI) != 'Q');

        // Signals end of program execution
        Console.WriteLine("End of program. Press any key to continue........ ");
        Console.ReadKey();
    }

    /* Method: GetAmount
     * No Parameters
     * Returns value input by the user to be deposited or withdrawn
     */
    public static double GetAmount()
    {
        // Declaring variable
        double input = 0;

        // Reading input from user and chekcing it's not negative
        do 
        {
            Console.Write("Please enter a value to deposit or withdraw --> ");
            input = Convert.ToDouble(Console.ReadLine());
            if (input < 0)
                Console.WriteLine("Please enter a valid value");
        } while (input < 0);
        return input;
    }

    /* Method: Print
    * Parameters
    * balance - double which holds the bank balance
    * Void return type (prints bank balance)
    */
    public static void Print(double balance)
    {
        // Printing balance to the console
        Console.WriteLine("Your bank balance is {0:C}", balance);
    }

    /* Method: Withdrawal
     * Parameters:
     * amount - holds amount to be withdrawn
     * balance - double (call by reference) which holds the bank balance
     * Void return type (calculates balance after withdrawal)
     */
    public static void Withdrawal(double amount, ref double balance)
    {
        // Checks to see if withdrawal will not deplete funds, and if not, calculates new balance
        if ((amount + 1.5) > balance)
            Console.WriteLine("Cannot withdraw this amount. You will deplete your funds :( ");
        else
            balance -= (amount + 1.5);
    }

    /* Method: Deposit
     * Parameters:
     * amount - double which holds amount to be deposited
     * balance - double (call by reference) which holds the bank balance
     * Void return type (calculates new bank balance after deposit)
     */ 
    public static void Deposit(double amount, ref double balance)
    {
        // Computes new balance, and adds bonus if amount deposited > 2000
        if (amount > 2000)
            balance += ((amount * 0.01) + amount);
        else
            balance += amount;
    }
}