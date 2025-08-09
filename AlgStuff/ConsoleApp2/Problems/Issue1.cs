using System.Text;

namespace ConsoleApp2.Solve;

public class Issue1
{
    /*
     * Дана строка, содержащая n маленьких букв латинского алфавита. Требуется реализовать
       алгоритм компрессии этой строки, замещающий группы последовательно идущих
       одинаковых букв формой "sc" (где "s" – символ, "с" – количество букв в группе), а также
       алгоритм декомпрессии, возвращающий исходную строку по сжатой.
       Если буква в группе всего одна – количество в сжатой строке не указываем, а пишем её
       как есть.
       Пример:
       Исходная строка: aaabbcccdde
       Сжатая строка: a3b2c3d2e
     */
    public string? Solve(string? input)
    {
        if (input == null)
            return null;
        if (input.Length == 0)
            return string.Empty;
        if(input.Length == 1)
            return input;
        
        var currentChar = input[0];
        var result = new StringBuilder(input[0].ToString());
        var count = 1;
        for(var i = 1; i < input.Length; i++)
        {
            if (input[i] == currentChar)
            {
                count++;
            }
            else
            {
                if (count > 1)
                {
                    result.Append(count);
                }
                result.Append(input[i]);
                currentChar = input[i];
                count = 1;
            }
        }
        
        if (count > 1)
        {
            result.Append(count);
        }
        
        return result.ToString();
    }
}
