/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <fcntl.h>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cerrno>
#include "functionalext.h"

#ifndef TEST_MODE
#define TEST_MODE 0666
#endif

const int32_t CREAT_MODE = TEST_MODE;

/**
 * @tc.name      : rewind_0100
 * @tc.desc      : Verify rewind process success
 * @tc.level     : Level 0
 */
static void Rewind0100(void)
{
    const char *filepath = "/data/storage/el2/base/cache/rewind_0100.txt";
    // Create file using creat()
    int32_t fd = creat(filepath, CREAT_MODE);
    if (fd < 0) {
        t_error("rewind_0100: creat failed (errno=%d)\n", errno);
        return;
    }
    close(fd);

    // Open file for writing
    FILE *fptr = fopen(filepath, "w");
    EXPECT_PTRNE("rewind_0100", fptr, NULL);
    if (!fptr) {
        remove(filepath);
        return;
    }

    // Write content to file
    char str[] = "test";
    size_t written = fwrite(str, 1, strlen(str), fptr);
    if (written != strlen(str)) {
        t_error("rewind_0100: fwrite wrote %zu bytes, expected %zu\n", written, strlen(str));
        fclose(fptr);
        remove(filepath);
        return;
    }

    int32_t ret = fclose(fptr);
    EXPECT_EQ("rewind_0100", ret, 0);

    // Open file for reading
    fptr = fopen(filepath, "r");
    EXPECT_PTRNE("rewind_0100", fptr, NULL);
    if (!fptr) {
        remove(filepath);
        return;
    }

    // Read one character to move file position
    int ch = fgetc(fptr);
    if (ch == EOF) {
        t_error("rewind_0100: fgetc returned EOF unexpectedly\n");
        fclose(fptr);
        remove(filepath);
        return;
    }

    // Verify we're not at EOF yet (there should be more data)
    // After reading 't', we should not be at EOF
    // Rewind to beginning of file
    rewind(fptr);

    // After rewind, EOF flag should be cleared
    EXPECT_FALSE("rewind_0100", feof(fptr));

    // Verify we can read from the beginning again
    ch = fgetc(fptr);
    if (ch != 't') {
        t_error("rewind_0100: after rewind, expected 't' but got '%c' (EOF=%d)\n",
                ch == EOF ? '?' : ch, feof(fptr));
    }

    fclose(fptr);
    remove(filepath);
}

static int RewindTestImpl(void)
{
    Rewind0100();
    return g_tStatus;
}

int RewindTest(void)
{
    return RewindTestImpl();
}
