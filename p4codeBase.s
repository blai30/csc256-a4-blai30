.data
    endl:    .asciiz  "\n"   # used for cout << endl;
    sumlbl:    .asciiz  "Sum: " # label for sum
    revlbl:    .asciiz  "Reversed Number: " # label for rev
    pallbl:    .asciiz  "Is Palindrome: " # label for isPalindrome
    sumarr:    .word 1
               .word 3
               .word 44
               .word 66
               .word 88
               .word 90
               .word 9
               .word 232
               .word 4325
               .word 2321
    arr:       .word 1
               .word 2
               .word 3
               .word 4
               .word 5
               .word 4
               .word 3
               .word 2
               .word 1

.text

# sum               --> $s0
# address of sumarr --> $s1
# rev               --> $s2
# num               --> $s3
# isPalindrome      --> $s4
# address of arr    --> $s5
# i                 --> $t0
# beg               --> $s6
# end               --> $s7
# d                 --> $t1
# 10                --> $t2
# 100               --> $t3
main:

  li   $s0, 0
  la   $s1, sumarr
  li   $t2, 10
  li   $t0, 0
  move $t4, $s1
loop0:
  lw   $t5, ($t4)
  add  $s0, $s0, $t5
  addi $t4, $t4, 4
  addi $t0, $t0, 1
  blt  $t0, $t2, loop0
exit0:

  li   $s2, 0
  li   $s3, 45689
  li   $t1, -1
loop1:
  rem  $t1, $s3, $t2
  mul  $s2, $s2, $t2
  add  $s2, $s2, $t1
  div  $s3, $s3, $t2
  bgt  $s3, $0, loop1

  li   $s4, 1
  la   $s5, arr
  move $t6, $s5
  addi $s6, $t6, 0
  addi $s7, $t6, 32
loop2:
  lw   $t7, ($s6)
  lw   $t8, ($s7)
  bne  $t7, $t8, exit1
  addi $s6, $s6, 4
  addi $s7, $s7, -4
  blt  $s6, $s7, loop2
  j exit
exit1:
  li   $s4, -1

exit:
  la   $a0, sumlbl    # puts sumlbl into arg0 (a0 register) for cout
  addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string
  syscall             # make a syscall to system

  move $a0, $s0       # puts sum into arg0 (a0 register) for cout
  addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int
  syscall             # make a syscall to system

  la   $a0, endl      # puts the address of the string endl into a0
  addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
  syscall

  la   $a0, revlbl    # puts revlbl into arg0 (a0 register) for cout
  addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing an string
  syscall             # make a syscall to system

  move $a0, $s2       # puts rev into arg0 (a0 register) for cout
  addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int
  syscall             # make a syscall to system

  la   $a0, endl      # puts the address of the string endl into a0
  addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
  syscall

  la   $a0, pallbl    # puts pallbl into arg0 (a0 register) for cout
  addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string
  syscall             # make a syscall to system

  move $a0, $s4       # puts isPalindrome into arg0 (a0 register) for cout
  addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int
  syscall             # make a syscall to system

  la   $a0, endl      # puts the address of the string endl into a0
  addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string
  syscall


  addi $v0,$0, 10
  syscall