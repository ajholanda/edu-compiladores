# Calculadora RPN de mesa avançada 

O código deste diretório contém o analisador sintático 
para a construção de uma calculadora de mesa avançada 
que usa a [notação polonesa inversa](https://pt.wikipedia.org/wiki/Nota%C3%A7%C3%A3o_polonesa_inversa) com a 
seguinte gramática para expressões aritméticas:

`R` &#8594; `NUMBER | R R + | R R - | R R * | R R /`

onde o _token_ `NUMBER` &#x2208; &#x211D;.

---

