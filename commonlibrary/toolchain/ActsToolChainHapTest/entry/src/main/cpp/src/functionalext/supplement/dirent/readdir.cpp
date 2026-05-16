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
#include <dirent.h>
#include "functionalext.h"

#include "dirent/__dirent.h"

/**
 * @tc.name      : Readdir0100
 * @tc.desc      : The parameter is valid and can return the next directory entry
 *                 point of the parameter dir directory stream.
 * @tc.level     : Level 0
 */
void Readdir0100(void)
{
    DIR* dir = opendir("/etc");
    struct dirent* ret = readdir(dir);
    EXPECT_TRUE("Readdir0100", ret != nullptr);
    closedir(dir);
}

/**
 * @tc.name      : Readdir0200
 * @tc.desc      : The parameter is invalid, cannot return the next directory entry
 *                 point of the parameter dir directory stream.
 * @tc.level     : Level 2
 */
void Readdir0200(void)
{
    struct __dirstream* dir = (struct __dirstream*)calloc(1, sizeof(struct __dirstream));
    if (dir == nullptr) {
        EXPECT_PTRNE("Readdir0200", dir, nullptr);
        return;
    }
    EXPECT_TRUE(" Readdir0200", readdir(dir) == nullptr);

    free(dir);
}

static int ReaddirTestImpl(int argc, char* argv[])
{
    Readdir0100();
    Readdir0200();

    return T_STATUS;
}

int ReaddirTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return ReaddirTestImpl(1, libcArgvStub);
}
