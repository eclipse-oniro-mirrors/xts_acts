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

#include "functionalext.h"

/**
 * @tc.name      : remove_0100
 * @tc.desc      : The parameter is valid and the file can be deleted.
 * @tc.level     : Level 0
 */
void Remove0100(void)
{
    const char *ptr = "/data/storage/el2/base/cache/test.txt";
    FILE *fptr = fopen(ptr, "w");
    EXPECT_TRUE("remove_0100", fptr != NULL);
    (void)fclose(fptr);
    int ret = remove(ptr);
    EXPECT_EQ("remove_0100", ret, 0);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : Remove0200
 * @tc.desc      : The parameter is invalid and the file cannot be deleted.
 * @tc.level     : Level 2
 */
void Remove0200(void)
{
    const char *ptr = "/data/storage/el2/base/cache/test.txt";
    int ret = remove(ptr);
    EXPECT_EQ("Remove0200", ret, -1);
    ptr = nullptr;
}

static int RemoveTestImpl(int argc, char *argv[])
{
    Remove0100();
    Remove0200();
    return g_tStatus;
}

int RemoveTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return RemoveTestImpl(1, libcArgv);
}
