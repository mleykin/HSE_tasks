#!/bin/bash

touch proga_parent.c

echo '#include <stdio.h>
int main(int argc, char *argv[]){
FILE *f = fopen("creator_child.sh", "w");
fprintf(f, "#!/bin/bash\ntouch proga.c\necho \"#include <stdio.h>\nint main(int argc, char *argv[]){\nprintf(\\\"Hello World!\\\");\n}\" > proga.c\ngcc -o proga proga.c\n./proga\nrm ./proga.c\nrm ./proga");
popen("bash ./creator_child.sh", "w");
}' > proga_parent.c

gcc -o proga_parent ./proga_parent.c
./proga_parent

#rm ./proga.c
rm ./proga_parent
rm ./proga_parent.c
rm ./creator_child.sh

