#include <stdio.h>
#include <stdlib.h>

void write( char *str, int f ) {
  if( f < 10 ) {
    str[10] = '0';
    str[11] = '0';
    str[12] = '0' + f;
  }
  else if( f < 100 ) {
    str[10] = '0';
    str[11] = '0' + f / 10;
    str[12] = '0' + f % 10;
  }
  else if( f < 1000 ) {
    str[10] = '0' + f / 100;
    str[11] = '0' + ( f % 100 ) / 10;
    str[12] = '0' + f % 10;
  }
  printf("%s\n", str);
}

int main() {
  FILE *in, *out;
  int f, c, n;
  char *name, *t;
  f = 1;
  t = "bootstrap_000.css";
  name = malloc( 18 );
  for( n = 0; n < 18; n++ )
    name[n] = t[n];
  write( name, f );
  in = fopen( "bootstrap.min.css", "r" );
  out = fopen( name, "w" );
  n = 0;
  while( ( c = fgetc( in ) ) != EOF ) {
    if( c == '{' ) {
      fputc( ' ', out );
      fputc( c, out );
      fputc( '\n', out );
      fputc( ' ', out );
      fputc( ' ', out );
    }
    else if( c == ';' ) {
      fputc( c, out );
      fputc( '\n', out );
      fputc( ' ', out );
      fputc( ' ', out );
    }
    else if( c == '}' ) {
      fputc( '\n', out );
      fputc( c, out );
      fputc( '\n', out );
      n++;
      if( n == 100 ) {
        f++;
        fclose( out );
        write( name, f );
        out = fopen( name, "w" );
        n = 0;
      }
    }
    else
      fputc( c, out );
  }
  fclose( in );
  fclose( out );
}
