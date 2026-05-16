/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <cstdlib>
#include "functionalext.h"

const int32_t INIT_LEN = 0;

/**
 * @tc.name       : Fflush0100
 * @tc.desc       : Verify fflush process success and return 0.
 * @tc.level      : level 0
 */
void Fflush0100(void)
{
    int32_t ret = fflush(nullptr);
    EXPECT_EQ("Fflush0100", ret, INIT_LEN);
}

/**
 * @tc.name       : Fflush0200
 * @tc.desc       : Verify fflush and stdout process success and return 0.
 * @tc.level      : level 0
 */
void Fflush0200(void)
{
    char array[] = "this is fflush test!";
    int32_t ret = fprintf(stdout, "%s", array);
    EXPECT_MT("Fflush0200", ret, 0);
    ret = fflush(nullptr);
    EXPECT_EQ("Fflush0200", ret, INIT_LEN);
}

/**
 * @tc.name       : Fflush0300
 * @tc.desc       : Verify fflush and stderr process success and return 0.
 * @tc.level      : level 0
 */
void Fflush0300(void)
{
    char array[] = "this is fflush error!";
    int32_t ret = fprintf(stderr, "%s", array);
    EXPECT_MT("Fflush0300", ret, 0);
    ret = fflush(nullptr);
    EXPECT_EQ("Fflush0300", ret, INIT_LEN);
}

/**
 * @tc.name       : Fflush0400
 * @tc.desc       : Verify fflush and fopen("w") and fclose process success and return 0.
 * @tc.level      : level 0
 */
void Fflush0400(void)
{
    FILE* fptr = fopen("/data/tempory_testff.Txt", "w");
    int32_t ret = 0;
    if (fptr != nullptr) {
        fputs("fopen is success", fptr);
        ret = fflush(fptr);
        (void)fclose(fptr);
    }
    EXPECT_EQ("Fflush0400", ret, INIT_LEN);
}

/**
 * @tc.name       : Fflush0500
 * @tc.desc       : Verify fflush and fopen("r") and fclose process success and return 0.
 * @tc.level      : level 0
 */
void Fflush0500(void)
{
    FILE* fptr = fopen("/data/tempory_testff.Txt", "r");
    int32_t ret = 0;
    if (fptr != nullptr) {
        ret = fflush(fptr);
        (void)fclose(fptr);
    }
    EXPECT_EQ("Fflush0500", ret, INIT_LEN);
    (void)remove("/data/tempory_testff.Txt");
}

static int FflushTestImpl(void)
{
    Fflush0100();
    Fflush0200();
    Fflush0300();
    Fflush0400();
    Fflush0500();
    return T_STATUS;
}

int FflushTest(void)
{
    return FflushTestImpl();
}
