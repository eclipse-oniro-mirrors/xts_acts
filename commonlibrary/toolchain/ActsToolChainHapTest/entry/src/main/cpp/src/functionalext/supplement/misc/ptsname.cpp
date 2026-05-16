/**
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
#include <pty.h>
#include <unistd.h>
#include "functionalext.h"

#define PTMPATH "/dev/ptmx"

/**
 * @tc.name      : Ptsname0100
 * @tc.desc      : Open the ptm file to establish a pseudo terminal, and judge
 *                 whether the function successfully obtains the terminal name
 * @tc.level     : Level 0
 */
void Ptsname0100(void)
{
    char* mastername = nullptr;

    int masterfd = open(PTMPATH, O_RDONLY);
    if (masterfd == -1) {
        perror("open failed");
        exit(EXIT_FAILURE);
    }
    mastername = ptsname(masterfd);
    EXPECT_PTRNE("Ptsname0100", mastername, nullptr);

    close(masterfd);
}

/**
 * @tc.name      : Ptsname0200
 * @tc.desc      : Pass in a non-existing terminal descriptor to determine whether the function returns nullptr
 * @tc.level     : Level 2
 */
void Ptsname0200(void)
{
    int aslave = -1;
    char* aslavename = nullptr;

    aslavename = ptsname(aslave);
    EXPECT_PTREQ("Ptsname0200", aslavename, nullptr);
}

static int PtsnameTestImpl(void)
{
    Ptsname0100();
    Ptsname0200();
    return T_STATUS;
}

int PtsnameTest(void)
{
    return PtsnameTestImpl();
}
