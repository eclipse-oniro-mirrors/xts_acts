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
#include "functionalext.h"

#define ARRY_MAX 128

/**
 * @tc.name      : Mblen0100
 * @tc.desc      : Verify mblen process success when wide string is not nullptr.
 * @tc.level     : Level 0
 */
void Mblen0100(void)
{
    char* src = (char*)malloc(ARRY_MAX);
    if (!src) {
        return;
    }
    wchar_t* pwc = L"Mblen0100";
    wchar_t* pwcs = (wchar_t*)malloc(sizeof(wchar_t));
    EXPECT_PTRNE("Mblen0100", pwcs, nullptr);
    int result = wcstombs(src, pwc, ARRY_MAX);
    EXPECT_NE("Mblen0100", result, -1);
    size_t ret = mblen(src, ARRY_MAX);
    EXPECT_EQ("Mblen0100", ret, 1);
    free(src);
    free(pwcs);
}

/**
 * @tc.name      : Mblen0200
 * @tc.desc      : Verify mblen process success when wide string is nullptr.
 * @tc.level      : Level 0
 */
void Mblen0200(void)
{
    size_t ret = mblen(nullptr, ARRY_MAX);
    EXPECT_EQ("Mblen0200", ret, 0);
}

static int MblenTestImpl(void)
{
    Mblen0100();
    Mblen0200();
    return T_STATUS;
}

int MblenTest(void)
{
    return MblenTestImpl();
}
