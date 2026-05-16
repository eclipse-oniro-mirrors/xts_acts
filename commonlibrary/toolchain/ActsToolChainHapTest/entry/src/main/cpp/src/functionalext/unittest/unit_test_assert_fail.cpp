/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <cassert>
#include <cstdio>
#include <info/fatal_message.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

static void AssertOrFail(bool value, const char* expr, const char* func)
{
    if (!value) {
        __assert_fail(expr, __FILE__, __LINE__, func);
    }
}

static int UnittestFatalMessageAssertFailTestImpl(void)
{
    pid_t pid1;
    int status;

    // Create the first child process
    pid1 = fork();
    if (pid1 < 0) {
        // Failed to create the process
        fprintf(stderr, "Fork failed for Process One\n");
        return 1;
    } else if (pid1 == 0) {
        // child process one
        AssertOrFail(false, "0", __func__);
        return 0;
    }
    waitpid(pid1, &status, 0);
    return 0;
}

int UnittestFatalMessageAssertFailTest(void)
{
    return UnittestFatalMessageAssertFailTestImpl();
}
