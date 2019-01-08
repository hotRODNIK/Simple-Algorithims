using System;
public static class Determinant
{
    public static void Main()
    {
        // Creation of matrix
        int determinant;
        int [,] det = new int [3,3];
        det[0, 0] = 1;
        det[0, 1] = 3;
        det[0, 2] = 5;
        det[1, 0] = 2;
        det[1, 1] = 4;
        det[1, 2] = 6;
        det[2, 0] = 3;
        det[2, 1] = 5;
        det[2, 2] = 9;

        // Expand along row 1
        int[,] minorOne = new int[2, 2];
        minorOne[0,0] = det [1,1];
        minorOne[0,1] = det [1,2];
        minorOne [1,0] = det [2,1];
        minorOne[1, 1] = det[2, 2];

        int[,] minorTwo = new int[2, 2];
        minorTwo[0, 0] = det[1, 0];
        minorTwo[0, 1] = det[1, 2];
        minorTwo[1, 0] = det[2, 0];
        minorTwo[1, 1] = det[2, 2];

        int[,] minorThree = new int[2, 2];
        minorThree[0, 0] = det[1, 0];
        minorThree[0, 1] = det[1, 1];
        minorThree[1, 0] = det[2,0];
        minorThree[1, 1] = det[2, 1];

        // Calculuate the determiniant with LaPlace Expansion
         determinant = det[0, 0] * ((minorOne[0, 0] * minorOne[1, 1]) - (minorOne[0, 1] * minorOne[1, 0])) - det[0, 1] * ((minorTwo[0, 0] * minorTwo[1, 1]) - (minorTwo[0, 1] * minorTwo[1, 0])) + det[0, 2] * ((minorThree[0, 0] * minorThree[1, 1]) - (minorThree[0, 1] * minorThree[1, 0]));
        
        // Print out determinant
         if (determinant != 0)
             Console.Write("The determinant of this 3x3 matrix is {0}. This matrix is invertible :)", determinant);
         else
             Console.Write("The determinant of this 3x3 matrix is {0}. This matrix isn't invertible :(", determinant);

         Console.ReadKey();
    }
}