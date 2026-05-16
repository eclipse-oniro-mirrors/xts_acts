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

#include <clocale>
#include <cstdlib>
#include "functionalext.h"

typedef void (*TEST_FUN)();
const ssize_t COUNT_ONE = 1;
const ssize_t COUNT_FOUR = 4;

/**
 * @tc.name      : CtypeGetMbCurMax0100
 * @tc.desc      : Gets the maximum length of a multi-byte character (Western Language - Latin 1)
 * @tc.level     : Level 0
 */
void CtypeGetMbCurMax0100()
{
    (void)setlocale(LC_ALL, ".1252");
    EXPECT_TRUE("CtypeGetMbCurMax0100", __ctype_get_mb_cur_max() > 0);
}

/**
 * @tc.name      : CtypeGetMbCurMax0200
 * @tc.desc      : Gets the maximum length of a multi-byte character (UTF8)
 * @tc.level     : Level 0
 */
void CtypeGetMbCurMax0200()
{
    (void)setlocale(LC_CTYPE, "zh_CN.utf8");
    EXPECT_EQ("CtypeGetMbCurMax0200", __ctype_get_mb_cur_max(), COUNT_FOUR);
}

/**
 * @tc.name      : CtypeGetMbCurMax0300
 * @tc.desc      : Gets the maximum length of a multi-byte character (Chinese GBK)
 * @tc.level     : Level 0
 */
void CtypeGetMbCurMax0300()
{
    (void)setlocale(LC_ALL, ".936");
    EXPECT_EQ("CtypeGetMbCurMax0300", __ctype_get_mb_cur_max(), COUNT_FOUR);
}

namespace {
TEST_FUN g_gFunArray[] = {
    CtypeGetMbCurMax0100,
    CtypeGetMbCurMax0200,
    CtypeGetMbCurMax0300,
};
}

static int CtypeGetMbCurMaxTestWithArgs(int argc, char* argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(g_gFunArray[0]);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int CtypeGetMbCurMaxTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return CtypeGetMbCurMaxTestWithArgs(1, libcArgvStub);
}
