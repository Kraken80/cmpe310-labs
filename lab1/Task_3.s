.section .bss
.globl ram
.lcomm ram, 256 # reserve 256 bytes

.section .text
.globl fill_ram

fill_ram:
    # Store 00h into ram 50h-58h
    # Indirect addressing

    mov $ram, %rbx
    mov $0x50, %rdi

fill_ram_loop:
    movb $0x00, (%rbx, %rdi)

    inc %rdi
    cmp $0x58, %rdi
    jbe fill_ram_loop
    
    ret # Return control to C

.section .note.GNU-stack,"",@progbits