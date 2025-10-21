#ifndef __TYPES_H__
#define __TYPES_H__

#include <stdbool.h>
#include <stdint.h>

#define MAXTOKEN 32
#define MAXSYMS 256

enum type_enum {
        F64,  F32,
        I64,  I32,  I16, I8,
        U64,  U32,  U16, U8,
        BOOL, CHAR, STR
};

union value_union {
        double          f64;
        float           f32;
        int_least64_t   i64;        
        int_least32_t   i32;        
        int_least16_t   i16;        
        int_least8_t    i8;
        uint_least64_t  u64;        
        uint_least32_t  u32;        
        uint_least16_t  u16;        
        uint_least8_t   u8;
        bool            b;        
        char            ch;
        char            *str;
};

struct symtab {
        char id[MAXTOKEN];
        enum type_enum typ;
        union value_union val;
};

extern void assign(char *id, union value_union val, enum type_enum typ);

/* flex */
extern int yylineno;

extern int yyerror (char const *msg, ...);
extern int yylex();

#endif