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

#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <err.h>
#include <sys/wait.h>
#include <unistd.h>
#include "libc_test_shim.h"
/*
 * @tc.name      : Veerx0100
 * @tc.desc      : The test verrx method prints the error message
 * @tc.level     : Level 0
 */
void Veerx0100(int& status, char* fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    verrx(status, fmt, ap);
    va_end(ap);
}

int VerrxTest()
{
    pid_t pid = fork();
    if (pid < 0) {
        return -1;
    }
    if (pid == 0) {
        int status = SUCCESS_CODE;
        Veerx0100(status, "Veerx0100 printf info: %s", "this is msg");
        _exit(0);
    }
    int st = 0;
    if (waitpid(pid, &st, 0) < 0) {
        return -1;
    }
    return SUCCESS_CODE;
}
