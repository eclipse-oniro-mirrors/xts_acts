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

#include <mntent.h>
#include "functionalext.h"

/**
 * @tc.name      : getmntent_0100
 * @tc.desc      : The parameters are valid and the file information can be read.
 * @tc.level     : Level 0
 */
void Getmntent0100(void)
{
    char c[1000];
    char str[100];
    FILE* fptr = nullptr;
    if ((fptr = fopen("/proc/mounts", "r")) == nullptr) {
        t_error("%s Error! fopen failed\n", __func__);
    }
    int readRet = fscanf(fptr, "%999s", c);
    EXPECT_NE("getmntent_0100", readRet, EOF);
    int closeRet = fclose(fptr);
    EXPECT_EQ("getmntent_0100", closeRet, 0);
    int parseRet = sscanf(c, "%99s", str);
    EXPECT_EQ("getmntent_0100", parseRet, 1);
    struct mntent* m = nullptr;
    FILE* ffp = setmntent("/proc/mounts", "r");
    EXPECT_PTRNE("getmntent_0100", ffp, nullptr);
    m = getmntent(ffp);
    EXPECT_TRUE("getmntent_0100", m != nullptr);
    EXPECT_EQ("getmntent_0100", strcmp(m->mnt_fsname, str), 0);

    int endRet = endmntent(ffp);
    EXPECT_EQ("getmntent_0100", endRet, 1);
}

/**
 * @tc.name      : getmntent_0200
 * @tc.desc      : Invalid parameter, failed to read file information.
 * @tc.level     : Level 2
 */
void Getmntent0200(void)
{
    char c[1000];
    char* str = "This is a test";
    static const char* path = "/data/storage/el2/base/cache/getmntent.txt";
    FILE* fp = fopen(path, "w");
    EXPECT_PTRNE("getmntent_0200", fp, nullptr);
    int putsRet = fputs(str, fp);
    EXPECT_NE("getmntent_0200", putsRet, EOF);
    int closeRet = fclose(fp);
    EXPECT_EQ("getmntent_0200", closeRet, 0);
    struct mntent* m = nullptr;
    FILE* ffp = setmntent(path, "r");
    EXPECT_PTRNE("getmntent_0200", ffp, nullptr);

    m = getmntent(ffp);
    EXPECT_EQ("getmntent_0200", m, nullptr);
    int endRet = endmntent(ffp);
    EXPECT_EQ("getmntent_0200", endRet, 1);
    int removeRet = remove(path);
    EXPECT_EQ("getmntent_0200", removeRet, 0);
}

static int GetmntentTestImpl(void)
{
    Getmntent0100();
    Getmntent0200();
    return T_STATUS;
}

int GetmntentTest(void)
{
    return GetmntentTestImpl();
}
