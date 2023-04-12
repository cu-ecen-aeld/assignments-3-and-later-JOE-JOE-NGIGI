#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
    openlog("my-utility", LOG_PID | LOG_CONS, LOG_USER);

    //variables to store arguments
    //$1 -> path to file && $2 is text to write on file
    const char *writefile = argv[1];
    const char *writestr = argv[2];

    //check if correct number of arguments are supplied and return error if not
    if (argc != 3)
    {
        syslog(LOG_ERR, "Required arguments not specified!");
        closelog();
        return EXIT_FAILURE;
    }

    

    FILE *fp = fopen(writefile, "w");

    //verify that file exists and return error if not
    if(fp == NULL)
    {
        syslog(LOG_ERR, "could not open the file");
        closelog();
        return EXIT_FAILURE;
    }

    //check if file was written
    if (fputs(writestr, fp) == EOF)
    {
        syslog(LOG_ERR, "Could not write to file");
        fclose(fp);
        closelog();
        return EXIT_FAILURE;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    fclose(fp);
    closelog();

    return EXIT_SUCCESS;
}


