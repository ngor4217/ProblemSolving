namespace ConsoleApp2.Solve;

public static class Issue2
{
    /*
     * Есть "сервер" в виде статического класса.
       У него есть переменная count (тип int) и два метода, которые позволяют эту
       переменную читать и писать: GetCount() и AddToCount(int value).
       К классу–"серверу" параллельно обращаются множество клиентов, которые в основном
       читают, но некоторые добавляют значение к count.
       Нужно реализовать статический класс с методами GetCount / AddToCount так,
       чтобы:
        читатели могли читать параллельно, не блокируя друг друга;
        писатели писали только последовательно и никогда одновременно;
        пока писатели добавляют и пишут, читатели должны ждать окончания записи.
     */
    static volatile int _count;
    public static int GetCount()
    {
        return Interlocked.CompareExchange(ref _count, 0, 0);
    }

    public static void AddToCount(int value)
    {
        Interlocked.Add(ref _count, value);
    }
}
