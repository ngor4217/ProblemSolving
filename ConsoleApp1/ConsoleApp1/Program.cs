/*
 * You work at a bank, and you have been asked to produce a system that takes a numerical
   monetary value in dollars and cents and produces its English equivalent — so that it can be
   printed on a physical paper receipt.
   The user should be able to enter a dollars and cents amount (no currency symbols or commas are
   required for the input) that is less than 2 billion dollars, i.e., a number between zero and 2 billion with
   two decimal places.
   The application will output the English words that express the number as a string of words(dollars
   and cents). The program should encode words exactly as you would say them inreading out the
   monetary amount.
   For example, if the user enters 1357256.32 then the program should convert that number to
   a string:
   one million, three hundred and fifty seven thousand, two hundred and fifty six
   DOLLARS AND thirty two CENTS 
 */
Console.WriteLine(new MoneyToEnglishSolver().MoneyToEnglish(123.44));
Console.WriteLine(new MoneyToEnglishSolver().MoneyToEnglish(1357256.32));

public class MoneyToEnglishSolver
{
    private readonly string [] _to19 =
    [
        "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve",
        "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
    ];

    private readonly string [] _tens =
    [
        "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"
    ];

    private readonly string [] _denom =
    [
        "", "thousand", "million", "billion", "trillion", "quadrillion", "quintillion", "sextillion", "septillion",
        "octillion", "nonillion", "decillion", "undecillion", "duodecillion", "tredecillion", "quattuordecillion",
        "sexdecillion", "septendecillion", "octodecillion", "novemdecillion", "vigintillion"
    ];

    private string ConvertHund(int val)
    {
        if (val < 20)
            return _to19[val];
        
        for (var i = 0; i < _tens.Length; i++)
        {
            var dcap = _tens[i];
            var dval = 20 + 10 * i;
            if (dval + 10 > val)
            {
                if ((val % 10) != 0)
                {
                    return dcap + "-" + _to19[val % 10];
                }
                return dcap;
            }
        }

        throw new Exception("Less than 100 failure");
    }
    
    private string ConvertThous(int val)
    {
        var word = string.Empty;
        var rem = val / 100;
        var mod = val % 100;
        if (rem > 0)
        {
            word = _to19[rem] + " hundred";
            if (mod > 0)
            {
                word += " ";
            }
        }

        if (mod > 0)
        {
            word += ConvertHund(mod);
        }

        return word;
    }

    public string MoneyToEnglish(double money)
    {
        var num = (int)money;
        var mod = (int)((money % 1)*100);
        var numStr = NumberToEnglish(num);
        var modStr =  NumberToEnglish(mod);
        
        return $"{numStr} DOLLARS AND {modStr} CENTS";
    }

    string NumberToEnglish(int numb)
    {
        if (numb < 100)
        {
            return ConvertHund(numb);
        }

        if (numb < 1000)
        {
            return ConvertThous(numb);
        }

        for (var i = 0; i < _denom.Length; i++)
        {
            var didx = i - 1;
            var dval = (int)Math.Pow(1000, i);
            if (dval > numb)
            {
                var mod = (int)Math.Pow(1000, didx);
                var thous = numb / mod;
                var left = numb - thous * mod;
                var ret = ConvertThous(thous) + " " + _denom[didx];
                if (left > 0)
                {
                    ret = ret + ", " + NumberToEnglish(left);
                }

                return ret;
            }
        }

        throw new Exception("Bottomed out");
    }
}