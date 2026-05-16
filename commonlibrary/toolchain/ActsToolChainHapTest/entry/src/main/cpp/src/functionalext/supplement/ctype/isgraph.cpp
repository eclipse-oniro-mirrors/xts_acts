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

#include <cctype>
#include "functionalext.h"

/**
 * @tc.name      : Isgraph0100
 * @tc.desc      : Whether the characters in a string are printable characters
 * @tc.level     : Level 0
 */
void Isgraph0100(void)
{
    const char* str = "1qw@#";
    const char* p = str;
    while (*p != '\0') {
        int ret = isgraph(*p);
        EXPECT_EQ("Isgraph0100", ret, ONREXPECT);
        p++;
    }
}

/**
 * @tc.name      : Isgraph0200
 * @tc.desc      : Whether the characters in a string are none-printable characters
 * @tc.level     : Level 2
 */
void Isgraph0200(void)
{
    const char* str = " ";
    const char* p = str;
    while (*p != '\0') {
        int ret = isgraph(*p);
        EXPECT_EQ("Isgraph0200", ret, CMPFLAG);
        p++;
    }
}

static int IsgraphTestImpl(void)
{
    Isgraph0100();
    Isgraph0200();
    return T_STATUS;
}

int IsgraphTest(void)
{
    return IsgraphTestImpl();
}
