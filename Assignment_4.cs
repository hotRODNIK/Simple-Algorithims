﻿/* Programmer Name: Nick Eekhof | Trent ID#: 0641711
 * Program Name: Assignment_4
 * Program Description: This program allows a customer to book their seats on AirCanada
 * Variable List: 
 * input - char which holds the user input command
 * seatList - array which holds the occupied seats on the flight
 */ 
using System;
public class AssignFour
{
    public static void Main()
    {
        // Declaring variables
        char input;
        string[] seatList = new string[10];

        // Read in user commands and delegate tasks to the appropriate method
        do
        {
            // Read user input
            Console.Write("Please enter B to book a seat, C to cancel a seat, P to print a seat or Q to quit --> ");
            input = Convert.ToChar(Console.ReadLine());

            // Invoke the method based on user input
            switch (char.ToUpper(input))
            {
                case 'B':
                    Booking(seatList);
                    break;
                case 'C':
                    Cancel(seatList);
                    break;
                case 'P':
                    PrintSeat(seatList);
                    break;
                case 'Q':
                    break;
                default:
                    Console.WriteLine("Please enter a valid command ");
                    break;
            }

        } while (char.ToUpper(input) != 'Q');

        // Holds window open and end program
        Console.Write("End of program......... press any key to continue ");
        Console.ReadKey();
    }

    // Method:       FindEmptySeat
    // Description:  Finds an empty seat
    // Parameters:   seatList: array which is searched
    // Returns:      the index of the empty seat or -1 if not found
    public static int FindEmptySeat(string [] seatList)
    {
        // Declare variables
        int a = 0, index = 0;
        bool found = false;

        // Iterate through the array
        while (!found && a < seatList.Length)
        {
            // Find any empty seats
            if (seatList[a] == null)
            {
                found = true;
                index = a;
            }
            ++a;
        }

        // Return seat location
        if (found)
            return index;
        else
            return -1;
    }

    // Method:       FindCustomerSeat
    // Description:  Finds a customer's seat
    // Parameters:   seatList: array which is searched
    //               customer: name of the customer to find
    // Returns:      the index of the empty seat or -1 if not found
    public static int FindCustomerSeat(string[] seatList, string customer)
    {
        // Declare variables
        int a = 0, index = 0;
        bool found = false;

        // Iterate throught the array
        while (!found && a < seatList.Length)
        {
            // Find customer associated with the seat, if not found return -1
            if (seatList[a] == customer)
            {
                found = true;
                index = a;
            }
            ++a;
        }

        // Return seat associated with customer
        if (found)
            return index;
        else
            return -1;
    }

    // Method:       FindEmptySeat
    // Description:  Books a user's seat
    // Parameters:   seatList: array which is searched
    // Returns:      N/A
    public static void Booking(string [] seatList)
    {
        // Delcare variables
        string name;
        int index;

        // Read in customer name
        Console.Write("Enter customer's name --> ");
        name = Console.ReadLine();

        // Book seat
        index = FindEmptySeat(seatList);
        if (index >= 0)
            seatList[index] = name;
        else
            Console.WriteLine("We're sorry {0}, the plane is currently fully booked at the moment" , name);
    }

    // Method:       Cancel
    // Description:  Cancels a user's seat
    // Parameters:   seatList: array which is searched
    // Returns:      N/A
    public static void Cancel(string [] seatList)
    {
        // Delcare variables
        string name;
        int index;

        // Read in customer name
        Console.Write("Enter customer's name --> ");
        name = Console.ReadLine();

        // Cancel seat
        index = FindCustomerSeat(seatList, name);
        if (index >= 0)
            seatList[index] = null;
        else
            Console.WriteLine("We're sorry {0}, you are not currently booked on this flight", name);
    }

    // Method:       PrintSeat
    // Description:  Prints occupied seats to screen
    // Parameters:   seatList: array which is searched
    // Returns:      N/A
    public static void PrintSeat(string[] seatList)
    {
        // Iterate throught the array
        for (int a = 0; a < seatList.Length; ++a)
        {
            // If index contains a value, print it out
            if (seatList[a] != null)
            {
                Console.Write("Customer name: {0} | SeatNumber : {1}", seatList[a], a);
                Console.WriteLine();
            }
        }
    }

}