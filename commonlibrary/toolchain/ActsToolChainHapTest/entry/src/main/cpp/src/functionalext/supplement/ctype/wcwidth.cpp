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

#include <cstdio>
#include <cstring>
#include <cwchar>
#include <cwctype>
#include "test.h"

const int INPUT_VALUE[12] = { 0x0300, 0x20dd, 0x00ad,  0x200b,  0x4e00, 0x9fff,
                              0x3400, 0x4dbf, 0x20000, 0x2a6df, 0xac00, 0xd7a3 };
const int RESULT_VALUE = 2;

/**
 * @tc.name      : Wcwidth0100
 * @tc.desc      : test that the wcwidth method returns the desired number of columns
 * @tc.level     : Level 0
 */
void Wcwidth0100(void)
{
    int result = wcwidth(0);
    if (result != 0) {
        t_error("%s wcwidth get result is %d are not want 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth0200
 * @tc.desc      : Combining grave
 * @tc.level     : Level 1
 */
void Wcwidth0200(void)
{
    int result = wcwidth(INPUT_VALUE[0]);
    if (result != 0) {
        t_error("%s wcwidth get result is %d are not want 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth0300
 * @tc.desc      : Combining enclosing circle
 * @tc.level     : Level 1
 */
void Wcwidth0300(void)
{
    int result = wcwidth(INPUT_VALUE[1]);
    if (result != 0) {
        t_error("%s wcwidth get result is %d are not want 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth0400
 * @tc.desc      : Soft hyphen (SHY)
 * @tc.level     : Level 1
 */
void Wcwidth0400(void)
{
    int result = wcwidth(INPUT_VALUE[2]);
    if (result != 1) {
        t_error("%s wcwidth get result is %d are not want 1\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth0500
 * @tc.desc      : Zero width space
 * @tc.level     : Level 1
 */
void Wcwidth0500(void)
{
    int result = wcwidth(INPUT_VALUE[3]);
    if (result != 0) {
        t_error("%s wcwidth get result is %d are not want 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth0600
 * @tc.desc      :  start of CJK unified block
 * @tc.level     : Level 1
 */
void Wcwidth0600(void)
{
    int result = wcwidth(INPUT_VALUE[4]);
    if (result != RESULT_VALUE) {
        t_error("%s wcwidth get result is %d are not want 2\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth0700
 * @tc.desc      : End of CJK unified block
 * @tc.level     : Level 1
 */
void Wcwidth0700(void)
{
    int result = wcwidth(INPUT_VALUE[5]);
    if (result != RESULT_VALUE) {
        t_error("%s wcwidth get result is %d are not want 2\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth0800
 * @tc.desc      : start of CJK extension A block.
 * @tc.level     : Level 1
 */
void Wcwidth0800(void)
{
    int result = wcwidth(INPUT_VALUE[6]);
    if (result != RESULT_VALUE) {
        t_error("%s wcwidth get result is %d are not want 2\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth0900
 * @tc.desc      : End of CJK extension A block.
 * @tc.level     : Level 1
 */
void Wcwidth0900(void)
{
    int result = wcwidth(INPUT_VALUE[7]);
    if (result != RESULT_VALUE) {
        t_error("%s wcwidth get result is %d are not want 2\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth1000
 * @tc.desc      : start of CJK extension B block.
 * @tc.level     : Level 1
 */
void Wcwidth1000(void)
{
    int result = wcwidth(INPUT_VALUE[8]);
    if (result != RESULT_VALUE) {
        t_error("%s wcwidth get result is %d are not want 2\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth1100
 * @tc.desc      : End of CJK extension B block.
 * @tc.level     : Level 1
 */
void Wcwidth1100(void)
{
    int result = wcwidth(INPUT_VALUE[9]);
    if (result != RESULT_VALUE) {
        t_error("%s wcwidth get result is %d are not want 2\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth1200
 * @tc.desc      : start of block
 * @tc.level     : Level 1
 */
void Wcwidth1200(void)
{
    int result = wcwidth(INPUT_VALUE[10]);
    if (result != RESULT_VALUE) {
        t_error("%s wcwidth get result is %d are not want 2\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth1300
 * @tc.desc      : End of defined code points in Unicode 7
 * @tc.level     : Level 1
 */
void Wcwidth1300(void)
{
    int result = wcwidth(INPUT_VALUE[11]);
    if (result != RESULT_VALUE) {
        t_error("%s wcwidth get result is %d are not want 2\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth1400
 * @tc.desc      : Korean "crying" emoticon.
 * @tc.level     : Level 1
 */
void Wcwidth1400(void)
{
    int result = wcwidth(L'ㅜ');
    if (result != RESULT_VALUE) {
        t_error("%s wcwidth get result is %d are not want 2\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcwidth1500
 * @tc.desc      : Korean "laughing" emoticon..
 * @tc.level     : Level 1
 */
void Wcwidth1500(void)
{
    int result = wcwidth(L'ㅋ');
    if (result != RESULT_VALUE) {
        t_error("%s wcwidth get result is %d are not want 2\n", __func__, result);
    }
}

static int WcwidthTestImpl(int argc, char* argv[])
{
    Wcwidth0100();
    Wcwidth0200();
    Wcwidth0300();
    Wcwidth0400();
    Wcwidth0500();
    Wcwidth0600();
    Wcwidth0700();
    Wcwidth0800();
    Wcwidth0900();
    Wcwidth1000();
    Wcwidth1100();
    Wcwidth1200();
    Wcwidth1300();
    Wcwidth1400();
    Wcwidth1500();
    return T_STATUS;
}

int WcwidthTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcwidthTestImpl(1, libcArgvStub);
}
