using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            string s = Console.ReadLine();
            int i;
            string result = s.Substring(s.LastIndexOf('r') + 1);

            Int32.TryParse(result, out i);

            string toRet = Convert.ToString(i, 2).PadLeft(5, '0');

            Console.WriteLine(toRet);
            Console.Read();

        }
    }
}
