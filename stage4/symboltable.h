//SYMBOL TABLE ENTRY

typedef struct Gsymbol{
char* name;                                             // name of the variable
int type;                                               // type of the variable
int size;                                               // size of the type of the variable
int binding;                                            // stores the static memory address allocated to the variable

//FOR ARRAYS
int row;                                          
int col;

struct Gsymbol *next;
}Gsymbol;

struct Gsymbol* Lookup(char* name);                    // Returns a pointer to the symbol table entry for the variable, returns NULL otherwise.

void Install(char *name, int type, int size,int row,int col);           // Creates a symbol table entry.

void addtype(int type);                             //Adds the datatype

void printsymboltable();                            //To print the symbol table;

