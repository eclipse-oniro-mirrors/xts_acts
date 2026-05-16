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
 * @tc.name      : duplocale_0100
 * @tc.desc      : Asserts whether duplocale returns a null value for the global locale
 * @tc.level     : Level 0
 */
static void Duplocale0100(void)
{
    char *lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("duplocale_0100", lo, nullptr);
        return;
    }

    locale_t newLocale = duplocale(LC_GLOBAL_LOCALE);
    EXPECT_TRUE("duplocale_0100", newLocale);
    if (newLocale) {
        freelocale(newLocale);
        newLocale = nullptr;
    }
}

/**
 * @tc.name      : duplocale_0200
 * @tc.desc      : Asserts that duplocale jumps first to the global locale and then to the custom locale,
 * expecting that the results of the two calls are not equal
 * @tc.level     : Level 0
 */
static void Duplocale0200(void)
{
    char *lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("duplocale_0200", lo, nullptr);
        return;
    }

    locale_t global = duplocale(LC_GLOBAL_LOCALE);
    EXPECT_PTRNE("duplocale_0200", global, nullptr);

    locale_t newLocale = newlocale(LC_ALL_MASK, "en_US", nullptr);
    EXPECT_PTRNE("duplocale_0200", newLocale, nullptr);

    locale_t cloneLocale = duplocale(newLocale);
    EXPECT_PTRNE("duplocale_0200", cloneLocale, nullptr);
    EXPECT_PTRNE("duplocale_0200", cloneLocale, global);

    if (cloneLocale) {
        freelocale(cloneLocale);
        cloneLocale = nullptr;
    }
    if (newLocale) {
        freelocale(newLocale);
        newLocale = nullptr;
    }
    if (global) {
        freelocale(global);
        global = nullptr;
    }
}

int DuplocaleTest(void)
{
    Duplocale0100();
    Duplocale0200();
    return g_tStatus;
}