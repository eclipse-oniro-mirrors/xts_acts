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

#include <clocale>
#include <cstdlib>
#include "functionalext.h"

/**
 * @tc.name      : uselocale_0100
 * @tc.desc      : Asserts whether the result returned when uselocale passes a null pointer is the global locale
 * @tc.level     : Level 0
 */
static void Uselocale0100(void)
{
    char *rev = setlocale(LC_ALL, "C");
    if (!rev) {
        EXPECT_PTRNE("uselocale_0100", rev, nullptr);
        return;
    }
    locale_t usenow = uselocale(nullptr);
    EXPECT_PTRNE("uselocale_0100", usenow, nullptr);
    EXPECT_PTREQ("uselocale_0100", usenow, LC_GLOBAL_LOCALE);
}

/**
 * @tc.name      : uselocale_0200
 * @tc.desc      : Asserts whether a custom locale is successfully created using newLOCALE and
 *                 used using the custom locale using the uselocale function
 * @tc.level     : Level 0
 */
static void Uselocale0200(void)
{
    char *rev = setlocale(LC_ALL, "C");
    if (!rev) {
        EXPECT_PTRNE("uselocale_0200", rev, nullptr);
        return;
    }
    uselocale(nullptr);
    locale_t newLocale = newlocale(LC_PAPER_MASK, "en_ZA", nullptr);
    if (newLocale) {
        EXPECT_PTREQ("uselocale_0200", newLocale, nullptr);
        freelocale(newLocale);
        newLocale = nullptr;
        return;
    }
    newLocale = newlocale(LC_PAPER_MASK, "C.UTF-8", nullptr);
    locale_t usenow = uselocale(newLocale);
    EXPECT_PTREQ("uselocale_0200", usenow, LC_GLOBAL_LOCALE);
    locale_t it = uselocale(nullptr);
    EXPECT_PTREQ("uselocale_0200", it, newLocale);

    if (newLocale) {
        freelocale(newLocale);
        newLocale = nullptr;
    }
}

static int UselocaleSupTestImpl(void)
{
    Uselocale0100();
    Uselocale0200();

    return g_tStatus;
}

int UselocaleSupTest(void)
{
    return UselocaleSupTestImpl();
}
