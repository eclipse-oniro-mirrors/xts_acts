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

static const int LC_MARK_ARRY[] = { LC_PAPER_MASK,       LC_NAME_MASK,           LC_ADDRESS_MASK, LC_TELEPHONE_MASK,
                                    LC_MEASUREMENT_MASK, LC_IDENTIFICATION_MASK, LC_ALL_MASK };

/**
 * @tc.name      : Newlocale0100
 * @tc.desc      : en-US is a invalid locale. The newlocale should return null
 * @tc.level     : Level 0
 */
void Newlocale0100(void)
{
    char* lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("Newlocale0100", lo, nullptr);
        return;
    }
    locale_t newloc = newlocale(LC_ALL_MASK, "en_US", nullptr);
    EXPECT_PTRNE("Newlocale0100", newloc, nullptr);

    if (newloc) {
        freelocale(newloc);
        newloc = nullptr;
    }
}

/**
 * @tc.name      : Newlocale0200
 * @tc.desc      : Check whether the LC_ALL type is passed to newlocale to create a custom locale environment
 * @tc.level     : Level 0
 */
void Newlocale0200(void)
{
    char* lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("Newlocale0200", lo, nullptr);
        return;
    }
    locale_t newloc = newlocale(LC_ALL_MASK, "C", nullptr);
    EXPECT_PTRNE("Newlocale0200", newloc, nullptr);

    if (newloc) {
        freelocale(newloc);
        newloc = nullptr;
    }
}

/**
 * @tc.name      : Newlocale0300
 * @tc.desc      : Determines whether the custom locale environment is created successfully
 * by passing different LC data types to newlocale
 * tips: en-US is a invalid locale. The newlocale should return null
 * @tc.level     : Level 0
 */
void Newlocale0300(void)
{
    char* lo = setlocale(LC_ALL, "C");
    if (!lo) {
        EXPECT_PTRNE("Newlocale0300", lo, nullptr);
        return;
    }
    for (int i = 0; i < sizeof(LC_MARK_ARRY) / sizeof(LC_MARK_ARRY[0]); i++) {
        locale_t newloc = newlocale(LC_MARK_ARRY[i], "en_US", nullptr);
        EXPECT_PTRNE("Newlocale0300", newloc, nullptr);

        if (newloc) {
            freelocale(newloc);
            newloc = nullptr;
        }
    }
}

/**
 * @tc.name      : Newlocale0400
 * @tc.desc      : Determines whether the custom locale environment is created successfully
 * by passing different LC data types to newlocale
 * tips: en-US is a invalid locale. The newlocale should return null
 * @tc.level     : Level 0
 */
void Newlocale0400(void)
{
    for (int i = 0; i < sizeof(LC_MARK_ARRY) / sizeof(LC_MARK_ARRY[0]); i++) {
        locale_t newloc = newlocale(LC_MARK_ARRY[i], "C", nullptr);
        EXPECT_PTRNE("Newlocale0400", newloc, nullptr);

        if (newloc) {
            freelocale(newloc);
            newloc = nullptr;
        }

        newloc = newlocale(LC_MARK_ARRY[i], "C.UTF-8", nullptr);
        EXPECT_PTRNE("Newlocale0400", newloc, nullptr);

        if (newloc) {
            freelocale(newloc);
            newloc = nullptr;
        }
    }
}

/**
 * @tc.name      : Newlocale0500
 * @tc.desc      : Determines whether the custom locale environment is created successfully
 * by passing different LC data types to newlocale zh_CN and zh_CN.UTF-8
 * @tc.level     : Level 0
 */
void Newlocale0500(void)
{
    for (int i = 0; i < sizeof(LC_MARK_ARRY) / sizeof(LC_MARK_ARRY[0]); i++) {
        locale_t newloc = newlocale(LC_MARK_ARRY[i], "zh_CN", nullptr);
        EXPECT_PTRNE("Newlocale0500", newloc, nullptr);

        if (newloc) {
            freelocale(newloc);
            newloc = nullptr;
        }

        newloc = newlocale(LC_MARK_ARRY[i], "zh_CN.UTF-8", nullptr);
        EXPECT_PTRNE("Newlocale0500", newloc, nullptr);

        if (newloc) {
            freelocale(newloc);
            newloc = nullptr;
        }
    }
}

/**
 * @tc.name      : Newlocale0600
 * @tc.desc      : Set de_DE to newlocale, which is not supported and should return nullptr
 * @tc.level     : Level 0
 */
void Newlocale0600(void)
{
    locale_t newloc = newlocale(LC_ALL_MASK, "de_DE", nullptr);
    EXPECT_PTREQ("Newlocale0600", newloc, nullptr);

    if (newloc) {
        freelocale(newloc);
        newloc = nullptr;
    }
}

static int NewlocaleTestImpl(void)
{
    Newlocale0100();
    Newlocale0200();
    Newlocale0300();
    Newlocale0400();
    Newlocale0500();
    Newlocale0600();

    return T_STATUS;
}

int NewlocaleTest(void)
{
    return NewlocaleTestImpl();
}
