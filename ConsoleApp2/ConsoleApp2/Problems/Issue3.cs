using System.Globalization;

namespace ConsoleApp2.Solve;

public class Issue3
{
    /*
     * Консольная программа для стандартизации лог-файлов
       Эта программа предназначена для обработки лог-файлов, содержащих записи в двух
       разных форматах. Цель программы – привести все записи к единому, стандартному виду,
       упрощая анализ и обработку логов.
       Необходимо преобразовать записи из входного лог-файла в единый формат и сохранить
       их в выходной файл.
       
       Форматы входных файлов
       Формат 1: 10.03.2025 15:14:49.523 INFORMATION Версия программы: '3.4.0.48729'
       Дата: 10.03.2025
       Время: 15:14:49.523
       УровеньЛогирования: INFORMATION
       Сообщение: Версия программы: ‘3.4.0.48729’
       Формат 2: 2025-03-10 15:14:51.5882| INFO|11|MobileComputer.GetDeviceId| Код
       устройства: '@MINDEO-M40-D-410244015546'
       Дата: 2025-03-10
       Время: 15:14:51.5882
       УровеньЛогирования: INFO
       ВызвавшийМетод: MobileComputer.GetDeviceId
       Сообщение: Код устройства: ‘@MINDEO-M40-D-410244015546’
       Выходной формат
       Формат: Дата
       Время Уровень
       Логирования ВызвавшийМетод
       Разделитель между полями: Табуляция.
       Дата: Формат DD-MM-YYYY (день-месяц-год).
       Время: Сохраняется в исходном формате.
       УровеньЛогирования: может иметь одно из нескольких значений:
       1)INFO (INFORMATION)
       2)WARN (WARNING)
       3)ERROR
       4)DEBUG
       Эти значения выбираются в зависимости от УровеньЛогирования входной записи.
       Пример:
       10.03.2025 15:14:49.523 INFORMATION Версия программы: '3.4.0.48729' -
       УровеньЛогирования для этой входной записи INFORMATION, но на выходной записи
       должен быть INFO, такая же логика и у WARNING - WARN.
       
       ВызвавшийМетод:
       Если значение поля “ВызвавшийМетод” присутствует во входной записи, оно должно
       быть скопировано в выходную запись.
       Если значение поля “ВызвавшийМетод” отсутствует во входной записи (как в Формате 1),
       то в выходную запись следует добавить значение DEFAULT.
       Сообщение: Сохраняется в исходном формате.
       Примеры выходных данных:
       2025-03-10
       15:14:49.523
       INFO
       DEFAULT
       Версия программы: '3.4.0.48729'
       2025-03-10
       15:14:51.5882 INFO
       MobileComputer.GetDeviceId
       Код устройства:
       '@MINDEO-M40-D-410244015546'
       Важно замечание:
       В случае, если входная запись оказывается невалидной, необходимо ее записывать в
       другой выходной файл с названием problems.txt. Формат записи исходный.
     */
    public const char TAB = '\t';

    record CommonFormatRecord(DateTime @DateTime, string Time, string LogLevel, string Method, string Message);

    public string[] Solve(string[] input)
    {
        if (input == null)
            throw new ArgumentNullException(nameof(input));
        if (input.Length == 0)
            return input;
        
        var result = new string[input.Length];
        for (var i = 0; i < input.Length; i++)
        {
            try
            {
                // 10.03.2025 15:14:49.523 INFORMATION Версия программы: '3.4.0.48729'
                // 2025-03-10 15:14:51.5882| INFO|11|MobileComputer.GetDeviceId| Код устройства: '@MINDEO-M40-D-410244015546'
                //Each line of the file can be in two different formats, so try to recognize the type
                var line = input[i];
                var items = line.Split("|");
                CommonFormatRecord parsed;
                if (items.Length > 1)
                {
                    parsed = ParseSecondFormat(items);
                }
                else
                {
                    items = line.Split(" ");
                    parsed = ParseFirstFormat(items);
                }

                result[i] =
                    $"{parsed.DateTime:dd-MM-yyyy}{TAB}" +
                    $"{parsed.Time}{TAB}" +
                    $"{parsed.LogLevel}{TAB}" +
                    $"{parsed.Method}{TAB}" +
                    $"{parsed.Message}";
            }
            catch (Exception e)
            {
                throw new FormatException($"Line {i} format might be broken", e);
            }
        }

        return result;
    }

    private CommonFormatRecord ParseFirstFormat(string[] items)
    {
        var dateTime = DateTime.ParseExact(items[0], "dd.MM.yyyy", null, DateTimeStyles.None);
        var time = items[1];
        var logLevel = items[2] == "INFORMATION" ? "INFO"
            : items[2] == "WARNING" ? "WARN" 
            : items[2];

        var message = string.Join(" ", items.Skip(3));
        return new CommonFormatRecord(dateTime, time, logLevel, "DEFAULT", message);
    }

    private CommonFormatRecord ParseSecondFormat(string [] items)
    {
        var dateTime = DateTime.Parse(items[0]);
        var time = items[0].Split(" ")[1];
        var logLevel = 
            items[1] == "INFORMATION" ? "INFO"
            : items[1] == "WARNING" ? "WARN" 
            : items[1];

        var toSkip = items[2]; // skip 11?
        var method = items.Length == 5 ? items[3] : "DEFAULT";
        var message = items.Length == 5 ? items[4] : items[3];
                
        return new CommonFormatRecord(dateTime, time, logLevel.Trim(), method, message.Trim());
    }
}
