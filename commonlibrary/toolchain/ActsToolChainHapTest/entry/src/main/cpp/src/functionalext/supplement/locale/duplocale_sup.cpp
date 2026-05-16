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
 * @tc.name      : Duplocale0100
 * @tc.desc      : Asserts whether duplocale returns a null value for the global locale
 * @tc.level     : Level 0
 */
void Duplocale0100(void)
{
    char* lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("Duplocale0100", lo, nullptr);
        return;
    }

    locale_t newlocale = duplocale(LC_GLOBAL_LOCALE);
    EXPECT_TRUE("Duplocale0100", newlocale);
    if (newlocale) {
        freelocale(newlocale);
        newlocale = nullptr;
    }
}

/**
 * @tc.name      : Duplocale0200
 * @tc.desc      : Asserts that duplocale jumps first to the global locale and then to the custom locale,
 *                 expecting that the results of the two calls are not equal
 * @tc.level     : Level 0
 */
void Duplocale0200(void)
{
    char* lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("Duplocale0200", lo, nullptr);
        return;
    }

    locale_t global = duplocale(LC_GLOBAL_LOCALE);
    EXPECT_PTRNE("Duplocale0200", global, nullptr);

    locale_t localeNew = newlocale(LC_ALL_MASK, "en_US", nullptr);
    EXPECT_PTRNE("Duplocale0200", localeNew, nullptr);

    locale_t clonelocale = duplocale(localeNew);
    EXPECT_PTRNE("Duplocale0200", clonelocale, nullptr);
    EXPECT_PTRNE("Duplocale0200", clonelocale, global);

    if (clonelocale) {
        freelocale(clonelocale);
        clonelocale = nullptr;
    }
    if (localeNew) {
        freelocale(localeNew);
        localeNew = nullptr;
    }
    if (global) {
        freelocale(global);
        global = nullptr;
    }
}

int DuplocaleSupTest(void)
{
    Duplocale0100();
    Duplocale0200();
    return T_STATUS;
}