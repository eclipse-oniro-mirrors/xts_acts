/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
#include <cstring>
#include "test.h"

/**
 * @tc.name      : Strcasestr0100
 * @tc.desc      : test strcasestr method to intercept string
 * @tc.level     : Level 0
 */
void Strcasestr0100(void)
{
    char* haystate = "bIg dAdDy/gIaNt hAyStAcKs";
    char* result = strcasestr(haystate, "");
    if (strcmp(result, "bIg dAdDy/gIaNt hAyStAcKs") != 0) {
        t_error("%s strcasestr error get result is %s\n", __func__, result);
    }
}

/**
 * @tc.name      : Strcasestr0200
 * @tc.desc      : test strcasestr method incoming uppercase letter interception
 * @tc.level     : Level 1
 */
void Strcasestr0200(void)
{
    char* haystate = "bIg dAdDy/gIaNt hAyStAcKs";
    char* result = strcasestr(haystate, "B");
    if (strcmp(result, "bIg dAdDy/gIaNt hAyStAcKs") != 0) {
        t_error("%s strcasestr error get result is %s\n", __func__, result);
    }
}

/**
 * @tc.name      : Strcasestr0300
 * @tc.desc      : test strcasestr method incoming lowercase letter interception
 * @tc.level     : Level 1
 */
void Strcasestr0300(void)
{
    char* haystate = "bIg dAdDy/gIaNt hAyStAcKs";
    char* result = strcasestr(haystate, "i");
    if (strcmp(result, "Ig dAdDy/gIaNt hAyStAcKs") != 0) {
        t_error("%s strcasestr error get result is %s\n", __func__, result);
    }
}

/**
 * @tc.name      : Strcasestr0400
 * @tc.desc      : test strcasestr method incoming string interception
 * @tc.level     : Level 1
 */
void Strcasestr0400(void)
{
    char* haystate = "bIg dAdDy/gIaNt hAyStAcKs";
    char* result = strcasestr(haystate, "Da");
    if (strcmp(result, "dAdDy/gIaNt hAyStAcKs") != 0) {
        t_error("%s strcasestr error get result is %s\n", __func__, result);
    }
}

static int StrcasestrTestImpl(int argc, char* argv[])
{
    Strcasestr0100();
    Strcasestr0200();
    Strcasestr0300();
    Strcasestr0400();
    return T_STATUS;
}

int StrcasestrTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return StrcasestrTestImpl(1, libcArgvStub);
}
