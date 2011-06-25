NAME=sillythings

CC = clang

CFLAGS += -pipe -O3 -std=c++0x 
CFLAGS += -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wnested-externs
CFLAGS += -Wall -Wextra -pedantic
CFLAGS += -Wformat=2 -Wstrict-aliasing=2 -Wstrict-overflow=4 -Wunused -Wunused-parameter -Wswitch-enum 
CFLAGS += -Winit-self -Wmissing-include-dirs -Wpointer-arith -Wconversion
CFLAGS += -Wfloat-equal -Wundef -Wshadow -Wcast-qual -Wcast-align -Wwrite-strings
CFLAGS += -fabi-version=0 -funswitch-loops  #-fprefetch-loop-arrays #-funroll-loops 
CFLAGS += -Winline -Wmissing-noreturn -Wpacked -Wredundant-decls
CFLAGS += -Wno-write-strings -Waggregate-return -Winvalid-pch -Wlong-long
CFLAGS += -Wvariadic-macros -Wvolatile-register-var -Wmissing-format-attribute
#CFLAGS += -Wlogical-op -Wnormalized=nfc 
CFLAGS += -Wimport -Wunused-macros -I/usr/local/include

CFLAGS += -L/usr/local/lib -lsfml-graphics -lsfml-window -lsfml-system

nameclean: .NOTMAIN .USE .EXEC .IGNORE .PHONY
	rm -f ./$(NAME)
coreclean: .NOTMAIN .USE .EXEC .IGNORE .PHONY
	rm -f ./$(NAME).core
objclean: .NOTMAIN .USE .EXEC .IGNORE .PHONY
	rm -fv ./*.o
remake: .NOTMAIN .USE .EXEC .IGNORE .PHONY clean all

clean: .NOTMAIN .PHONY .IGNORE nameclean coreclean objclean
	rm -fv *.orig
	rm -fv *.tar *.tgz

$(NAME):

all: $(NAME)

rebuild: .NOTMAIN .PHONY clean $(NAME)

check: .NOTMAIN
#	splint -strict-lib -showcolumn -showfunc -strict *.c *.h
	lint -aabcehprsxH $(INCLUDE_FILES) *.c *.h
#	rats -rw3 *

distribution: .PHONY clean
	tar czf dist.tgz *
