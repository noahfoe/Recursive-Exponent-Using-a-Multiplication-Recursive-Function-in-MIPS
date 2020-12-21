# Recursive-Exponent-Using-a-Multiplication-Recursive-Function-in-MIPS
This was a project for my Assembly Language cource at Texas State University

## Prompt
Create a program in MIPS Assembly Language that will recursivly calculate the product of two numbers (a and b).
Then, using the recusive multiply function, create a recursive exponent function to calculate the a^b recursively.

## Mathmatical Equations Used
𝑅𝑚𝑢𝑙𝑡(𝑎, 𝑏) = { 𝑎 if 𝑏 = 1
                𝑎 + 𝑅𝑚𝑢𝑙𝑡(𝑎, 𝑏 − −) If 1 &lt; 𝑏 }
                
𝑅𝑒𝑥𝑝(𝑎, 𝑏) = { 𝑎 if 𝑏 = 1
               𝑅𝑚𝑢𝑙𝑡(𝑎, 𝑅𝑒𝑥𝑝(𝑎, 𝑏 − −)) if 1 &lt; 𝑏 }

## What I Learned
* MIPS Assembly Language
* Recursive Functions in MIPS
* Branch/Jump Instructions in MIPS
