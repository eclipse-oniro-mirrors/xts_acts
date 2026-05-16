/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <climits>
#include "functionalext.h"

/**
 * @tc.name      : Ftrylockfile0100
 * @tc.desc      : The parameter is valid, the ftrylockfile function can lock the file.
 * @tc.level     : Level 0
 */
void Ftrylockfile0100(void)
{
    int ret = -1;
    FILE *fptr = fopen("/data/storage/el2/base/cache/ftrylockfile.txt", "w+");
    EXPECT_PTRNE("Ftrylockfile0100", fptr, NULL);
    ret = ftrylockfile(fptr);
    EXPECT_EQ("Ftrylockfile0100", ret, 0);
    funlockfile(fptr);
    (void)fclose(fptr);
    (void)remove("ftrylockfile.txt");
}

static int FtrylockfileTestImpl(int argc, char *argv[])
{
    Ftrylockfile0100();
    return g_tStatus;
}

int FtrylockfileTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return FtrylockfileTestImpl(1, libcArgv);
}
