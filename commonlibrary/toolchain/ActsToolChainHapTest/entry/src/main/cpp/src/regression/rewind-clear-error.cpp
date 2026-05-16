/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// commit: a6238c30d169cbac6bc4c4977622242063e32270 2011-02-22
// rewind should clear error
#include <cstdio>
#include <unistd.h>
#include "libc_test_shim.h"
int RewindClearErrorTest()
{
    int status = SUCCESS_CODE;

    char buf[1];
    size_t n;
    int fd;

    // make sure fread fails
    fd = dup(0);
    close(0);

    n = fread(buf, 1, sizeof buf, stdin);
    if (n != 0 || !ferror(stdin)) {
        LibcTestError(
            &status, "fread(stdin) should have failed, got %d ferror %d feof %d\n", n, ferror(stdin), feof(stdin));
    }
    if (dup(fd) != 0) {
        LibcTestError(&status, "dup failed\n");
    }

    rewind(stdin);
    if (ferror(stdin)) {
        LibcTestError(&status, "rewind failed to clear ferror\n");
    }
    return status;
}
