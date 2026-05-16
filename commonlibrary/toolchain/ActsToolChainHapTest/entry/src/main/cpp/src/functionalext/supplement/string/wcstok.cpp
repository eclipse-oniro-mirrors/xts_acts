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
#include <cstring>
#include <cwchar>
#include "test.h"

namespace {
constexpr int K_WCSTOK0100_TOKEN_COUNT = 5;
} // namespace

/**
 * @tc.name      : Wcstok0100
 * @tc.desc      : test wcstok to intercept the target string according to the incoming wide string
 * @tc.level     : Level 0
 */
void Wcstok0100(void)
{
    wchar_t str[] = L"parrot,owl,sparrow,pigeon,crow";
    wchar_t delim[] = L",";
    wchar_t* ptr;
    wchar_t* compare[5] = { L"parrot", L"owl", L"sparrow", L"pigeon", L"crow" };
    wchar_t* result[5] = {};
    wchar_t* token = wcstok(str, delim, &ptr);
    int i = 0;
    while (token) {
        result[i] = token;
        i++;
        token = wcstok(nullptr, delim, &ptr);
    }
    for (i = 0; i < K_WCSTOK0100_TOKEN_COUNT; i++) {
        if (wcscmp(result[i], compare[i]) != 0) {
            t_error("%s wcstok in %d get value is %s and %s\n", __func__, i, result[i], compare[i]);
        }
    }
}

/**
 * @tc.name      : Wcstok0200
 * @tc.desc      : test wcstok to intercept multiple targets according to incoming
 * @tc.level     : Level 1
 */
void Wcstok0200(void)
{
    wchar_t str[] = L"parrot,owl.sparrow,pigeon,crow";
    wchar_t delim[] = L",.";
    wchar_t* ptr;
    wchar_t* result = wcstok(str, delim, &ptr);
    if (wcscmp(result, L"parrot") != 0) {
        t_error("%s wcstok get result is %s are not parrot\n", __func__, result);
    }
    if (wcscmp(ptr, L"owl.sparrow,pigeon,crow") != 0) {
        t_error("%s wcstok get ptr is %s are not parrot\n", __func__, ptr);
    }
}

/**
 * @tc.name      : Wcstok0300
 * @tc.desc      : test the wcstok function with consecutive delimiters
 * @tc.level     : Level 0
 */
