# -*- coding: utf-8 -*-
"""
Created on Sat Jul 13 15:37:01 2019

@author: 
    daniel.ribeiro
    marcos.melo
    danrley.silva
"""

#%% imports
import os
import sys

#%% Method to print registers
def comp_reg(reg):
    '''
    This function compares values in asm_file to determinate register
    and write in output file.
    '''
    if 'R0' in reg:
        return '{0:03b}'.format(0)
    if 'R1' in reg:
        return '{0:03b}'.format(1)
    if 'R2' in reg:
        return '{0:03b}'.format(2)
    if 'R3' in reg:
        return '{0:03b}'.format(3)
    if 'R4' in reg:
        return '{0:03b}'.format(4)
    if 'R5' in reg:
        return '{0:03b}'.format(5)
    if 'R6' in reg:
        return '{0:03b}'.format(6)
    if 'R7' in reg:
        return '{0:03b}'.format(7)

def clean_lines(line):
    '''
    Receives a string with a line content and cleans format errors.
    Returns a clean to assembler.
    '''
    line = line.upper() # convert lower chars to upper chars
    while line[0] == ' ':
        line = line[1:]
    
    while line.find('  ') > -1:
        line = line.replace('  ',' ')
    
    if line.find(', ') > 0:
        line = line.replace(', ', ',')

    return line

