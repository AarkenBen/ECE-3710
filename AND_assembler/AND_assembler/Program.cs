using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace AND_assembler
{
    class Program
    {
        static void Main(string[] args)
        {
            int pc;
            String fileName, line;
            Dictionary<string, int> str_pc;

            str_pc = new Dictionary<string, int>();

            Console.WriteLine("Enter a file. name to assemble");
            fileName = Console.ReadLine();

            for (int i = 0; i < 2; i++)
            {

                pc = 0x2800;

                // Read the file and display it line by line.  
                System.IO.StreamReader file =
                    new System.IO.StreamReader(@"c:\test.txt");
                while ((line = file.ReadLine()) != null)
                {
                    if (i == 0)
                    {
                        if (!Char.IsWhiteSpace(line[0]))
                        {
                            str_pc.Add(line, pc);
                            pc++;
                        }
                        else if (isTwoWords(line))
                            pc += 2; //adjust pc for two word instruction
                        else
                            pc++;
                    }
                    else if (i == 1)
                    {
                        if (Char.IsWhiteSpace(line[0]))
                        {
                            string[] instruction;
                            string toWrite;

                            // not correct
                            instruction = line.Split(null);

                            switch (instruction[0])
                            {
                                // logic
                                case "and":
                                    toWrite = "000000" + register_helper(instruction[1]) + register_helper(instruction[2]);
                                    break; //0000
                                case "or":
                                    toWrite = "000001" + register_helper(instruction[1]) + register_helper(instruction[2]);
                                    break;
                                case "not":
                                    toWrite = "000010" + register_helper(instruction[1]) + register_helper(instruction[2]);
                                    break;
                                case "xor":
                                    toWrite = "000011" + register_helper(instruction[1]) + register_helper(instruction[2]);
                                    break;

                                // arithmetic 
                                case "addui":
                                    toWrite = "000101" + immediate_helper(instruction[1], 16) + register_helper(instruction[2]);
                                    break;
                                case "addsi":
                                    toWrite = "001001" + immediate_helper(instruction[1], 16) + register_helper(instruction[2]);
                                    break;
                                case "subui":
                                    toWrite = "000111" + immediate_helper(instruction[1], 16) + register_helper(instruction[2]);
                                    break;
                                case "subsi":
                                    toWrite = "001011" + immediate_helper(instruction[1], 16) + register_helper(instruction[2]);
                                    break;

                                case "addu":
                                    toWrite = "000100" + register_helper(instruction[1]) + register_helper(instruction[2]);
                                    break; // 0001

                                case "subu":
                                    toWrite = "000110" + register_helper(instruction[1]) + register_helper(instruction[2]);
                                    break; // 0001

                                case "adds":
                                    toWrite = "001000" + register_helper(instruction[1]) + register_helper(instruction[2]);
                                    break;// 0010

                                case "subs":
                                    toWrite = "001010" + register_helper(instruction[1]) + register_helper(instruction[2]);
                                    break; // 0010

                                case "shiftra":
                                    toWrite = "001100" + register_helper(instruction[1]) + register_helper(instruction[2]);
                                    break; // 0011

                                case "shiftrl":
                                    toWrite = "001110" + register_helper(instruction[1]) + register_helper(instruction[2]);
                                    break;// 0011

                                case "shiftrai":
                                    toWrite = "001101" + immediate_helper(instruction[1], 5) + register_helper(instruction[2]);
                                    break; // 0011

                                case "shiftrli":
                                    toWrite = "001111" + immediate_helper(instruction[1], 5) + register_helper(instruction[2]);
                                    break;// 0011

                                case "shiftl":
                                    toWrite = "010000" + register_helper(instruction[1]) + register_helper(instruction[2]);
                                    break; // 0100

                                case "jmpl":
                                    toWrite = "010100" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; // 0101

                                case "jmple":
                                    toWrite = "010101" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; // 0101

                                case "jmpb":
                                    toWrite = "010110" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; // 0101

                                case "jmpbe":
                                    toWrite = "010111" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; // 0101

                                case "jmpg":
                                    toWrite = "011000" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; // 0110

                                case "jmpge":
                                    toWrite = "011001" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; // 0110

                                case "jmpa":
                                    toWrite = "011010" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; //0110

                                case "jmpae":
                                    toWrite = "011011" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; //0110

                                case "jmpe":
                                    toWrite = "011100" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; // 0111

                                case "jmpne":
                                    toWrite = "011110" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; // 0111

                                    // needs to handle 
                                case "jmp":

                                    string pc_for_label = str_pc[instruction[2]].ToString();

                                    toWrite = "100000" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break; // 1000

                                    // does this just store the data into a specified area of memory or a specific register?
                                case "jmpsra":
                                    toWrite = "100010" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; // 1000

                                case "jmptra":
                                    toWrite = "100011" + register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper(instruction[3], 16);
                                    break; //1000


                                           /*
                                       case "loadl":
                                          // toWrite = "100010" + "0" register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                           break; // 1001
                                           */
                                case "load":
                                    toWrite = load_write_helper(instruction[1]) + immediate_helper(instruction[2], 24);
                                    break;
                                /*
                            case "loadh":
                                break; // 1010
                                */
                                /*
                            case "writel":
                                break; // 1011

                            case "writeh":
                                break; // 1100
                                */


                                case "write":
                                    toWrite = load_write_helper(instruction[1]) + immediate_helper(instruction[2], 24);
                                    break;

                                case "push":
                                    toWrite = "1101" + "0" + register_helper(instruction[1]) + immediate_helper(instruction[2], 6); // instruction[2] = to something like 0x1f
                                    break; // 1101 0

                                case "pop":
                                    toWrite = "1101" + "1" + register_helper(instruction[1]) + immediate_helper(instruction[2], 6); // instruction[2] = to something like 010110
                                    break; // 1101 1
                                           //        
                            }


                            if (isTwoWords(line))
                                pc += 2;
                            else
                                pc++;

                        }
                    }
                }
                file.Close();
            }
        }

        private static bool isTwoWords(string line)
        {
            string[] instruction;

            instruction = line.Split(null);

            switch (instruction[0])
            {
                case "addui":
                case "addsi":
                case "subui":
                case "subsi":
                case "jmpl":
                case "jmple":
                case "jmpb":
                case "jmpbe":
                case "jmpg":
                case "jmpge":
                case "jmpa":
                case "jmpae":
                case "jmpe":
                case "jmpne":
                case "jmp":
                case "jmpsra":
                case "jmptra":
                case "load":
                case "write":
                //case "loadl":
                //case "loadh":
                //case "writel":
                //case "writeh":
                case "push":
                case "pop":
                    return true;
                default:
                    return false;
            }

        }

        /*
         * return the 5 binary string of the register
         */
        static private string register_helper(string reg)
        {
            int i;
            string result = reg.Substring(reg.LastIndexOf('r') + 1);

            Int32.TryParse(result, out i);

            string toRet = Convert.ToString(i, 2).PadLeft(5, '0');

            return null;
        }

        // convert a string immediate to a binary string (e.g 0x1f -> 11111)
        static private string immediate_helper(string immd, int bits)
        {
            int i;
            string result = immd.Substring(immd.LastIndexOf('x') + 1);
            
            Int32.TryParse(result, out i);

            string s = Convert.ToString(i, 2).PadLeft(bits, '0');

            return s;
        }
        
        static private string load_write_helper(string register)
        {
            int j;
            j = register_num(register);

            if (j < 16) // I think this has to be < 16
                return "1001" + Convert.ToString(j, 2).PadLeft(4, '0');
            else
                return "1010" + Convert.ToString(j & 0xF, 2).PadLeft(4, '0');

        }
        
        static private int register_num(string reg)
        {
            int i;
            string temp = reg.Substring(1);
            Int32.TryParse(temp, out i);
            return i;
        }

        public static string toLittleEndian(string s)
        {
            char[] charArray = s.ToCharArray();
            Array.Reverse(charArray);
            return new string(charArray);
        }
    }
}

