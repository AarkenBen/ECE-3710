﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*
 *  jmpsra and jmptra
 * 
 */

namespace AND_assembler
{
    class Program
    {
        static void Main(string[] args)
        {
            int pc, end, labelCnt;
            String fileName, line, outFileName, currentPath;
            Dictionary<string, int> str_pc;

            bool bigendian = true;

            currentPath = @"..\..\..\";
            outFileName = "Error";

            str_pc = new Dictionary<string, int>();

            if(args.Length > 1)
            {
                if(args[1] == "-bigendian")
                {
                    bigendian = true;
                }
            }


            Console.WriteLine("Enter a file name you want to assemble");
            fileName = Console.ReadLine();

            end = 0;
            labelCnt = 0;

            while(!File.Exists(currentPath + fileName))
            {
                Console.WriteLine("File does not exist. Please enter a valid file name.");

                fileName = Console.ReadLine();

            }


            // get the name of the file
            if (!String.IsNullOrWhiteSpace(fileName))
            {
                int charLocation = fileName.IndexOf(".", StringComparison.Ordinal);

                if (charLocation > 0)
                {
                  outFileName = fileName.Substring(0, charLocation);
                }
            }

            // remove any previous instances of the coe file
            File.Delete(currentPath + outFileName + ".coe");


            Console.WriteLine("\t~~~~~~~~~Starting Assembler~~~~~~~~~\t");

            for (int i = 0; i < 2; i++)
            {
                if (i == 0)
                    Console.WriteLine("~~~~~Labels~~~~~");
                else
                    Console.WriteLine("~~~~~Assembly~~~~~");

                    // pc = 0x2800;
                    pc = 0x2800;

                // Read the file and display it line by line.  
                System.IO.StreamReader infile =
                    new System.IO.StreamReader(currentPath + fileName);
                while ((line = infile.ReadLine()) != null)
                {
                    if(!(line.Length > 1))
                    {
                        continue;
                    }

                    if (i == 0)
                    {
                        //Console.WriteLine(line + " and " + "..." + line[0] + "...");
                        //Console.ReadLine();
                        if (!Char.IsWhiteSpace(line[0]))
                        {
                            string l = line.Substring(0, line.LastIndexOf(':'));

                            Console.WriteLine(l + " @ 0x"+ Convert.ToString(pc,16));
                            //Console.ReadLine();
                            str_pc.Add(l, pc);
                            labelCnt += 1;
                        }
                        else if (isTwoWords(line))
                            pc += 2; //adjust pc for two word instruction
                        else
                            pc++;

                        end = pc;

                        
                    }
                    else if (i == 1)
                    {
                        if (Char.IsWhiteSpace(line[0]))
                        {
                            string[] instruction;
                            string toWrite;
                            string pc_for_label;

                            // not correct
                            instruction = line.Split(null);


                            //Console.WriteLine(" here " + instruction[1] + " " + instruction[2] + " " + instruction[3] + " \n");
                           // Console.ReadLine();
                            switch (instruction[1])
                            {
                                // logic
                                case "and":
                                    toWrite = "000000" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break; //0000
                                case "or":
                                    toWrite = "000001" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break;
                                case "not":
                                    toWrite = "000010" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break;
                                case "xor":
                                    toWrite = "000011" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break;

                                // arithmetic 
                                case "addui":
                                    toWrite = "000101" + immediate_helper(instruction[2], 21) + register_helper(instruction[3]);
                                    break;
                                case "addsi":
                                    toWrite = "001001" + immediate_helper(instruction[2], 21) + register_helper(instruction[3]);
                                    break;
                                case "subui":
                                    toWrite = "000111" + immediate_helper(instruction[2], 21) + register_helper(instruction[3]);
                                    break;
                                case "subsi":
                                    toWrite = "001011" + immediate_helper(instruction[2], 21) + register_helper(instruction[3]);
                                    break;

                                case "addu":
                                    toWrite = "000100" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break; // 0001

                                case "subu":
                                    toWrite = "000110" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break; // 0001

                                case "adds":
                                    toWrite = "001000" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break;// 0010

                                case "subs":
                                    toWrite = "001010" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break; // 0010

                                case "shiftra":
                                    toWrite = "001100" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break; // 0011

                                case "shiftrl":
                                    toWrite = "001110" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break;// 0011

                                case "shiftrai":
                                    toWrite = "001101" + immediate_helper(instruction[2], 5) + register_helper(instruction[3]);
                                    break; // 0011

                                case "shiftrli":
                                    toWrite = "001111" + immediate_helper(instruction[2], 5) + register_helper(instruction[3]);
                                    break;// 0011

                                case "shiftl":
                                    toWrite = "010000" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break; // 0100

                                case "shiftli":
                                    toWrite = "0100" + "0" + "1" + immediate_helper(instruction[2], 5) + register_helper(instruction[3]); 
                                    break;  

                                case "jmpl":
                                    pc_for_label = immediate_helper(str_pc[instruction[2]].ToString("X"), 24);

                                    toWrite = "010100" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break; // 1000

                                case "jmple":
                                    pc_for_label = immediate_helper(str_pc[instruction[2]].ToString("X"), 24);

                                    toWrite = "010101" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break; // 1000

                                case "jmpb":
                                    pc_for_label = immediate_helper(str_pc[instruction[2]].ToString("X"), 24);

                                    toWrite = "010110" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break; // 1000

                                case "jmpbe":
                                    pc_for_label = immediate_helper(str_pc[instruction[2]].ToString("X"), 24);

                                    toWrite = "010111" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break;

                                case "jmpg":
                                    pc_for_label = immediate_helper(str_pc[instruction[2]].ToString("X"), 24);

                                    toWrite = "011000" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break;

                                case "jmpge":
                                    pc_for_label = immediate_helper(str_pc[instruction[2]].ToString("X"), 24);

                                    toWrite = "011001" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break;

                                case "jmpa":
                                    pc_for_label = immediate_helper(str_pc[instruction[2]].ToString("X"), 24);

                                    toWrite = "011010" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break;

                                case "jmpae":
                                    pc_for_label = immediate_helper(str_pc[instruction[2]].ToString("X"), 24);

                                    toWrite = "011011" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break;

                                case "jmpe":
                                    pc_for_label = immediate_helper(str_pc[instruction[2]].ToString("X"), 24);

                                    toWrite = "011100" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break;

                                case "jmpne":
                                    pc_for_label = immediate_helper(str_pc[instruction[2]].ToString("X"), 24);

                                    toWrite = "011101" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break;
                                case "cmp":
                                    toWrite = "011110" + register_helper(instruction[2]) + register_helper(instruction[3]);
                                    break; //011110
                                    // needs to handle 
                                case "jmp":
                                    pc_for_label = immediate_helper(str_pc[instruction[2]].ToString("X"), 24);

                                    toWrite = "100000" + "00" + pc_for_label; // register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                    break; // 1000

                                    // does this just store the data into a specified area of memory or a specific register?
                                case "jmpsra":
                                    toWrite = "100010" + register_helper(instruction[2]) + register_helper(instruction[3]) + immediate_helper(instruction[4], 16);
                                    break; // 1000

                                case "jmptra":
                                    toWrite = "100011" + register_helper(instruction[2]) + register_helper(instruction[3]) + immediate_helper(instruction[4], 16);
                                    break; //1000


                                           /*
                                       case "loadl":
                                          // toWrite = "100010" + "0" register_helper(instruction[1]) + register_helper(instruction[2]) + immediate_helper_16(instruction[3]);
                                           break; // 1001
                                           */
                                case "load":
                                    toWrite = load_helper(instruction[2]) + immediate_helper(instruction[3], 24);
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
                                    toWrite = write_helper(instruction[2]) + immediate_helper(instruction[3], 24);
                                    break;

                                case "push":
                                    toWrite = "1101" + "0" + register_helper(instruction[2]) + immediate_helper(instruction[3], 6); // instruction[2] = to something like 0x1f
                                    break; // 1101 0

                                case "pop":
                                    toWrite = "1101" + "1" + register_helper(instruction[2]) + immediate_helper(instruction[3], 6); // instruction[2] = to something like 010110
                                    break; // 1101 1
                                           //
                               // case "writeReg":
                                    //toWrite = "111000" +        
                                default:
                                    toWrite = "didn't work";
                                    break;
                            }


                            if (isTwoWords(line))
                                pc += 2;
                            else
                                pc++;
                            string endline = ",";
                            if (pc == end)// - labelCnt)
                                endline = ";";



                            using (System.IO.StreamWriter outfile = new System.IO.StreamWriter(currentPath + outFileName + ".coe", true))
                            {
                                if (toWrite.Length == 16)
                                    outfile.WriteLine(toWrite + endline);//+"\t" + line);
                                else if (toWrite.Length == 32)
                                {
                                    // outfile.WriteLine("");
                                    // outfile.WriteLine(line);
                                    string first = toWrite.Substring(0, 16);
                                    string second = toWrite.Substring(16).Trim();
                                    outfile.WriteLine(first + ",");
                                    outfile.WriteLine(second + endline);
                                }
                                else
                                    outfile.WriteLine("Compile Error. Code: " + toWrite + "\n");

                            }
                        }
                    }
                }
                infile.Close();

                Console.WriteLine("PC: " + Convert.ToString(pc,16));
                Console.ReadLine();
            }
        }
        // semi colon at end
        private static bool isTwoWords(string line)
        {
            string[] instruction;

            instruction = line.Split(null);

            switch (instruction[1])
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

            return toRet;
        }

