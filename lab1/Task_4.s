.section .bss
.globl ram
.lcomm ram, 256 # reserve 256 bytes

.section .text
.globl fill_ram

fill_ram:
    # compute eax 1+2+3...+N for N=10
    mov $0, %eax
    mov $10, %ecx
compute_eax_loop:
    add %ecx, %eax
    dec %ecx
    jnz compute_eax_loop

    # move result to memory
    mov $ram, %rbx
    mov $0x50, %rdi
    movb %al, (%rbx, %rdi)
    
    ret # Return control to C

.section .note.GNU-stack,"",@progbits