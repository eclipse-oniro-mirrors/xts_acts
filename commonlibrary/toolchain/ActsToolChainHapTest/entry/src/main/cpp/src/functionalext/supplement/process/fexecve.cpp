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

#include <cstdlib>
#include <fcntl.h>
#include "functionalext.h"

/**
 * @tc.name      : Fexecve0100
 * @tc.desc      : Each parameter is valid, the fexecve function can execute the specified file.
 * @tc.level     : Level 0
 */
void Fexecve0100(void)
{
    if (fork() == 0) {
        char* argv[] = { "./fexecverely", nullptr };
        char* environ[] = { nullptr, nullptr };
        int fd = open("fexecverely", O_RDONLY);
        EXPECT_NE("Fexecve0100", fexecve(fd, argv, environ), -1);
    }
}

/**
 * @tc.name      : Fexecve0200
 * @tc.desc      : The fd parameter is invalid (nullptr), the fexecve function cannot execute the specified file.
 * @tc.level     : Level 2
 */
void Fexecve0200(void)
{
    char* myEnv[] = { nullptr };
    char* argv[] = { "touch", "fexecvetest.Txt", nullptr };
    EXPECT_EQ("Fexecve0200", fexecve(-1, argv, myEnv), -1);
}

static int FexecveTestImpl(int argc, char* argv[])
{
    Fexecve0100();
    Fexecve0200();
    return T_STATUS;
}

int FexecveTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return FexecveTestImpl(1, libcArgvStub);
}