def create_output_binary(file_path):
    '''
    Receives a file with asm code and converts in binary output.
    '''
    output = ''
    out_file = open('bin.txt', 'w')
    try:
        with open(file_path,'r') as asm_file:
            for line in asm_file:
                line_clear = clean_lines(line)
                # broken lines in opcode and data: line_clear -> opcode + data
                if line_clear.count(' ') > 0: # checks line for spaces
                    opcode = line_clear.split()[0] # anything behind space is opcode
                    data = line_clear.split()[1] # anything after space is data
                    # split registrers from data string
                    if data.count(',') > 0: # checks data for commas
                        r0 = data.split(',')[0] # anything behind the first comma is r0       
                        r1 = data.split(',')[1] # anything after the first comma is r1
                        # verfying if exists an imediate or r2, imediates becomes a r2
                        if line_clear.count(',') > 1: # checks for a second comma
                            r2 = data.split(',')[2] # anything after the second comma is r2
                    # if has an instruction with a single register, clear cases
                    elif data == 'R0':
                        r0 = data

                    # Start output string construction.
                    if opcode == 'ADD':
                        output += '{0:05b}'.format(0) # opcode bits
                        output += '{0:03b}'.format(0) # useless bits
                        output += comp_reg(r0) # register R0 bits
                        output += comp_reg(r1) # register R1 bits
                        output += comp_reg(r2) # register R2 bits
                        
                    elif opcode == 'SUB':
                        output += '{0:05b}'.format(1)
                        output += '{0:03b}'.format(0) # useless bits
                        output += comp_reg(r0)
                        output += comp_reg(r1)
                        output += comp_reg(r2)
                        
                    elif opcode == 'ADDI' and r1.count('R') > 0:
                        output += '{0:05b}'.format(2)
                        output += '{0:02b}'.format(0) # useless bits
                        output += comp_reg(r0)
                        output += comp_reg(r1)
                        output += '{0:04b}'.format(int(r2)) # immediate in r2
                    
                    elif opcode == 'ADDI' and r1.count('R') == 0:
                        output += '{0:05b}'.format(2)
                        output += '{0:02b}'.format(0) # useless bits
                        output += comp_reg(r0)
                        output += comp_reg(r0)
                        output += '{0:04b}'.format(int(r1))
                        
                    elif opcode == 'SUBI' and r1.count('R') > 0:
                        output += '{0:05b}'.format(3)
                        output += '{0:02b}'.format(0) # useless bits
                        output += comp_reg(r0)
                        output += comp_reg(r1)
                        output += '{0:04b}'.format(int(r2))

                    elif opcode == 'SUBI' and r1.count('R') == 0:
                        output += '{0:05b}'.format(3)
                        output += '{0:02b}'.format(0) # useless bits
                        output += comp_reg(r0)
                        output += comp_reg(r0)
                        output += '{0:04b}'.format(int(r1))
                        
                    elif opcode == 'MUL2':
                        output += '{0:05b}'.format(4)
                        output += comp_reg(r0)
                        output += comp_reg(r1)
                        output += '{0:06b}'.format(0) # useless bits
                        
                    elif opcode == 'DIV2':
                        output += '{0:05b}'.format(5)
                        output += comp_reg(r0)
                        output += comp_reg(r1)
                        output += '{0:06b}'.format(0) # useless bits
                
                    elif opcode == 'CLR':
                        output += '{0:05b}'.format(6)
                        output += comp_reg(data)
                        output += '{0:09b}'.format(0) # useless bits
                        
                    elif opcode == 'MOV':
                        output += '{0:05b}'.format(8)
                        output += comp_reg(r0)
                        output += comp_reg(r1)
                        output += '{0:06b}'.format(0) # useless bits
                        
                    elif opcode == 'JMP':
                        output += '{0:05b}'.format(9)
                        output += '{0:06b}'.format(int(data, 0))
                        output += '{0:06b}'.format(0) # useless bits

                    elif opcode == 'CMP':
                        output += '{0:05b}'.format(10)
                        output += comp_reg(r0)
                        output += comp_reg(r1)
                        output += '{0:06b}'.format(0) # useless bits
                        
                    elif opcode == 'JZ':
                        output += '{0:05b}'.format(11)
                        output += '{0:06b}'.format(int(data, 0))
                        output += '{0:06b}'.format(0) # useless bits
                
                    elif opcode == 'INC':
                        output += '{0:05b}'.format(12)
                        output += comp_reg(r0)
                        output += comp_reg(r1)
                        output += '{0:06b}'.format(0) # useless bits
                
                    elif opcode == 'DEC': 
                        output += '{0:05b}'.format(13)
                        output += comp_reg(r0)
                        output += comp_reg(r1)
                        output += '{0:06b}'.format(0) # useless bits
                
                    elif opcode == 'LOADM':
                        output += '{0:05b}'.format(14)
                        output += comp_reg(r0)
                        output += '{0:04b}'.format(int(r1, 0)) # 5 before
                        output += '{0:05b}'.format(0) # useless bits
                        
                    elif opcode == 'STOREM':
                        output += '{0:05b}'.format(15)
                        output += comp_reg(r0)
                        output += '{0:04b}'.format(int(r1, 0))
                        output += '{0:05b}'.format(0) # useless bits
                        
                    elif opcode == 'RIO':
                        output += '{0:05b}'.format(16)
                        output += comp_reg(r0)
                        output += '{0:09b}'.format(0) # useless bits

                    elif opcode == 'MOVI':
                        output += '{0:05b}'.format(17)
                        output += comp_reg(r0)
                        output += '{0:04b}'.format(int(r1))
                        output += '{0:05b}'.format(0) # useless bits
        
                elif line_clear == 'RST\n':
                    output += '{0:05b}'.format(7)
                    output += '{0:012b}'.format(0) # useless bits
                
                # TODO modify initial if and create list of allowed words
                #else:
                #    raise Exception("This instruction: " + line_clear + " are not implemented, please check ISA for more information.")
    
                out_file.write(output + '\n') # blank line in the end of file
                output = '' # clear output buffer
                r0 = '' # clear register r0 buffer
                r1 = '' # clear register r1 buffer

        out_file.close()
    
        return "\nASSEMBLER MESSAGE: Well done! Successful assembly! You are good, my fellow!"

    # exception treatment
    except OSError:
        error_msg = ("\nError message: We have a problem oppenning your file, please verify path and file name and try again =)\nbin.txt file will be blank...")
        return error_msg
    except TypeError:
        error_msg = ("\nError message: Assembly language can't be interpreted, please verify the syntax and be happy ;)")
        return error_msg

#%% Section to open the input and output files   
file_name = sys.argv[1]
file_path = os.path.join(sys.path[0], file_name)
msg = create_output_binary(file_path)
print("\n---------------------------------------------------------------------------" + msg)
print("---------------------------------------------------------------------------")