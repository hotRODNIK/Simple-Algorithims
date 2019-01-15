/* Programmer Name: hotRODNIK
 * Class Name: Fraction
 * Program Description: This class provides all the necessary tools to work with fractions
 * Instance Variables List: 
 * numerator - int which holds the fraction's numerator
 * denominator - int which holds the fraction's denominator
 */

using System;
public class Fraction
{
    // Numerator and Denominator Fields
    private int numerator;
    private int denominator;

    // No-arg constructor
    public Fraction()
    {
        Numerator = 1;
        Denominator = 1;
        Reduce(Numerator, Denominator);
    }

    // Two-arg constructor
    public Fraction(int num, int denom)
    {
        Numerator = num;
        Denominator = denom;
        Reduce(Numerator, Denominator);
    }

    // Numerator property
    public int Numerator
    {
        get
        {
            return numerator;
        }
        set
        {
            if (value > 0)
                numerator = value;
            else
                numerator = 1; 
        }
    }

    // Denominator property
    public int Denominator
    {
        get
        {
            return denominator;
        }
        set 
        {
            if (value > 0)
                denominator = value;
            else
                denominator = 1;
        }
    }

    // Fraction Reduction Method
    private void Reduce(int num, int denom)
    {
        // Declaring variables
        bool isFound = false;
        int gcf = 0;

        // Check if the numerator is smaller than the denominator, they are equal or numerator is larger
        if (num < denom)
        {
            // Start at the numerator and work backwards
            for (int i = num; i > 0 && !isFound; --i)
            {
                // If the modulo of the numerator and the denominator equal zero, signal the discovery of the gcf
                if (num % i == 0 && denom % i == 0)
                {
                    gcf = i;
                    isFound = true;
                }
            }
        }
        else if (num > denom)
        {
            // Start at the denominator and work backwards   
            for (int i = denom; i > 0 && !isFound; --i)
            {
                // If the modulo of the numerator and the denominator equal zero, signal the discovery of the gcf
                if (denom % i == 0 && num % i == 0)
                {
                    gcf = i;
                    isFound = true;
                }
            }
        }
        // If the numerator and the denominator are the same, set the gcf equal to one of the terms 
        else if (num == denom)
            gcf = num;

        // If the gcf is >0, reduce
        if (gcf > 0)
        {
            Numerator = num / gcf;
            Denominator = denom / gcf;
        }
    }

    // Overridden ToString method
    public override string ToString()
    {
        string top, bottom;
        top = Convert.ToString(this.Numerator);
        bottom = Convert.ToString(this.Denominator);
        return top + "/" + bottom;
    }

    // * operator
    public static Fraction operator *(Fraction fract1, Fraction fract2)
    {
        Fraction fract3 = new Fraction();
        fract3.Numerator = fract1.Numerator * fract2.Numerator;
        fract3.Denominator = fract1.Denominator * fract2.Denominator;
        fract3.Reduce(fract3.Numerator, fract3.Denominator);
        return fract3;
    }
    
    // + operator
    public static Fraction operator +(Fraction fract1, Fraction fract2)
    {
        int numOne, numTwo, denom;
        Fraction fract3 = new Fraction();
        numOne = (fract1.Numerator * fract2.Denominator);
        numTwo = (fract2.Numerator * fract1.Denominator);
        denom = (fract1.Denominator * fract2.Denominator);
        fract3.Numerator = numOne + numTwo;
        fract3.Denominator = denom;
        fract3.Reduce(fract3.Numerator, fract3.Denominator);
        return fract3;
    }
    
    // >= operator
    public static bool operator >=(Fraction fract1, Fraction fract2)
    {
        double frac1, frac2;
        frac1 = fract1.Numerator / (double)fract1.Denominator;
        frac2 = fract2.Numerator / (double)fract2.Denominator;
        if (frac1 >= frac2)
            return true;
        else
            return false;
    }
    
    // <= operator
    public static bool operator <=(Fraction fract1, Fraction fract2)
    {
        double frac1, frac2;
        frac1 = fract1.Numerator / (double)fract1.Denominator;
        frac2 = fract2.Numerator / (double)fract2.Denominator;

        if (frac1 <= frac2)
            return true;
        else 
            return false;
    }
}