        // convert a string immediate to a binary string (e.g 0x1f -> 11111)
        static private string immediate_helper(string immd, int bits)
        {
            int i, j;
            string result = immd.Substring(immd.LastIndexOf('x') + 1);

            i = Convert.ToInt32(result, 16);
            j = -i;
            if (immd.IndexOf("-", StringComparison.CurrentCultureIgnoreCase) != -1)
            {
                string s;
                if (bits == 5) //5 6 16 21 24
                    s = Convert.ToString(j & 0x1f, 2).PadLeft(bits, '1');
                else if (bits == 6)
                    s = Convert.ToString(j & 0x3f, 2).PadLeft(bits, '1');
                else if (bits == 16)
                    s = Convert.ToString(j & 0xffff, 2).PadLeft(bits, '1');
                else if (bits == 21)
                    s = Convert.ToString(j & 0x1fffff, 2).PadLeft(bits, '1');
                else if (bits == 24)
                {
                    s = Convert.ToString(j & 0xffffff, 2).PadLeft(bits, '1');
                    Console.WriteLine(immd + "\t" + s);
                    //Console.ReadLine();
                }
                else
                    s = "didn't work";
                return s; 

            }
            else
            {
                string s;
                if (bits == 5) //5 6 16 21 24
                    s = Convert.ToString(i & 0x1f, 2).PadLeft(bits, '0');
                else if (bits == 6)
                    s = Convert.ToString(i & 0x3f, 2).PadLeft(bits, '0');
                else if (bits == 16)
                    s = Convert.ToString(i & 0xffff, 2).PadLeft(bits, '0');
                else if (bits == 21)
                    s = Convert.ToString(i & 0x1fffff, 2).PadLeft(bits, '0');
                else if (bits == 24)
                {
                    s = Convert.ToString(i & 0xffffff, 2).PadLeft(bits, '0');
                    Console.WriteLine(immd + "\t" + s);
                    //Console.ReadLine();
                }
                else
                    s = "didn't work";
                return s;
            }



        }
        
        static private string load_helper(string register)
        {
            int j;
            j = register_num(register);

            if (j < 16) // I think this has to be < 16
                return "1001" + Convert.ToString(j, 2).PadLeft(4, '0');
            else
                return "1010" + Convert.ToString(j & 0xF, 2).PadLeft(4, '0');

        }

        static private string write_helper(string register)
        {
            int j;
            j = register_num(register);

            if (j < 16) // I think this has to be < 16
                return "1011" + Convert.ToString(j, 2).PadLeft(4, '0');
            else
                return "1100" + Convert.ToString(j & 0xF, 2).PadLeft(4, '0');

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
            if (s.Length == 16)
            {
                return s.Substring(8, 8) + s.Substring(0, 8);
            }


            return "DIS BROKE LOL";
        }
    }
}

