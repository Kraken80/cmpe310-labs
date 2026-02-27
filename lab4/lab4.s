.section .bss

.section .text
.globl sum

sum:
    #mov $location, %rdi
    #mov $length, %rsi
    
    mov $0, %eax
    mov %rsi, %rcx
sum_loop:
    add (%rdi), %eax
    add $4, %rdi
    loop sum_loop

    ret

.section .note.GNU-stack,"",@progbits