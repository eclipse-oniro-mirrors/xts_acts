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

static const int LC_MARK_ARRY[] = {LC_PAPER_MASK,
    LC_NAME_MASK,
    LC_ADDRESS_MASK,
    LC_TELEPHONE_MASK,
    LC_MEASUREMENT_MASK,
    LC_IDENTIFICATION_MASK,
    LC_ALL_MASK};

/**
 * @tc.name      : newlocale_0100
 * @tc.desc      : Check whether the LC_ALL type is passed to newlocale to create a custom locale environment
 * @tc.level     : Level 0
 */
static void Newlocale0100(void)
{
    char *lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("newlocale_0100", lo, nullptr);
        return;
    }
    locale_t newLocale = newlocale(LC_ALL_MASK, "en_US", nullptr);
    EXPECT_PTRNE("newlocale_0100", newLocale, nullptr);

    if (newLocale) {
        freelocale(newLocale);
        newLocale = nullptr;
    }
}

/**
 * @tc.name      : newlocale_0200
 * @tc.desc      : Check whether the LC_ALL type is passed to newlocale to create a custom locale environment
 * @tc.level     : Level 0
 */
static void Newlocale0200(void)
{
    char *lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("newlocale_0200", lo, nullptr);
        return;
    }
    locale_t newLocale = newlocale(LC_ALL_MASK, "C", nullptr);
    EXPECT_PTRNE("newlocale_0200", newLocale, nullptr);

    if (newLocale) {
        freelocale(newLocale);
        newLocale = nullptr;
    }
}

/**
 * @tc.name      : newlocale_0300
 * @tc.desc      : Determines whether the custom locale environment is created successfully
 * by passing different LC data types to newlocale
 * @tc.level     : Level 0
 */
static void Newlocale0300(void)
{
    char *lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("newlocale_0300", lo, nullptr);
        return;
    }
    for (int i = 0; i < sizeof(LC_MARK_ARRY) / sizeof(LC_MARK_ARRY[0]); i++) {
        locale_t newLocale = newlocale(LC_MARK_ARRY[i], "en_US", nullptr);
        EXPECT_PTRNE("newlocale_0300", newLocale, nullptr);

        if (newLocale) {
            freelocale(newLocale);
            newLocale = nullptr;
        }
    }
}

static int NewlocaleSupTestImpl(void)
{
    Newlocale0100();
    Newlocale0200();
    Newlocale0300();

    return g_tStatus;
}

int NewlocaleSupTest(void)
{
    return NewlocaleSupTestImpl();
}
