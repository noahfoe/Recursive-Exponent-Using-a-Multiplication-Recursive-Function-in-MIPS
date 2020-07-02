# Recursive-Exponent-Using-a-Multiplication-Recursive-Function-in-MIPS
𝑅𝑚𝑢𝑙𝑡(𝑎, 𝑏) = { 𝑎 if 𝑏 = 1
                𝑎 + 𝑅𝑚𝑢𝑙𝑡(𝑎, 𝑏 − −) If 1 &lt; 𝑏 }
                
𝑅𝑒𝑥𝑝(𝑎, 𝑏) = { 𝑎 if 𝑏 = 1
               𝑅𝑚𝑢𝑙𝑡(𝑎, 𝑅𝑒𝑥𝑝(𝑎, 𝑏 − −)) if 1 &lt; 𝑏 }
