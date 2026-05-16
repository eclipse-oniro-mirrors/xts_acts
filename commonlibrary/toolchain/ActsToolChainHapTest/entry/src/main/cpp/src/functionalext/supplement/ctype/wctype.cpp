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

#include <cstdio>
#include <cstring>
#include <cwchar>
#include <cwctype>
#include "test.h"

/**
 * @tc.name      : Wctype0100
 * @tc.desc      : test the return value when wctype input parameters are alnum and error strings
 * @tc.level     : Level 0
 */
void Wctype0100(void)
{
    wctype_t expect0 = wctype("alnum");
    wctype_t target = 1;
    if (expect0 != target) {
        t_error("%s expect type is not alnum", __func__);
    }

    wctype_t expect1 = wctype("alnumm");
    if (expect1 == target) {
        t_error("%s error input type is alnum", __func__);
    }
}

/**
 * @tc.name      : Wctype0200
 * @tc.desc      : test the return value when wctype input parameters are alpha and error strings
 * @tc.level     : Level 0
 */
void Wctype0200(void)
{
    wctype_t expect0 = wctype("alpha");
    wctype_t target = 2;
    if (expect0 != target) {
        t_error("%s expect type is not alpha", __func__);
    }

    wctype_t expect1 = wctype("alphaa");
    if (expect1 == target) {
        t_error("%s error input type is alpha", __func__);
    }
}

/**
 * @tc.name      : Wctype0300
 * @tc.desc      : test the return value when wctype input parameters are blank and error strings
 * @tc.level     : Level 0
 */
void Wctype0300(void)
{
    wctype_t expect0 = wctype("blank");
    wctype_t target = 3;
    if (expect0 != target) {
        t_error("%s expect type is not blank", __func__);
    }

    wctype_t expect1 = wctype("blankk");
    if (expect1 == target) {
        t_error("%s error input type is blank", __func__);
    }
}

/**
 * @tc.name      : Wctype0400
 * @tc.desc      : test the return value when wctype input parameters are cntrl and error strings
 * @tc.level     : Level 0
 */
void Wctype0400(void)
{
    wctype_t expect0 = wctype("cntrl");
    wctype_t target = 4;
    if (expect0 != target) {
        t_error("%s expect type is not cntrl", __func__);
    }

    wctype_t expect1 = wctype("cntrll");
    if (expect1 == target) {
        t_error("%s error input type is cntrl", __func__);
    }
}

/**
 * @tc.name      : Wctype0500
 * @tc.desc      : test the return value when wctype input parameters are digit and error strings
 * @tc.level     : Level 0
 */
void Wctype0500(void)
{
    wctype_t expect0 = wctype("digit");
    wctype_t target = 5;
    if (expect0 != target) {
        t_error("%s expect type is not digit", __func__);
    }

    wctype_t expect1 = wctype("digitt");
    if (expect1 == target) {
        t_error("%s error input type is digit", __func__);
    }
}

/**
 * @tc.name      : Wctype0600
 * @tc.desc      : test the return value when wctype input parameters are graph and error strings
 * @tc.level     : Level 0
 */
void Wctype0600(void)
{
    wctype_t expect0 = wctype("graph");
    wctype_t target = 6;
    if (expect0 != target) {
        t_error("%s expect type is not graph", __func__);
    }

    wctype_t expect1 = wctype("graphh");
    if (expect1 == target) {
        t_error("%s error input type is graph", __func__);
    }
}

/**
 * @tc.name      : Wctype0700
 * @tc.desc      : test the return value when wctype input parameters are lower and error strings
 * @tc.level     : Level 0
 */
void Wctype0700(void)
{
    wctype_t expect0 = wctype("lower");
    wctype_t target = 7;
    if (expect0 != target) {
        t_error("%s expect type is not lower", __func__);
    }

    wctype_t expect1 = wctype("lowerr");
    if (expect1 == target) {
        t_error("%s error input type is lower", __func__);
    }
}

/**
 * @tc.name      : Wctype0800
 * @tc.desc      : test the return value when wctype input parameters are print and error strings
 * @tc.level     : Level 0
 */
void Wctype0800(void)
{
    wctype_t expect0 = wctype("print");
    wctype_t target = 8;
    if (expect0 != target) {
        t_error("%s expect type is not print", __func__);
    }

    wctype_t expect1 = wctype("printt");
    if (expect1 == target) {
        t_error("%s error input type is print", __func__);
    }
}

/**
 * @tc.name      : Wctype0900
 * @tc.desc      : test the return value when wctype input parameters are punct and error strings
 * @tc.level     : Level 0
 */
void Wctype0900(void)
{
    wctype_t expect0 = wctype("punct");
    wctype_t target = 9;
    if (expect0 != target) {
        t_error("%s expect type is not punct", __func__);
    }

    wctype_t expect1 = wctype("punctt");
    if (expect1 == target) {
        t_error("%s error input type is punct", __func__);
    }
}

/**
 * @tc.name      : Wctype1000
 * @tc.desc      : test the return value when wctype input parameters are space and error strings
 * @tc.level     : Level 0
 */
void Wctype1000(void)
{
    wctype_t expect0 = wctype("space");
    wctype_t target = 10;
    if (expect0 != target) {
        t_error("%s expect type is not space", __func__);
    }

    wctype_t expect1 = wctype("spacee");
    if (expect1 == target) {
        t_error("%s error input type is space", __func__);
    }
}

/**
 * @tc.name      : Wctype1100
 * @tc.desc      : test the return value when wctype input parameters are upper and error strings
 * @tc.level     : Level 0
 */
void Wctype1100(void)
{
    wctype_t expect0 = wctype("upper");
    wctype_t target = 11;
    if (expect0 != target) {
        t_error("%s expect type is not upper", __func__);
    }

    wctype_t expect1 = wctype("upperr");
    if (expect1 == target) {
        t_error("%s error input type is upper", __func__);
    }
}

/**
 * @tc.name      : Wctype1200
 * @tc.desc      : test the return value when wctype input parameters are xdigit and error strings
 * @tc.level     : Level 0
 */
void Wctype1200(void)
{
    wctype_t expect0 = wctype("xdigit");
    wctype_t target = 12;
    if (expect0 != target) {
        t_error("%s expect type is not xdigit", __func__);
    }

    wctype_t expect1 = wctype("xdigitt");
    if (expect1 == target) {
        t_error("%s error input type is xdigit", __func__);
    }
}

static int WctypeTestImpl(int argc, char* argv[])
{
    Wctype0100();
    Wctype0200();
    Wctype0300();
    Wctype0400();
    Wctype0500();
    Wctype0600();
    Wctype0700();
    Wctype0800();
    Wctype0900();
    Wctype1000();
    Wctype1100();
    Wctype1200();
    return T_STATUS;
}

int WctypeTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WctypeTestImpl(1, libcArgvStub);
}
