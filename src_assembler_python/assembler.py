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
    if 'R0' in reg:
        return '{0:02b}'.format(0)
    if 'R1' in reg:
        return '{0:02b}'.format(1)
    if 'R2' in reg:
        return '{0:02b}'.format(2)
    if 'R3' in reg:
        return '{0:02b}'.format(3)

#%% Section to open the input and output files   
#file_name = sys.argv[1]
#file_path = os.path.join(sys.path[0], file_name)
output = ''

out_file = open('bin.txt', 'w')

#with open(file_path,'r') as cfg_file:
with open('asm.txt','r') as cfg_file:
#%% Section with input file parse and output print
    for line in cfg_file:
        if line.count(' ') > 0: # checks line for spaces
            opcode = line.split()[0] # anything behind space is opcode
            data = line.split()[1] # anything after space is data
            if data.count(',') > 0: # checks data for commas
                r0 = data.split(',')[0] # anything behind the first comma is r0       
                r1 = data.split(',')[1] # anything after the first comma is r1
                if line.count(',') > 1: # checks for a second comma
                    r2 = data.split(',')[2] # anything after the second comma is r2
            
            # Start output string construction.
            if opcode == 'ADD':
                output += '{0:04b}'.format(0)
                output += comp_reg(r0)
                output += comp_reg(r1)
                output += comp_reg(r2)
                
            elif opcode == 'SUB':
                output += '{0:04b}'.format(1)
                output += comp_reg(r0)
                output += comp_reg(r1)
                output += comp_reg(r2)
                
            elif opcode == 'ADDi':
                output += '{0:04b}'.format(2)
                output += comp_reg(r0)
                output += '{0:04b}'.format(int(r1))
                
            elif opcode == 'SUBi':
                output += '{0:04b}'.format(3)
                output += comp_reg(r0)
                output += '{0:04b}'.format(int(r1))
                
            elif opcode == 'MUL2':
                output += '{0:04b}'.format(4)
                output += comp_reg(r0)
                output += comp_reg(r1)
                output += '{0:02b}'.format(0)
                
            elif opcode == 'DIV2':
                output += '{0:04b}'.format(5)
                output += comp_reg(r0)
                output += comp_reg(r1)
                output += '{0:02b}'.format(0)
        
            elif opcode == 'CLR':
                output += '{0:04b}'.format(6)
                output += comp_reg(data)
                output += '{0:04b}'.format(0)
                
            elif opcode == 'MOV':
                output += '{0:04b}'.format(8)
                output += comp_reg(r0)
                output += comp_reg(r1)
                output += '{0:02b}'.format(0)
                
            elif opcode == 'JMP':
                output += '{0:04b}'.format(9)
                output += '{0:06b}'.format(int(data, 0))
                
            elif opcode == 'JZ':
                output += '{0:04b}'.format(10)
                output += '{0:06b}'.format(int(data, 0))
        
            elif opcode == 'INC':
                output += '{0:04b}'.format(11)
                output += comp_reg(r0)
                output += comp_reg(r1)
                output += '{0:02b}'.format(0)
        
            elif opcode == 'DEC': 
                output += '{0:04b}'.format(12)
                output += comp_reg(r0)
                output += comp_reg(r1)
                output += '{0:02b}'.format(0)
        
            elif opcode == 'LOAD':
                output += '{0:04b}'.format(13)
                output += comp_reg(r0)
                output += '{0:04b}'.format(int(r1, 0))
                
            elif opcode == 'STORE':
                output += '{0:04b}'.format(14)
                output += comp_reg(r0)
                output += '{0:04b}'.format(int(r1, 0))
                
            elif opcode == 'RNB':
                output += '{0:04b}'.format(15)
                output += comp_reg(data)
                output += '{0:04b}'.format(0)
                
        else:
            # RST
            output += '{0:04b}'.format(7)
            output += '{0:06b}'.format(0) 

        
        out_file.write(output + '\n')
        output = ''

out_file.close()
