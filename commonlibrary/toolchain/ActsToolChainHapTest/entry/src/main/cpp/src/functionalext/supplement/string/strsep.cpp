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
 * @tc.name      : Strsep0100
 * @tc.desc      : test calling strsep function to intercept string
 * @tc.level     : Level 0
 */
void Strsep0100(void)
{
    char str[12] = "helloworld";
    char* p = str;
    char* sep = "w";
    char* result = strsep(&p, sep);
    if (strcmp(result, "hello") != 0) {
        t_error("%s strsep get result is '%s' are not 'hello'\n", __func__, result);
    }
    if (strcmp(str, "hello") != 0) {
        t_error("%s strsep get str is '%s' are not 'hello'\n", __func__, str);
    }
}

/**
 * @tc.name      : Strsep0200
 * @tc.desc      : test strsep result when marker character appears multiple times in truncated string
 * @tc.level     : Level 1
 */
void Strsep0200(void)
{
    char str[12] = "helloworld";
    char* p = str;
    char* sep = "l";
    char* result = strsep(&p, sep);
    if (strcmp(result, "he") != 0) {
        t_error("%s strsep get result is '%s' are not 'he'\n", __func__, result);
    }
    if (strcmp(str, "he") != 0) {
        t_error("%s strsep get result is '%s' are not 'he'\n", __func__, str);
    }
}

/**
 * @tc.name      : Strsep0300
 * @tc.desc      : test strsep result when marker character does not appear in truncated string
 * @tc.level     : Level 1
 */
void Strsep0300(void)
{
    char str[12] = "helloworld";
    char* p = str;
    char* sep = "a";
    char* result = strsep(&p, sep);
    if (strcmp(result, "helloworld") != 0) {
        t_error("%s strsep get result is '%s' are not 'helloworld'\n", __func__, result);
    }
    if (strcmp(str, "helloworld") != 0) {
        t_error("%s strsep get result is '%s' are not 'helloworld'\n", __func__, str);
    }
}

static int StrsepTestImpl(int argc, char* argv[])
{
    Strsep0100();
    Strsep0200();
    Strsep0300();
    return T_STATUS;
}

int StrsepTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return StrsepTestImpl(1, libcArgvStub);
}
