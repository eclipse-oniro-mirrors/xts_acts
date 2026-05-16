/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <csignal>
#include <cstdlib>
#include <malloc.h>
#include <sched.h>
#include <sys/wait.h>
#include <unistd.h>
#include "functionalext.h"

const int STACK_SIZE = 1024 * 8192;
const int SUCCESS = 0;
void* Test(void* p)
{
    return nullptr;
}

/**
 * @tc.name      : Clone0100
 * @tc.desc      : Each parameter is valid, and a new thread can be created through the clone function.
 * @tc.level     : Level 0
 */
void Clone0100(void)
{
    void* stack = malloc(STACK_SIZE);
    int cpid = -1;
    cpid = clone(reinterpret_cast<int (*)(void*)>(Test),
                 static_cast<char*>(stack) + STACK_SIZE,
                 CLONE_VM | CLONE_FS | CLONE_FILES | SIGCHLD,
                 nullptr);
    sleep(1);
    EXPECT_NE("Clone0100", cpid, -1);
    if (cpid > 0) {
        (void)waitpid(cpid, nullptr, 0);
    }
    free(stack);
}

/**
 * @tc.name      : Clone0200
 * @tc.desc      : Parameter flags is 0.
 * @tc.level     : Level 2
 */
void Clone0200(void)
{
    void* stack = malloc(STACK_SIZE);
    int cpid = -1;
    cpid = clone(reinterpret_cast<int (*)(void*)>(Test), static_cast<char*>(stack) + STACK_SIZE, 0, nullptr);
    sleep(1);
    EXPECT_NE("Clone0200", cpid, -1);
    if (cpid > 0) {
        (void)waitpid(cpid, nullptr, 0);
    }
    free(stack);
}

/**
 * @tc.name      : Clone0300
 * @tc.desc      : Parameter stack is nullptr.
 * @tc.level     : Level 2
 */
void Clone0300(void)
{
    int cpid = -1;
    cpid = clone(reinterpret_cast<int (*)(void*)>(Test), nullptr, 0, nullptr);
    sleep(1);
    EXPECT_NE("Clone0300", cpid, -1);
}

static int CloneTestWithArgs(int argc, char* argv[])
{
    Clone0100();
    Clone0200();
    Clone0300();
    return T_STATUS;
}

int CloneTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return CloneTestWithArgs(1, libcArgvStub);
}