void Wcstok0300(void)
{
    wchar_t str[] = L",,hello,,world,,test,,";
    wchar_t* saveptr = nullptr;
    wchar_t* result;
    const wchar_t* delim = L",";

    result = wcstok(str, delim, &saveptr);
    if (wcscmp(result, L"hello") != 0) {
        t_error("%s wcstok get first result is %ls are not want 'hello'\n", __func__, result);
        return;
    }

    result = wcstok(nullptr, delim, &saveptr);
    if (wcscmp(result, L"world") != 0) {
        t_error("%s wcstok get second result is %ls are not want 'world'\n", __func__, result);
        return;
    }

    result = wcstok(nullptr, delim, &saveptr);
    if (wcscmp(result, L"test") != 0) {
        t_error("%s wcstok get third result is %ls are not want 'test'\n", __func__, result);
        return;
    }

    result = wcstok(nullptr, delim, &saveptr);
    if (result != nullptr) {
        t_error("%s wcstok should return nullptr but get %ls\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcstok0400
 * @tc.desc      : test the wcstok function with empty string
 * @tc.level     : Level 0
 */
void Wcstok0400(void)
{
    wchar_t str[] = L"";
    wchar_t* saveptr = nullptr;
    wchar_t* result;
    const wchar_t* delim = L",";

    result = wcstok(str, delim, &saveptr);
    if (result != nullptr) {
        t_error("%s wcstok should return nullptr for empty string but get %ls\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcstok0500
 * @tc.desc      : test the wcstok function with delimiter only string
 * @tc.level     : Level 0
 */
void Wcstok0500(void)
{
    wchar_t str[] = L",,,,";
    wchar_t* saveptr = nullptr;
    wchar_t* result;
    const wchar_t* delim = L",";

    result = wcstok(str, delim, &saveptr);
    if (result != nullptr) {
        t_error("%s wcstok should return nullptr for delimiter only string but get %ls\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcstok0600
 * @tc.desc      : test the wcstok function with no delimiters in string
 * @tc.level     : Level 0
 */
void Wcstok0600(void)
{
    wchar_t str[] = L"helloworld";
    wchar_t* saveptr = nullptr;
    wchar_t* result;
    const wchar_t* delim = L",";

    result = wcstok(str, delim, &saveptr);
    if (wcscmp(result, L"helloworld") != 0) {
        t_error("%s wcstok get result is %ls are not want 'helloworld'\n", __func__, result);
        return;
    }

    result = wcstok(nullptr, delim, &saveptr);
    if (result != nullptr) {
        t_error("%s wcstok should return nullptr but get %ls\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcstok0700
 * @tc.desc      : test the wcstok function thread safety with multiple save pointers
 * @tc.level     : Level 1
 */
void Wcstok0700(void)
{
    wchar_t str1[] = L"apple,banana,cherry";
    wchar_t str2[] = L"red;green;blue";
    wchar_t* saveptr1 = nullptr;
    wchar_t* saveptr2 = nullptr;
    wchar_t* result1;
    wchar_t* result2;

    // Process both strings alternately
    result1 = wcstok(str1, L",", &saveptr1);
    result2 = wcstok(str2, L";", &saveptr2);

    if (wcscmp(result1, L"apple") != 0) {
        t_error("%s wcstok get first result1 is %ls are not want 'apple'\n", __func__, result1);
        return;
    }

    if (wcscmp(result2, L"red") != 0) {
        t_error("%s wcstok get first result2 is %ls are not want 'red'\n", __func__, result2);
        return;
    }

    // Continue processing
    result1 = wcstok(nullptr, L",", &saveptr1);
    result2 = wcstok(nullptr, L";", &saveptr2);

    if (wcscmp(result1, L"banana") != 0) {
        t_error("%s wcstok get second result1 is %ls are not want 'banana'\n", __func__, result1);
        return;
    }

    if (wcscmp(result2, L"green") != 0) {
        t_error("%s wcstok get second result2 is %ls are not want 'green'\n", __func__, result2);
        return;
    }
}

/**
 * @tc.name      : Wcstok0800
 * @tc.desc      : test the wcstok function with nullptr input
 * @tc.level     : Level 2
 */
void Wcstok0800(void)
{
    wchar_t* saveptr = nullptr;
    wchar_t* result;
    const wchar_t* delim = L",";

    result = wcstok(nullptr, delim, &saveptr);
    if (result != nullptr) {
        t_error("%s wcstok should return nullptr for nullptr input but get %ls\n", __func__, result);
    }
}

/**
 * @tc.name      : Wcstok0900
 * @tc.desc      : test the wcstok function with mixed delimiters and whitespace
 * @tc.level     : Level 1
 */
void Wcstok0900(void)
{
    wchar_t str[] = L"  hello , world ; test ";
    wchar_t* saveptr = nullptr;
    wchar_t* result;
    const wchar_t* delim = L" ,;";

    result = wcstok(str, delim, &saveptr);
    if (wcscmp(result, L"hello") != 0) {
        t_error("%s wcstok get first result is %ls are not want 'hello'\n", __func__, result);
        return;
    }

    result = wcstok(nullptr, delim, &saveptr);
    if (wcscmp(result, L"world") != 0) {
        t_error("%s wcstok get second result is %ls are not want 'world'\n", __func__, result);
        return;
    }

    result = wcstok(nullptr, delim, &saveptr);
    if (wcscmp(result, L"test") != 0) {
        t_error("%s wcstok get third result is %ls are not want 'test'\n", __func__, result);
        return;
    }
}

static int WcstokTestImpl(int argc, char* argv[])
{
    (void)setlocale(LC_ALL, "en_US.utf8");
    Wcstok0100();
    Wcstok0200();
    Wcstok0300();
    Wcstok0400();
    Wcstok0500();
    Wcstok0600();
    Wcstok0700();
    Wcstok0800();
    Wcstok0900();
    return T_STATUS;
}

int WcstokTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcstokTestImpl(1, libcArgvStub);
}
