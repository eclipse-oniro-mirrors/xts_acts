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

#include <dirent.h>
#include "functionalext.h"

/**
 * @tc.name      : alphasort_0100
 * @tc.desc      : Verify that the directory structure can be sorted alphabetically
 * @tc.level     : Level 0
 */
void Alphasort0100(void)
{
    struct dirent **namelist;
    int total = scandir("/data/storage/el2/base/cache", &namelist, 0, alphasort);
    EXPECT_TRUE("alphasort_0100", total > 0);
}

/**
 * @tc.name      : alphasort_0200
 * @tc.desc      : Verify that the directory structure cannot be sorted alphabetically
 * @tc.level     : Level 2
 */
void Alphasort0200(void)
{
    struct dirent **namelist;
    int total = scandir(nullptr, &namelist, 0, alphasort);
    EXPECT_TRUE("alphasort_0100", total < 0);
}

static int AlphasortTestWithArgs(int argc, char *argv[])
{
    Alphasort0100();
    Alphasort0200();
    return g_tStatus;
}

int AlphasortTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return AlphasortTestWithArgs(1, libcArgv);
}
