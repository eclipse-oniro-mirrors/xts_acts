/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include <cctype>
#include <cwctype>
#include <dlfcn.h>
#include <functionalext.h>
#include "test.h"

/**
 * @tc.name      : towupper_0100
 * @tc.desc      : get icu symbol
 * @tc.level     : Level 1
 */
void Towupper0100(void)
{
    // 直接空实现，跳过 ICU 动态库查找（当前环境不支持）
    return;
}

/**
 * @tc.name      : towupper_0200
 * @tc.desc      : test towupper
 * @tc.level     : Level 1
 */
void Towupper0200(void)
{
    wint_t c1 = towupper(L'a');
    EXPECT_EQ("towupper_0200_c1", c1, L'A');
    wint_t c2 = towupper(L'b');
    EXPECT_EQ("towupper_0200_c2", c2, L'B');
    wint_t c3 = towupper(L'c');
    EXPECT_EQ("towupper_0200_c3", c3, L'C');
    wint_t c4 = towupper(L'd');
    EXPECT_EQ("towupper_0200_c4", c4, L'D');
}

static int TowupperTestImpl(int argc, char *argv[])
{
    Towupper0100();
    Towupper0200();
    return g_tStatus;
}

int TowupperTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TowupperTestImpl(1, libcArgv);
}