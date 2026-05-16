/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// WARNING: failed to inject status
#include <langinfo.h>
#include <type_traits>
#include "libc_test_shim.h"
template <typename Ty> static void UseType()
{
    auto* unused = static_cast<std::add_pointer_t<Ty>>(nullptr);
    (void)unused;
}

static void ConsumeInt(int n)
{
    (void)n;
}

static void ConsumeWeekdayItems()
{
    ConsumeInt(DAY_1);
    ConsumeInt(DAY_2);
    ConsumeInt(DAY_3);
    ConsumeInt(DAY_4);
    ConsumeInt(DAY_5);
    ConsumeInt(DAY_6);
    ConsumeInt(DAY_7);
    ConsumeInt(ABDAY_1);
    ConsumeInt(ABDAY_2);
    ConsumeInt(ABDAY_3);
    ConsumeInt(ABDAY_4);
    ConsumeInt(ABDAY_5);
    ConsumeInt(ABDAY_6);
    ConsumeInt(ABDAY_7);
}

static void ConsumeMonthItems()
{
    ConsumeInt(MON_1);
    ConsumeInt(MON_2);
    ConsumeInt(MON_3);
    ConsumeInt(MON_4);
    ConsumeInt(MON_5);
    ConsumeInt(MON_6);
    ConsumeInt(MON_7);
    ConsumeInt(MON_8);
    ConsumeInt(MON_9);
    ConsumeInt(MON_10);
    ConsumeInt(MON_11);
    ConsumeInt(MON_12);
    ConsumeInt(ABMON_1);
    ConsumeInt(ABMON_2);
    ConsumeInt(ABMON_3);
    ConsumeInt(ABMON_4);
    ConsumeInt(ABMON_5);
    ConsumeInt(ABMON_6);
    ConsumeInt(ABMON_7);
    ConsumeInt(ABMON_8);
    ConsumeInt(ABMON_9);
    ConsumeInt(ABMON_10);
    ConsumeInt(ABMON_11);
    ConsumeInt(ABMON_12);
}

static void ConsumeGeneralItems()
{
    ConsumeInt(CODESET);
    ConsumeInt(D_T_FMT);
    ConsumeInt(D_FMT);
    ConsumeInt(T_FMT);
    ConsumeInt(T_FMT_AMPM);
    ConsumeInt(AM_STR);
    ConsumeInt(PM_STR);
    ConsumeInt(ERA);
    ConsumeInt(ERA_D_FMT);
    ConsumeInt(ERA_D_T_FMT);
    ConsumeInt(ERA_T_FMT);
    ConsumeInt(ALT_DIGITS);
    ConsumeInt(RADIXCHAR);
    ConsumeInt(THOUSEP);
    ConsumeInt(YESEXPR);
    ConsumeInt(NOEXPR);
    ConsumeInt(CRNCYSTR);
}

static void CheckLanginfoApis()
{
    {
        char* (*p)(nl_item) = nl_langinfo;
        (void)p;
    }
    {
        char* (*p)(nl_item, locale_t) = nl_langinfo_l;
        (void)p;
    }
}

static void F()
{
    UseType<locale_t>();
    UseType<nl_item>();
    ConsumeGeneralItems();
    ConsumeWeekdayItems();
    ConsumeMonthItems();
    CheckLanginfoApis();
}

int LanginfoTest()
{
    F();
    return SUCCESS_CODE;
}
