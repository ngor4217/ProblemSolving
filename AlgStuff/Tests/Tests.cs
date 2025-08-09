using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using ConsoleApp2.Solve;
using NUnit.Framework;

namespace Tests
{
    [TestFixture]
    public class Tests
    {
        [TestCase("aaabbcccdde", "a3b2c3d2e")]
        [TestCase("", "")]
        [TestCase(null, null)]
        [TestCase("a", "a")]
        [TestCase("aa", "a2")]
        [TestCase("aaa", "a3")]
        [TestCase("aaab", "a3b")]
        [TestCase("abacab", "abacab")]
        public void Solve1_MustReturnPackedString(string input, string expected)
        {
            var solver = new Issue1();
            var result = solver.Solve(input);
            Assert.That(expected == result, Is.True);
        }

        [Test]
        public void Solve2_MustHandleParallelIncrease()
        {
            var tasks = new Task[1000000];
            for (var i = 0; i < 1000000; i++)
            {
                if (i % 2 == 0)
                {
                    tasks[i] = new Task(() => Issue2.AddToCount(3));
                }
                else
                {
                    tasks[i] = new Task(() => Issue2.GetCount());
                }
            }
            Parallel.ForEach(tasks, t => t.Start());
            Task.WaitAll(tasks);
            Assert.That(Issue2.GetCount() == 1500000, Is.True);
        }

        [TestCase(new [] {"10.03.2025 15:14:49.523 INFORMATION Версия программы: '3.4.0.48729'"}, 
            new [] {"10-03-2025\t15:14:49.523\tINFO\tDEFAULT\tВерсия программы: '3.4.0.48729'"})]
        [TestCase(new [] {"2025-03-10 15:14:51.5882| INFO|11|MobileComputer.GetDeviceId| Код устройства: '@MINDEO-M40-D-410244015546'"}, 
            new [] {"10-03-2025\t15:14:51.5882\tINFO\tMobileComputer.GetDeviceId\tКод устройства: '@MINDEO-M40-D-410244015546'"})]
        public void Solve3_MustParseTwoDifferentFormats(string[] input, string[] expected)
        {
            var solver = new Issue3();
            var result = solver.Solve(input);
            for (var i = 0; i < input.Length; i++)
            {
                Assert.That(result[i] == expected[i], Is.True);
            }
        }
    }
}