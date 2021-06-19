#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "libical-glib/libical-glib.h"

void hexDump(char *desc, void *addr, int len)
{
    int i;
    unsigned char buff[17];
    unsigned char *pc = (unsigned char*)addr;

    // Output description if given.
    if (desc != NULL)
        printf ("%s:\n", desc);

    // Process every byte in the data.
    for (i = 0; i < len; i++) {
        // Multiple of 16 means new line (with line offset).

        if ((i % 16) == 0) {
            // Just don't print ASCII for the zeroth line.
            if (i != 0)
                printf("  %s\n", buff);

            // Output the offset.
            printf("  %04x ", i);
        }

        // Now the hex code for the specific character.
        printf(" %02x", pc[i]);

        // And store a printable ASCII character for later.
        if ((pc[i] < 0x20) || (pc[i] > 0x7e)) {
            buff[i % 16] = '.';
        } else {
            buff[i % 16] = pc[i];
        }

        buff[(i % 16) + 1] = '\0';
    }

    // Pad out last line if not exactly 16 characters.
    while ((i % 16) != 0) {
        printf("   ");
        i++;
    }

    // And print the final ASCII bit.
    printf("  %s\n", buff);
}

void test_by_second (void) {
	ICalRecurrence *recurrence = i_cal_recurrence_new_from_string("FREQ=DAILY;COUNT=10");

	i_cal_recurrence_set_by_second(recurrence, 0, 1);
	i_cal_recurrence_set_by_second(recurrence, 1, I_CAL_RECURRENCE_ARRAY_MAX);

	GArray *array = i_cal_recurrence_get_by_second_array(recurrence);

  printf("Array #0 = %d\n", g_array_index(array, gshort, 0));
  printf("Array #1 = %d\n", g_array_index(array, gshort, 1));
  printf("GObject  = %ld\n", sizeof(GObject));
  printf("GArray   = %ld\n", sizeof(GArray));

	hexDump( "By Second Array", array, sizeof(GArray) );
}

void main (int argc, char **argv) {
	test_by_second();
}
