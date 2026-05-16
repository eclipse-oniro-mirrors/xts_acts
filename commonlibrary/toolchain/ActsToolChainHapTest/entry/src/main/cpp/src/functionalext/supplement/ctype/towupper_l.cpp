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
#include <clocale>
#include <dlfcn.h>
#include "test.h"

#define MAX_VALUE 4294967295
/**
 * @tc.name      : towupper_l_0100
 * @tc.desc      : Verify towupper_l process success when using the en_US.UTF-8 character set.
 *                 Input parameters are Uppercase letters, verify conversion to Lowercase letters.
 * @tc.level     : Level 1
 */
void TowupperL0100(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    const char *upstr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const char *lowstr = "abcdefghijklmnopqrstuvwxyz";
    const char *up = upstr;
    const char *lp = lowstr;
    wint_t res = 0;

    if (!mLocale) {
        t_error("Test case %s failed to call function newlocale\n", __FUNCTION__);
        return;
    }

    while (up && *up != '\0' && lp && *lp != '\0') {
        res = towupper_l(*lp, mLocale);
        if (res != *up) {
            t_error("Test case %s failed, get result is %c but want get value %c\n", __FUNCTION__, (char)res, *lp);
        }
        up++;
        lp++;
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : towupper_l_0200
 * @tc.desc      : Verify towupper_l process fail when using the en_US.UTF-8 character set.
 *                 Input parameters as numbers, verify conversion to Lowercase letters.
 * @tc.level     : Level 1
 */
void TowupperL0200(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    const char *str = "0123456789";
    const char *p = str;
    wint_t res = 0;

    if (!mLocale) {
        t_error("Test case %s failed to call function newlocale\n", __FUNCTION__);
        return;
    }

    while (p && *p != '\0') {
        res = towupper_l(*p, mLocale);
        if (res != *p) {
            t_error("Test case %s failed, result is %c but want get value %c \n", __FUNCTION__, (char)res, *p);
        }
        p++;
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : towupper_l_0300
 * @tc.desc      : Verify towupper_l process fail when using the zh_CN character set.
 *                 Input parameters as numbers, verify conversion to Lowercase letters.
 * @tc.level     : Level 1
 */
void TowupperL0300(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "zh_CN", nullptr);
    const char *str = "0123456789";
    const char *p = str;
    wint_t res = 0;

    if (!mLocale) {
        t_error("Test case %s failed to call function newlocale\n", __FUNCTION__);
        return;
    }

    while (p && *p != '\0') {
        res = towupper_l(*p, mLocale);
        if (res != *p) {
            t_error("Test case %s failed, result is %c but want get value %c \n", __FUNCTION__, (char)res, *p);
        }
        p++;
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : towupper_l_0400
 * @tc.desc      : Verify towlower_l process success when using the zh_CN character set.
 *                 Input parameters are Uppercase letters, verify conversion to Lowercase letters.
 * @tc.level     : Level 1
 */
void TowupperL0400(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "zh_CN", nullptr);
    const char *upstr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const char *lowstr = "abcdefghijklmnopqrstuvwxyz";
    const char *up = upstr;
    const char *lp = lowstr;
    wint_t res = 0;

    if (!mLocale) {
        t_error("Test case %s failed to call function newlocale\n", __FUNCTION__);
        return;
    }

    while (up && *up != '\0' && lp && *lp != '\0') {
        res = towupper_l(*lp, mLocale);
        if (res != *up) {
            t_error("Test case %s failed, get result is %c but want get value %c\n", __FUNCTION__, (char)res, *lp);
        }
        up++;
        lp++;
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : towupper_l_0500
 * @tc.desc      : Verify towupper_l process success when using the zh_CN character set.
 *                 Input parameter is the maximum value of int, please verify that the return is -1
 * @tc.level     : Level 1
 */
void TowupperL0500(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "zh_CN", nullptr);
    wint_t res = towupper_l(MAX_VALUE, mLocale);
    if (res != -1) {
        t_error("Test case %s failed, get result is -1 but want get value %d\n", __FUNCTION__, res);
    }
    freelocale(mLocale);
}

/**
 * @tc.name      : towupper_l_0600
 * @tc.desc      : Verify towupper_l process success when using the en_US.UTF-8 character set.
 *                 Input parameter is the maximum value of int, please verify that the return is -1
 * @tc.level     : Level 1
 */
void TowupperL0600(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    wint_t res = towupper_l(MAX_VALUE, mLocale);
    if (res != -1) {
        t_error("Test case %s failed, get result is -1 but want get value %d\n", __FUNCTION__, res);
    }
    freelocale(mLocale);
}

static int TowupperLTestImpl(int argc, char *argv[])
{
    typedef void (*SetWctypeIcuEnableFunc)(void);
    SetWctypeIcuEnableFunc setWctypeIcuEnable = (SetWctypeIcuEnableFunc)dlsym(RTLD_DEFAULT, "set_wctype_icu_enable");
    setWctypeIcuEnable();
    TowupperL0100();
    TowupperL0200();
    TowupperL0300();
    TowupperL0400();
    TowupperL0500();
    TowupperL0600();
    return g_tStatus;
}

int TowupperLTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TowupperLTestImpl(1, libcArgv);
}
