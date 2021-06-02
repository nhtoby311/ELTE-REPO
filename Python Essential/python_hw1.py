# 1
alphabet = {
    '0': ('###', '# #', '# #', '# #', '###'),
    '1': ('  #', '  #', '  #', '  #', '  #'),
    '2': ('###', '  #', '###', '#  ', '###'),
    '3': ('###', '  #', '###', '  #', '###'),
    '4': ('# #', '# #', '###', '  #', '  #'),
    '5': ('###', '#  ', '###', '  #', '###'),
    '6': ('###', '#  ', '###', '# #', '###'),
    '7': ('###', '  #', '  #', '  #', '  #'),
    '8': ('###', '# #', '###', '# #', '###'),
    '9': ('###', '# #', '###', '  #', '###'),
}

def seven_segment(number):
    numbs = [alphabet[numb] for numb in str(number)]
    for i in range(5):
        print("  ".join(s[i] for s in numbs))

seven_segment(123)
print("\n")
seven_segment(90817)

# 2
import string 
alphabet = string.ascii_uppercase
def shift_char(c,shift):
    if c in alphabet and c.isalpha():
        new_pos = (alphabet.index(c)+shift)%len(alphabet)  
    else:
        return ''
    return alphabet[new_pos]
def encrypt_caesar(cipher):
    res = [shift_char(cipher[i],1) for i in range (0,len(cipher))]  
    return ''.join(res)  
cipher = input("Please enter a message:\n")
cipher = cipher.upper()
print(encrypt_caesar(cipher))

# 3
import string 
alphabet = string.ascii_uppercase
arr = [0]*36
j=0
for i in range(10,len(arr)):  
    arr[i] = alphabet[j] 
    j=j+1
iban = input("Please enter an IBAN:\n")
iban = iban.replace(" ","") 
if len(iban) <= 30:
    new_iban = iban[4:] + iban[:4]
    for i in new_iban:
        for j in range(10,len(arr)):
            if i == arr[j]:
                new_iban = new_iban.replace(i,str(j))
    if int(new_iban)%97 == 1:
        print("IBAN is valid") 
    else:
        print("IBAN is invalid")
else:
    print("IBAN is invalid")

