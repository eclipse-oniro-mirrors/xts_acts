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

#include <cstring>
#include "test.h"

/**
 * @tc.name      : Strchrnul0100
 * @tc.desc      : Find the specified character in a string
 * @tc.level     : Level 0
 */
void Strchrnul0100(void)
{
    char* str = "Hello world";
    char* tmp = nullptr;

    tmp = strchrnul(str, 'w');
    if (tmp == nullptr) {
        t_error("%s tmp is nullptr", __func__);
    }

    if (strcmp(tmp, "world")) {
        t_error("%s tmp is %s, not world", __func__, tmp);
    }
}

/**
 * @tc.name      : Strchrnul0200
 * @tc.desc      : Find \0 Character in String
 * @tc.level     : Level 1
 */
void Strchrnul0200(void)
{
    char* str = "Hello world";
    char* tmp = nullptr;

    tmp = strchrnul(str, '\0');
    if (tmp == nullptr) {
        t_error("%s tmp is nullptr", __func__);
    }

    if (strcmp(tmp, "")) {
        t_error("%s tmp is %s, not 0", __func__, tmp);
    }
}

/**
 * @tc.name      : Strchrnul0300
 * @tc.desc      : Find \0 Character in String
 * @tc.level     : Level 2
 */
void Strchrnul0300(void)
{
    char* str = "Hello world";
    char* tmp = nullptr;

    tmp = strchrnul(str, 'a');
    if (tmp == nullptr) {
        t_error("%s tmp is nullptr", __func__);
    }

    if (strcmp(tmp, "")) {
        t_error("%s tmp is %s, not nullptr", __func__, tmp);
    }
}

static int StrchrnulTestImpl(int argc, char* argv[])
{
    Strchrnul0100();
    Strchrnul0200();
    Strchrnul0300();
    return T_STATUS;
}

int StrchrnulTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return StrchrnulTestImpl(1, libcArgvStub);
}
