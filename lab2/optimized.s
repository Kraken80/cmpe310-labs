.section .bss
.globl str1
.lcomm str1, 256
.globl str2
.lcomm str2, 256

.section .text
.globl hamming_distance

# INPUT: RSI = destination address
#get_string:
#    mov $0, %rax     # read
#    mov $0, %rdi     # from stdin
#    mov $256, %rdx   # max 256 bytes
#    syscall
#    ret
#mov $str1, %rsi
#call get_string
#mov $str2, %rsi
#call get_string
#mov $str1, %rsi
#mov $str2, %rdi

# INPUT: NONE
# OUTPUT: hamming distance of str1 and str2.
hamming_distance:

    # first char* passed in rdi, second char* passed in rsi
    
    mov $0, %rdx
hamming_loop:
    movb (%rsi), %cl
    movb %cl, %al
    movb (%rdi), %ch
    xorb %ch, %al

    cmp $0, %cl
    je end_loop
    cmp $0, %ch
    je end_loop

    call population_count

    inc %rsi
    inc %rdi

    jmp hamming_loop
end_loop:

    # mov $0, %rax
    # mov %ch, %al

    mov %rdx, %rax  #return bit differences

    ret  # return control to C

population_count:
    mov $0x01, %bl
population_count_loop:
    test %bl, %al
    jz skip_inc
    inc %rdx
skip_inc:
    shl $1, %bl
    jnz population_count_loop

    ret

.section .note.GNU-stack,"",@progbits