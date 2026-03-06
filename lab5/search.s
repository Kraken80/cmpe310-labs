.section .data

numbers:
.long 1
.long 15
.long 4
.long 2
.long 7
.long 9
.long 23
.long 7
.long 3
.long 11
array_length:
.long 10

.section .text
.global search

search:
    movl $array_length, %edi
    movq $0, %rdx
    movl (%edi), %edx

    movq $numbers, %rdi
    movl (%rdi), %eax
    movq $1, %rcx

max_loop:
    movl (%rdi), %ebx
    cmp %ebx, %eax
    jae skip_max
    movl %ebx, %eax
skip_max:
    addq $4, %rdi
    incq %rcx
    cmpq %rdx, %rcx
    jle max_loop

    ret


.section .note.GNU-stack,"",@progbits
