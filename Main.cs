using System;
public static class PrimalityChecker
{
    public static void Main()
    {
        bool prime = false;
        string input = "";
        ulong num;

        while (input.ToUpper() != "Q")
        {
            try
            {
                Console.WriteLine("Welcome to Nick's Factorizer/Primality Checker");
                Console.WriteLine("'F'ind Factors, 'T'est Primality or 'Q'uit");
                input = Console.ReadLine();
                input = input.ToUpper();

                switch (input)
                {
                    case "Q":
                        break;
                    case "F":
                        Console.WriteLine("Please enter a natural number to find the factors of => ");
                        num = Convert.ToUInt64(Console.ReadLine());
                        Console.WriteLine("Factors of {0}", num);

                        for (ulong i = 1; i <= num; i++)
                        {
                            if (num % i == 0)
                                Console.WriteLine(i);
                        }
                        break;
                    case "T":
                        Console.WriteLine("Please enter a natural number to test primality of => ");
                        num = Convert.ToUInt64(Console.ReadLine());
                        prime = false;

                        for (ulong i = 1; i <= Math.Ceiling(Math.Sqrt(num)); i++)
                        {
                            if (num % i == 0)
                            {
                                if (i != 1)
                                {
                                    prime = true;
                                    break;
                                }
                            }
                        }

                        if (!prime)
                            Console.WriteLine("{0} is a prime number", num);
                        else
                            Console.WriteLine("{0} is not a prime number", num);
                        break;
                    default:
                        Console.WriteLine("Invalid input");
                        break;
                }
            }
            catch (FormatException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        Console.WriteLine("End of program, press any key to continue..............");
        Console.ReadKey();
    }
}