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
    if 'R0' in reg:
        return '{0:03b}'.format(4)
    if 'R1' in reg:
        return '{0:03b}'.format(5)
    if 'R2' in reg:
        return '{0:03b}'.format(6)
    if 'R3' in reg:
        return '{0:03b}'.format(7)

#%% Section to open the input and output files   
file_name = sys.argv[1]
file_path = os.path.join(sys.path[0], file_name)
output = ''

out_file = open('bin.txt', 'w')
try:
    with open(file_path,'r') as asm_file:
    #with open('C:/single_cycle_processor_fpga/quartus_project/tests/Teste2.txt','r') as asm_file:
    #%% Section with input file parse and output print
        for line in asm_file:
            line = line.upper() # convert lower chars to upper chars
            if line.count(' ') > 0: # checks line for spaces
                opcode = line.split()[0] # anything behind space is opcode
                data = line.split()[1] # anything after space is data
                if data.count(',') > 0: # checks data for commas
                    r0 = data.split(',')[0] # anything behind the first comma is r0       
                    r1 = data.split(',')[1] # anything after the first comma is r1
                    if line.count(',') > 1: # checks for a second comma
                        r2 = data.split(',')[2] # anything after the second comma is r2
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
                    output += '{0:05b}'.format(1) # opcode bits
                    output += '{0:03b}'.format(0) # useless bits
                    output += comp_reg(r0)
                    output += comp_reg(r1)
                    output += comp_reg(r2)
                    
                elif opcode == 'ADDI':
                    output += '{0:05b}'.format(2)
                    output += '{0:02b}'.format(0) # useless bits
                    output += comp_reg(r0)
                    output += comp_reg(r1)
                    output += '{0:04b}'.format(int(r2))
                    
                elif opcode == 'SUBI':
                    output += '{0:05b}'.format(3)
                    output += '{0:02b}'.format(0) # useless bits
                    output += comp_reg(r0)
                    output += comp_reg(r1)
                    output += '{0:04b}'.format(int(r2))
                    
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
                    output += '{0:06b}'.format(0)
            
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
                    output += '{0:09b}'.format(0)
                    
            else:
                # RST
                output += '{0:05b}'.format(7)
                output += '{0:012b}'.format(0) 

            
            out_file.write(output + '\n')
            output = ''

    out_file.close()

except OSError:
    print("\nError message: We have a problem oppenning your file, please verify path and file name and try again =)")
#except:
#    print ("\nError message: Assembly language can't be interpreted, please verify and be happy ;)")