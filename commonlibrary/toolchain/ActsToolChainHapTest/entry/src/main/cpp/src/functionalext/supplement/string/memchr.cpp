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

#include <cstdlib>
#include <cstring>
#include "functionalext.h"

const int INIT_LEN = 0;

/**
 * @tc.name       :Memchr0100
 * @tc.desc       :Verify memchr is successed and return 0.
 * @tc.level      :level 0.
 */
void Memchr0100(void)
{
    const char* srcstring = "this is a unittest";
    char fitch = 'u';
    const char* findch = static_cast<const char*>(memchr(srcstring, fitch, strlen(srcstring)));
    if (findch) {
        EXPECT_EQ("Memchr0100", fitch, findch[0]);
        EXPECT_STREQ("Memchr0100", "unittest", findch);
    } else {
        EXPECT_PTRNE("Memchr0100", findch, nullptr);
    }
}

/**
 * @tc.name       :Memchr0200
 * @tc.desc       :Verify memchr is failed and return nullptr.
 * @tc.level      :level 1.
 */
void Memchr0200(void)
{
    const char* srcstring = "this is a unittest";
    const char* findch = static_cast<const char*>(memchr(srcstring, 'w', strlen(srcstring)));
    EXPECT_PTREQ("Memchr0200", findch, nullptr);
}

/**
 * @tc.name       :Memchr0300
 * @tc.desc       :Verify memchr is failed when first param src is invalid.
 * @tc.level      :level 2.
 */
void Memchr0300(void)
{
    const char* srcstring = "";
    const char* findch = static_cast<const char*>(memchr(srcstring, 'w', strlen(srcstring)));
    EXPECT_PTREQ("Memchr0300", findch, nullptr);
}

/**
 * @tc.name       :Memchr0400
 * @tc.desc       :Verify memchr is failed when second param c is invalid.
 * @tc.level      :level 2.
 */
void Memchr0400(void)
{
    const char* srcstring = "this is a unittest";
    const char* findch = static_cast<const char*>(memchr(srcstring, '\0', strlen(srcstring)));
    EXPECT_PTREQ("Memchr0400", findch, nullptr);
}

/**
 * @tc.name       :Memchr0500
 * @tc.desc       :Verify memchr is failed when third param n is invalid.
 * @tc.level      :level 2.
 */
void Memchr0500(void)
{
    const char* srcstring = "this is a unittest";
    const char* findch = static_cast<const char*>(memchr(srcstring, 'u', INIT_LEN));
    EXPECT_PTREQ("Memchr0500", findch, nullptr);
}

static int MemchrTestImpl(void)
{
    Memchr0100();
    Memchr0200();
    Memchr0300();
    Memchr0400();
    Memchr0500();
    return T_STATUS;
}

int MemchrTest(void)
{
    return MemchrTestImpl();
}
