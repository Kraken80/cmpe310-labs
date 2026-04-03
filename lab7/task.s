.section .data

.section .text

#INPUTS:
# ax = selects what character to display
# bx = selects which segment display to use (letters 0-7)
# where 0 is the rightmost seg and 7 the leftmost.
#DESTROYS: none
display_letter:

    push %cx
    push %dx

	# port A = 1 << %bx
    mov %bx, %cx
    mov $1, %bx
    shl %cl, %bx
    # dx = port A (segment # control)
    mov $0x640, %dx
    mov %ax, %cx
    mov %bx, %ax
    out %al, %dx

	# port b = %ax
    mov %cx, %ax
    # dx = port B (individual segment control)
    mov $0x641, %dx
    out %al, %dx

	incw %bx
	
    pop %dx
    pop %cx
    ret

.global _start
_start:
    # ports:
    # $640 to $643 - ports of the 82C55 programmable periphreal interface

    push %rbp
    mov %rsp, %rbp
    sub $2, %rsp
    movw $1, (%rbp)

    # dx = control register
    mov $0x643, %dx
    # ax = control argument/options
    # b0-b1,b2-b3 = 0 for all ports as outputs
    # b2, b5-b6 = 0 for all ports in Mode 0 operation
    # b7 = 1 for I/O Mode
    mov $0b10000000, %ax
    out %al, %dx


    # Set port C outputs low, as they are not connected.
    # dx = port C (disconnected)
    mov $0x642, %dx
    mov $0, %ax
    out %al, %dx

    # cx = 'SHE' base (located at the letter E)
    mov $0, %cx
    
    # scroll direction = 1
    movw $1, (%rbp)

loop:
    # ax = Letter 'E'
    mov $0b01111001, %ax
    mov %cx, %bx
    call display_letter
    # ax = Letter 'H'
    mov $0b01110110, %ax
    call display_letter
    # ax = Letter 'S'
    mov $0b01101101, %ax
    call display_letter

    # if scrolling positive, check for end of text > size of display
    # if scrolling negative, check for start of text == 0
    # then, switch scroll direction

    cmpw $-1, (%rbp)
    jne scroll_dir_positive
scroll_dir_negative:
    cmp $0, %cx
    je switch_direction
    jmp end_branch
scroll_dir_positive:
    cmp $8, %bx
    je switch_direction
end_branch:
    addw (%rbp), %cx
    jmp loop

switch_direction:
    negw (%rbp)
    addw (%rbp), %cx
    jmp loop

    # exit(0) (won't be reached.)
    mov $60, %rax # exit
    mov $0, %rdi # status
    syscall

    leave
    ret
