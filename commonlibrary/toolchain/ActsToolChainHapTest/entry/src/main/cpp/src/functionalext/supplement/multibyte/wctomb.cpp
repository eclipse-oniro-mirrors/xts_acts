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

#include <clocale>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cwchar>
#include "test.h"

/**
 * @tc.name      : Wctomb0100
 * @tc.desc      : test the wctomb method to copy wide characters into a string
 * @tc.level     : Level 0
 */
void Wctomb0100(void)
{
    char byte[256] = { 0 };
    int result = wctomb(byte, L'h');
    if (result != 1) {
        t_error("%s wctomb get result is %d are not want 1\n", __func__, result);
    }
}

/**
 * @tc.name      : Wctomb0200
 * @tc.desc      : test the result of wctomb when the incoming wide character is the terminator
 * @tc.level     : Level 1
 */
void Wctomb0200(void)
{
    char byte[256] = { 0 };
    int result = wctomb(byte, L'\0');
    if (result != 1) {
        t_error("%s wctomb get result is %d are not want 1\n", __func__, result);
    }
}

/**
 * @tc.name      : Wctomb0300
 * @tc.desc      : wctomb result when test string is nullptr
 * @tc.level     : Level 2
 */
void Wctomb0300(void)
{
    int result = wctomb(nullptr, L'h');
    if (result != 0) {
        t_error("%s wctomb get result is %d are not want 0\n", __func__, result);
    }
}

/**
 * @tc.name      : Wctomb0400
 * @tc.desc      : wctomb result when test string is nullptr and wide character is terminator
 * @tc.level     : Level 2
 */
void Wctomb0400(void)
{
    int result = wctomb(nullptr, L'\0');
    if (result != 0) {
        t_error("%s wctomb get result is %d are not want 0\n", __func__, result);
    }
}

static int WctombTestImpl(int argc, char* argv[])
{
    Wctomb0100();
    Wctomb0200();
    Wctomb0300();
    Wctomb0400();
    return T_STATUS;
}

int WctombTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WctombTestImpl(1, libcArgvStub);
}
