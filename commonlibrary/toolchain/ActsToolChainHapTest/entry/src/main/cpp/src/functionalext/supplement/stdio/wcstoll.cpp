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

#include <cerrno>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include "test.h"

namespace {
constexpr const char K_WCSTOLL_TAG[] = "wcstoll";
constexpr int K_BASE_AUTO = 0;
constexpr int K_BASE_BIN = 2;
constexpr int K_BASE_HEX = 16;
constexpr int K_BASE_36 = 36;
constexpr int K_PARSE_POS_1 = 1;
constexpr int K_PARSE_POS_6 = 6;
constexpr int K_PARSE_POS_19 = 19;
constexpr int K_PARSE_POS_20 = 20;
} // namespace

/**
 * @tc.name      : Wcstoll0100
 * @tc.desc      : Convert wide string "2147483647" to long long type
 * @tc.level     : Level 0
 */
void Wcstoll0100(void)
{
    long long ll;
    errno = 0;
    ll = wcstoll(L"2147483647", nullptr, K_BASE_AUTO);
    if (ll != 2147483647LL) {
        t_error("%s failed (expect signed %lld != %lld)\n", K_WCSTOLL_TAG, ll, 2147483647LL);
    }
}

/**
 * @tc.name      : Wcstoll0200
 * @tc.desc      : Convert wide string "10" to long long type
 * @tc.level     : Level 0
 */
void Wcstoll0200(void)
{
    long long ll;
    errno = 0;
    ll = wcstoll(L"10", nullptr, K_BASE_AUTO);
    if (ll != 10LL) {
        t_error("%s failed (expect signed %lld != %lld)\n", K_WCSTOLL_TAG, ll, 10LL);
    }
}

/**
 * @tc.name      : Wcstoll0300
 * @tc.desc      : Convert wide string "z" to long long type
 * @tc.level     : Level 1
 */
void Wcstoll0300(void)
{
    long long ll;
    errno = 0;
    ll = wcstoll(L"z", nullptr, K_BASE_36);
    if (ll != 35LL) {
        t_error("%s failed (%lld != %lld)\n", K_WCSTOLL_TAG, ll, 35LL);
    }
}

/**
 * @tc.name      : Wcstoll0400
 * @tc.desc      : Convert wide string "00010010001101000101011001111000" to long long type
 * @tc.level     : Level 1
 */
void Wcstoll0400(void)
{
    long long ll;
    errno = 0;
    ll = wcstoll(L"00010010001101000101011001111000", nullptr, K_BASE_BIN);
    if (ll != static_cast<long long>(0x12345678)) {
        t_error("%s failed (%lld != %lld)\n", K_WCSTOLL_TAG, ll, static_cast<long long>(0x12345678));
    }
}

/**
 * @tc.name      : Wcstoll0500
 * @tc.desc      : Convert wide string "0xz" to long long type
 * @tc.level     : Level 1
 */
void Wcstoll0500(void)
{
    int i;
    long long ll;
    wchar_t* s;
    wchar_t* c;
    s = L"0xz";
    errno = 0;
    ll = wcstoll(s, &c, K_BASE_HEX);
    if (ll != 0) {
        t_error("%s failed (%lld != %lld)\n", K_WCSTOLL_TAG, ll, 0LL);
    }
    i = static_cast<int>(c - s);
    if (i != K_PARSE_POS_1) {
        t_error("%s failed (wrong final position %lld != %lld)\n",
                K_WCSTOLL_TAG,
                static_cast<long long>(i),
                static_cast<long long>(K_PARSE_POS_1));
    }
}

/**
 * @tc.name      : Wcstoll0600
 * @tc.desc      : Convert wide string "0x1234" to long long type
 * @tc.level     : Level 1
 */
void Wcstoll0600(void)
{
    int i;
    long long ll;
    wchar_t* s;
    wchar_t* c;
    s = L"0x1234";
    errno = 0;
    ll = wcstoll(s, &c, K_BASE_HEX);
    if (ll != static_cast<long long>(0x1234)) {
        t_error("%s failed (%lld != %ld)\n", K_WCSTOLL_TAG, ll, static_cast<long>(0x1234));
    }
    i = static_cast<int>(c - s);
    if (i != K_PARSE_POS_6) {
        t_error("%s failed (wrong final position %lld != %lld)\n",
                K_WCSTOLL_TAG,
                static_cast<long long>(i),
                static_cast<long long>(K_PARSE_POS_6));
    }
}

/**
 * @tc.name      : Wcstoll0700
 * @tc.desc      : Convert wide string "9223372036854775808" to long long type exceeds the maximum value of the type
 * @tc.level     : Level 2
 */
void Wcstoll0700(void)
{
    int i;
    long long ll;
    wchar_t* s;
    wchar_t* c;
    s = L"9223372036854775808";
    errno = 0;
    ll = wcstoll(s, &c, K_BASE_AUTO);
    if (ll != 9223372036854775807LL) {
        t_error("%s failed (uncaught overflow %lld != %lld)\n", K_WCSTOLL_TAG, ll, 9223372036854775807LL);
    }
    i = static_cast<int>(c - s);
    if (i != K_PARSE_POS_19) {
        t_error("%s failed (wrong final position %d != %d)\n", K_WCSTOLL_TAG, i, K_PARSE_POS_19);
    }
    i = errno;
    if (i != ERANGE) {
        t_error("%s failed (missing errno %d != %d)\n", K_WCSTOLL_TAG, i, ERANGE);
    }
}

/**
 * @tc.name      : Wcstoll0800
 * @tc.desc      : Convert wide string "-9223372036854775809" to long long type exceeds the maximum value of the type
 * @tc.level     : Level 2
 */
void Wcstoll0800(void)
{
    int i;
    long long ll;
    wchar_t* s;
    wchar_t* c;
    s = L"-9223372036854775809";
    errno = 0;
    ll = wcstoll(s, &c, K_BASE_AUTO);
    if (ll != -9223372036854775807LL - 1) {
        t_error("%s failed (overflow %lld != %lld)\n", K_WCSTOLL_TAG, ll, -9223372036854775807LL - 1);
    }
    i = static_cast<int>(c - s);
    if (i != K_PARSE_POS_20) {
        t_error("%s failed (wrong final position %d != %d)\n", K_WCSTOLL_TAG, i, K_PARSE_POS_20);
    }
    i = errno;
    if (i != ERANGE) {
        t_error("%s failed (missing errno %d != %d)\n", K_WCSTOLL_TAG, i, ERANGE);
    }
}

static int WcstollTestImpl(int argc, char* argv[])
{
    Wcstoll0100();
    Wcstoll0200();
    Wcstoll0300();
    Wcstoll0400();
    Wcstoll0500();
    Wcstoll0600();
    Wcstoll0700();
    Wcstoll0800();
    return T_STATUS;
}

int WcstollTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcstollTestImpl(1, libcArgvStub);
}
