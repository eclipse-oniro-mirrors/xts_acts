/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "common/napi_helper.cpp"
#include "common/native_common.h"
#include "napi/native_api.h"
#include <clocale>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <ctime>
#include <cwchar>
#include <cerrno>
#include <fcntl.h>
#include <cfloat>
#include <memory.h>
#include <cstdlib>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_1 1
#define MPARAM_1 (-1)
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_314 3.14
#define PARAM_4 4
#define PARAM_25 25
#define PARAM_31 31
#define PARAM_32 32
#define PARAM_6 6
#define PARAM_7 7
#define PARAM_10 10
#define PARAM_13 13
#define PARAM_16 16
#define PARAM_17 17
#define PARAM_5 5
#define PARAM_80 80
#define PARAM_250068492 250068492
#define PARAM_2064035584 2064035584
#define PARAM_208622688 208622688
#define PARAM_7340031 7340031
#define PARAM_1856892505 1856892505
#define PARAM_6358606123 6358606123
#define MPARAM_208340076 (-208340076)
#define PARAM_2001 2001
#define PARAM_6340800 6340800
#define MPARAM_36242240 (-3624224)
#define SIZE_100 100
#define ARRY_MAX 128
#define ZERO 0x0
#define PARAM_11 11
#define PARAM_20 20
#define PARAM_14 14
#define PARAM_18 18
#define ERRON_0 0
#define MINUSONE (-1)
#define SUCCESS 1
#define FAILD (-1)
#define SIZE_256 256
#define PARAM_12 12

#define SIZEOF_WCHAR(x) (sizeof(x) / sizeof(wchar_t))
static const char *TEMP_FILE = "/data/storage/el2/base/files/fzl.txt";

static napi_value Btowc_One(napi_env env, napi_callback_info info)
{
    wint_t ret = btowc('6');
    NAPI_ASSERT(env, ret == L'6', "btowc Error");
    ret = btowc('A');
    NAPI_ASSERT(env, ret == L'A', "btowc Error");
    ret = btowc('&');
    NAPI_ASSERT(env, ret == L'&', "btowc Error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Btowc_Two(napi_env env, napi_callback_info info)
{
    wint_t ret = btowc(EOF);
    napi_value result = nullptr;
    napi_create_int32(env, ret == WEOF, &result);
    return result;
}

static napi_value Mbtowc_One(napi_env env, napi_callback_info info)
{
    const char *test = "musl";
    wchar_t wc[ARRY_MAX];
    size_t ret = mbtowc(wc, test, PARAM_1);
    napi_value result = nullptr;
    napi_create_int32(env, ret == SUCCESS && wc[PARAM_0] == L'm', &result);
    return result;
}

static napi_value Mbtowc_Two(napi_env env, napi_callback_info info)
{
    const char *test = "musl";
    wchar_t wc[ARRY_MAX];
    int ret = mbtowc(wc, test, MINUSONE);
    napi_value result = nullptr;
    napi_create_int32(env, ret == SUCCESS && errno == EBADF, &result);
    return result;
}

static napi_value Fputwc_One(napi_env env, napi_callback_info info)
{
    wchar_t mb_one_bytes = L'h';
    FILE *fp = fopen(TEMP_FILE, "w");
    int ret = PARAM_0;
    if (fp) {
        ret = fputwc(mb_one_bytes, fp);
        fclose(fp);
        remove(TEMP_FILE);
    }
    napi_value result = nullptr;
    napi_create_int32(env, static_cast<wchar_t>(ret) == mb_one_bytes, &result);
    return result;
}

static napi_value Fputws_One(napi_env env, napi_callback_info info)
{
    char wstr[SIZE_100] = {PARAM_0};
    FILE *fp = fopen(TEMP_FILE, "w+");
    int ret = PARAM_0;
    int rsize = PARAM_0;
    if (fp) {
        ret = fputws(L"This is a test", fp);
        fseek(fp, PARAM_0, SEEK_SET);
        rsize = fread(wstr, sizeof(char), SIZE_100, fp);
        fclose(fp);
        remove(TEMP_FILE);
    }
    napi_value result = nullptr;
    napi_create_int32(env, rsize == ret, &result);
    return result;
}

static napi_value Fwide_One(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    FILE *fp = fopen(TEMP_FILE, "w+");
    int ret = PARAM_0;
    if (fp) {
        ret = fwide(fp, PARAM_5);
        fclose(fp);
        remove(TEMP_FILE);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret > PARAM_0 && errno == ERRON_0, &result);
    return result;
}

static napi_value Fwide_Two(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    FILE *fp = fopen(TEMP_FILE, "w+");
    int ret = PARAM_0;
    if (fp) {
        ret = fwide(fp, PARAM_0);
        fclose(fp);
        remove(TEMP_FILE);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret == ERRON_0 && errno == ERRON_0, &result);
    return result;
}

static napi_value Fwprintf_One(napi_env env, napi_callback_info info)
{
    setlocale(LC_ALL, "en_US.UTF-8");
    int ret = fwprintf(stdout, L"This is a test\n");
    napi_value result = nullptr;
    napi_create_int32(env, ret == wcslen(L"This is a test\n"), &result);
    return result;
}

static napi_value Fwprintf_Two(napi_env env, napi_callback_info info)
{
    setlocale(LC_ALL, "en_US.UTF-8");
    int ret = fwprintf(stderr, L"This is a test\n");
    napi_value result = nullptr;
    napi_create_int32(env, ret == wcslen(L"This is a test\n"), &result);
    return result;
}

static napi_value Wprintf_One(napi_env env, napi_callback_info info)
{
    int ret = wprintf(L"%ls", L"This is a test");
    napi_value result = nullptr;
    napi_create_int32(env, ret == wcslen(L"This is a test"), &result);
    return result;
}

static napi_value Wprintf_Two(napi_env env, napi_callback_info info)
{
    int ret = wprintf(L"%lc", L'a');
    napi_value result = nullptr;
    napi_create_int32(env, ret == SUCCESS, &result);
    return result;
}

static napi_value Fwscanf_One(napi_env env, napi_callback_info info)
{
    int fd = open(TEMP_FILE, O_CREAT | O_RDWR);
    int ret = PARAM_0;
    FILE *fp = fdopen(fd, "w+");
    if (fp) {
        wchar_t wstr[PARAM_10] = {PARAM_0};
        setlocale(LC_ALL, "en_US.UTF-8");
        fwprintf(fp, L"%ls", L"test");
        rewind(fp);
        ret = fwscanf(fp, L"%ls", wstr);
        fclose(fp);
        remove(TEMP_FILE);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret == SUCCESS, &result);
    return result;
}

static napi_value Fwscanf_Two(napi_env env, napi_callback_info info)
{
    int fd = open(TEMP_FILE, O_CREAT | O_RDWR);
    int ret = PARAM_0;
    FILE *fp = fdopen(fd, "w+");
    if (fp) {
        wchar_t wstr[50] = {PARAM_0};
        fwprintf(fp, L"%ls", L"Summation");
        rewind(fp);
        ret = fwscanf(fp, L"%ls %lc", wstr);
        fclose(fp);
        remove(TEMP_FILE);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret == SUCCESS, &result);
    return result;
}

static napi_value Swprintf_One(napi_env env, napi_callback_info info)
{
    wchar_t wbuf[SIZE_100] = {PARAM_0};
    int ret = swprintf(wbuf, SIZE_100, L"%ls", L"This is test");
    napi_value result = nullptr;
    napi_create_int32(env, ret == wcslen(L"This is test"), &result);
    return result;
}

static napi_value Swprintf_Two(napi_env env, napi_callback_info info)
{
    wchar_t wbuf[SIZE_100] = {PARAM_0};
    int ret = swprintf(wbuf, SIZE_100, L"%s", "xyz");
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen("xyz"), &result);
    return result;
}

static napi_value Swscanf_One(napi_env env, napi_callback_info info)
{
    wchar_t wstr[] = L"swscanf 123";
    wchar_t wtmp[PARAM_20];
    setlocale(LC_ALL, "en_US.UTF-8");
    int ret = swscanf(wstr, L"%ls", wtmp);
    napi_value result = nullptr;
    napi_create_int32(env, ret == SUCCESS, &result);
    return result;
}

static napi_value Swscanf_Two(napi_env env, napi_callback_info info)
{
    wchar_t buffer[SIZE_100] = L"Theta \u03b8";
    wchar_t symbol, desc[PARAM_10];
    setlocale(LC_ALL, "en_US.UTF-8");
    int ret = swscanf(buffer, L"%ls %lc", desc, &symbol);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_2, &result);
    return result;
}

static napi_value Mbrtowc_One(napi_env env, napi_callback_info info)
{
    const char pt[] = "mbrtowc example";
    wchar_t dest;
    mbstate_t mbs;
    mbrlen(nullptr, PARAM_0, &mbs);
    int length = mbrtowc(&dest, pt, sizeof(pt), &mbs);
    napi_value result = nullptr;
    napi_create_int32(env, length == SUCCESS, &result);
    return result;
}

static napi_value Mbsinit_One(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_80];
    mbstate_t mbst;
    const wchar_t wcs[] = L"mbsinit";
    const wchar_t *p = nullptr;
    p = wcs;
    int ret = mbsinit(&mbst);
    memset(&mbst, PARAM_0, sizeof(mbst));
    wcsrtombs(buffer, &p, PARAM_80, &mbst);
    napi_value result = nullptr;
    napi_create_int32(env, ret == SUCCESS, &result);
    return result;
}

static napi_value Mbstowcs_One(napi_env env, napi_callback_info info)
{
    const int TEST_BUFFER_SIZE = ARRY_MAX;
    const char *src = "mbstowcs_One";
    wchar_t dst[TEST_BUFFER_SIZE];
    memset(dst, ZERO, sizeof(wchar_t) * TEST_BUFFER_SIZE);
    size_t ret = mbstowcs(dst, src, strlen(src));
    napi_value result = nullptr;
    napi_create_int32(env, ret == strlen(src), &result);
    return result;
}

static napi_value Mbsrtowcs_One(napi_env env, napi_callback_info info)
{
    setlocale(LC_ALL, "en_US.utf8");
    const char *src = "\u0763\u0757";
    wchar_t dest[PARAM_20];
    mbstate_t ps = mbstate_t();
    int max = PARAM_10;
    int ret = mbsrtowcs(dest, &src, max, &ps);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_2, &result);
    return result;
}

static napi_value Mbsnrtowcs_One(napi_env env, napi_callback_info info)
{
    setlocale(LC_ALL, "en_US.utf8");
    const char *src = "\u0763\u0757";
    wchar_t dest[PARAM_20];
    mbstate_t ps = mbstate_t();
    int max = PARAM_10;
    int ret = mbsnrtowcs(dest, &src, max, max, &ps);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_2, &result);
    return result;
}

static napi_value OpenWmemstream_One(napi_env env, napi_callback_info info)
{
    size_t len = PARAM_0;
    wchar_t *ptr = nullptr;
    FILE *fp = open_wmemstream(&ptr, &len);
    if (fp) {
        fputws(L"hello, world!", fp);
        fclose(fp);
    }
    free(ptr);
    ptr = nullptr;
    napi_value result = nullptr;
    napi_create_int32(env, wcslen(L"hello, world!") == len, &result);
    return result;
}

static napi_value Putwc_One(napi_env env, napi_callback_info info)
{
    wint_t ret = MINUSONE;
    FILE *fp = fopen(TEMP_FILE, "w");
    NAPI_ASSERT(env, fp != nullptr, "Putwc_One fopen Error");
    wchar_t wc = L'p';
    ret = putwc(wc, fp);
    fclose(fp);
    remove(TEMP_FILE);
    napi_value result = nullptr;
    napi_create_int32(env, static_cast<wchar_t>(ret) == L'p', &result);
    return result;
}

static napi_value PutWChar_One(napi_env env, napi_callback_info info)
{
    wint_t ret = MINUSONE;
    wchar_t wch[] = L"this is putwchar_0100 test case, std output success!";
    int length = SIZEOF_WCHAR(wch);
    for (int nLoop = PARAM_0; nLoop < length; nLoop++) {
        ret = putwchar(wch[nLoop]);
        NAPI_ASSERT(env, static_cast<wchar_t>(ret) == wch[nLoop], "putwchar Error");
    }
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Towlower_One(napi_env env, napi_callback_info info)
{
    wchar_t wc = L'A';
    wint_t wt = PARAM_0;
    wt = towlower(wc);
    napi_value result = nullptr;
    napi_create_int32(env, wt == L'a', &result);
    return result;
}

static napi_value Towupper_One(napi_env env, napi_callback_info info)
{
    wchar_t wc = L'a';
    wint_t wt = PARAM_0;
    wt = towupper(wc);
    napi_value result = nullptr;
    napi_create_int32(env, wt == L'A', &result);
    return result;
}

static napi_value Ungetwc_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(TEMP_FILE, "w+");
    NAPI_ASSERT(env, fp != nullptr, "ungetwc fopen Error");
    wint_t wc = L'a';
    putwc(wc, fp);
    fseek(fp, PARAM_0, SEEK_SET);
    wint_t ret = ungetwc(wc, fp);
    ret = getwc(fp);
    fclose(fp);
    remove(TEMP_FILE);
    napi_value result = nullptr;
    napi_create_int32(env, static_cast<wchar_t>(ret) == L'a', &result);
    return result;
}

static napi_value Wcpcpy_One(napi_env env, napi_callback_info info)
{
    wchar_t src[] = L"Source string";
    wchar_t dst[PARAM_14] = {PARAM_0};
    wcpcpy(dst, src);
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(src, dst) == ERRON_0, &result);
    return result;
}

static napi_value Wcpncpy_One(napi_env env, napi_callback_info info)
{
    wchar_t src[] = L"Source string";
    wchar_t dst[PARAM_18] = {PARAM_0};
    size_t src_len = PARAM_13;
    wcpncpy(dst, src, src_len + PARAM_1);
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(src, dst) == ERRON_0, &result);
    return result;
}

static napi_value Wcrtomb_One(napi_env env, napi_callback_info info)
{
    wchar_t wcs = L'A';
    char s[PARAM_20];
    mbstate_t pr;
    memset(&pr, PARAM_0, sizeof(pr));
    int ret = MINUSONE;
    ret = wcrtomb(s, wcs, &pr);
    NAPI_ASSERT(env, ret == SUCCESS, "wcrtomb Error");
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(s, "A") == ERRON_0, &result);

    return result;
}

static napi_value Wcscasecmp_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    ret = wcscasecmp(L"hello1", L"HELLO2");
    NAPI_ASSERT(env, ret < PARAM_0, "wcscasecmp Error");
    ret = wcscasecmp(L"hello2", L"HELLO1");
    NAPI_ASSERT(env, ret > PARAM_0, "wcscasecmp Error");
    ret = wcscasecmp(L"hello", L"HELLO");
    NAPI_ASSERT(env, ret == ERRON_0, "wcscasecmp Error");
    napi_value result = nullptr;
    napi_create_int32(env, ret == ERRON_0, &result);
    return result;
}

static napi_value Wcscasecmpl_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    locale_t localInfo = nullptr;
    ret = wcscasecmp_l(L"hello1", L"HELLO2", localInfo);
    NAPI_ASSERT(env, ret < PARAM_0, "wcscasecmp_l Error");
    ret = wcscasecmp_l(L"hello2", L"HELLO1", localInfo);
    NAPI_ASSERT(env, ret > PARAM_0, "wcscasecmp_l Error");
    ret = wcscasecmp_l(L"hello", L"HELLO", localInfo);
    NAPI_ASSERT(env, ret == ERRON_0, "wcscasecmp_l Error");
    napi_value result = nullptr;
    napi_create_int32(env, ret == ERRON_0, &result);
    return result;
}

static napi_value Wcscat_One(napi_env env, napi_callback_info info)
{
    wchar_t wcs[PARAM_80];
    wcscpy(wcs, L"these ");
    wcscat(wcs, L"wide strings ");
    wcscat(wcs, L"are ");
    wcscat(wcs, L"concatenated.");
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(wcs, L"these wide strings are concatenated.") == ERRON_0, &result);
    return result;
}

static napi_value Wcschr_One(napi_env env, napi_callback_info info)
{
    wchar_t wcs[] = L"This is a sample wide string";
    wchar_t *pwc = nullptr;
    pwc = wcschr(wcs, L's');
    napi_value result = nullptr;
    napi_create_int32(env, pwc - wcs + PARAM_1 == PARAM_4, &result);
    return result;
}

static napi_value Wcscmp_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    ret = wcscmp(L"ABCD", L"ABCE");
    NAPI_ASSERT(env, ret < PARAM_0, "wcscmp Error");
    ret = wcscmp(L"ABCE", L"ABCD");
    NAPI_ASSERT(env, ret > PARAM_0, "wcscmp Error");
    ret = wcscmp(L"test wcscmp", L"test wcscmp");
    NAPI_ASSERT(env, ret == ERRON_0, "wcscmp Error");
    napi_value result = nullptr;
    napi_create_int32(env, ret == ERRON_0, &result);
    return result;
}

static napi_value Wcscoll_One(napi_env env, napi_callback_info info)
{
    setlocale(LC_COLLATE, "en_US.utf8");
    int ret = wcscoll(L"år", L"ängel");
    napi_value result = nullptr;
    napi_create_int32(env, ret == SUCCESS, &result);
    return result;
}

static napi_value Wcscolll_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    locale_t localInfo = nullptr;
    ret = wcscoll_l(L"abcdefg", L"abcdef", localInfo);
    NAPI_ASSERT(env, ret > PARAM_0, "wcscoll_l Error");
    ret = wcscoll_l(L"abcde", L"abcdef", localInfo);
    NAPI_ASSERT(env, ret < PARAM_0, "wcscoll_l Error");
    ret = wcscoll_l(L"abcdef", L"abcdef", localInfo);
    napi_value result = nullptr;
    napi_create_int32(env, ret == ERRON_0, &result);
    return result;
}

static napi_value Wcscpy_One(napi_env env, napi_callback_info info)
{
    wchar_t wcs[] = L"wcscpy test";
    wchar_t des[40];
    wcscpy(des, wcs);
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(wcs, des) == ERRON_0, &result);
    return result;
}

static napi_value Wcscspn_One(napi_env env, napi_callback_info info)
{
    wchar_t wcs[] = L"fcba73";
    wchar_t keys[] = L"1234567890";
    int ret = MINUSONE;
    ret = wcscspn(wcs, keys);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_4, &result);
    return result;
}

static napi_value Wcsdup_One(napi_env env, napi_callback_info info)
{
    wchar_t src[] = L"wcsdup";
    wchar_t *ret = wcsdup(src);
    NAPI_ASSERT(env, ret != nullptr, "wcsdup Error");
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(src, ret) == ERRON_0, &result);
    return result;
}

static napi_value Wcsftime_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    time_t rawtime;
    struct tm *timeinfo;
    wchar_t buffer[PARAM_80];
    time(&rawtime);
    timeinfo = localtime(&rawtime);
    ret = wcsftime(buffer, PARAM_80, L"Now it's %I:%M%p.", timeinfo);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_17, &result);
    return result;
}

static napi_value Wcsftimel_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    time_t rtime;
    struct tm *timeinfo;
    wchar_t buffer[PARAM_80];
    time(&rtime);
    timeinfo = localtime(&rtime);
    locale_t newlocale_ = newlocale(LC_ALL_MASK, "en_US", nullptr);
    ret = wcsftime_l(buffer, PARAM_80, L"%I:%M%p", timeinfo, newlocale_);
    if (newlocale_) {
        freelocale(newlocale_);
        newlocale_ = nullptr;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_7, &result);
    return result;
}

static napi_value Wcslen_One(napi_env env, napi_callback_info info)
{
    wchar_t str[] = L"wcslen";
    size_t ret = PARAM_6;
    napi_value result = nullptr;
    napi_create_int32(env, ret == wcslen(str), &result);
    return result;
}

static napi_value Wcsncasecmp_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    ret = wcsncasecmp(L"hello1", L"HELLO2", PARAM_6);
    NAPI_ASSERT(env, ret < PARAM_0, "wcsncasecmp Error");
    ret = wcsncasecmp(L"hello2", L"HELLO1", PARAM_6);
    NAPI_ASSERT(env, ret > PARAM_0, "wcsncasecmp Error");
    ret = wcsncasecmp(L"hello1", L"HELLO2", PARAM_5);
    napi_value result = nullptr;
    napi_create_int32(env, ret == ERRON_0, &result);
    return result;
}

static napi_value Wcsncasecmpl_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    ret = wcsncasecmp_l(L"hello1", L"HELLO2", PARAM_6, nullptr);
    NAPI_ASSERT(env, ret < PARAM_0, "wcsncasecmp_l Error");
    ret = wcsncasecmp_l(L"hello2", L"HELLO1", PARAM_6, nullptr);
    NAPI_ASSERT(env, ret > PARAM_0, "wcsncasecmp_l Error");
    ret = wcsncasecmp_l(L"hello1", L"HELLO2", PARAM_5, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret == ERRON_0, &result);
    return result;
}

static napi_value Wcsncat_One(napi_env env, napi_callback_info info)
{
    wchar_t dst[PARAM_32] = {PARAM_0};
    wchar_t *ret = wcsncat(dst, L"hello, world!", PARAM_5);
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(dst, ret) == ERRON_0, &result);
    return result;
}

static napi_value Wcsncmp_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    ret = wcsncmp(L"aaaa", L"aaab", PARAM_4);
    NAPI_ASSERT(env, ret < PARAM_0, "wcsncmp Error");
    ret = wcsncmp(L"aaab", L"aaaa", PARAM_4);
    NAPI_ASSERT(env, ret > PARAM_0, "wcsncmp Error");
    ret = wcsncmp(L"aaaa", L"aaab", PARAM_3);
    NAPI_ASSERT(env, ret == ERRON_0, "wcsncmp Error");
    napi_value result = nullptr;
    napi_create_int32(env, ret == ERRON_0, &result);
    return result;
}

static napi_value Wcsncpy_One(napi_env env, napi_callback_info info)
{
    const wchar_t src[] = L"Hello";
    wchar_t buf[SIZEOF_WCHAR(src) + PARAM_1];
    wmemset(buf, L'A', SIZEOF_WCHAR(buf));
    wchar_t *ret = static_cast<wchar_t *>(buf);

    napi_value result = nullptr;
    napi_create_int32(env, ret == wcsncpy(ret, src, SIZEOF_WCHAR(src)), &result);
    return result;
}

static napi_value Wcsnlen_One(napi_env env, napi_callback_info info)
{
    const wchar_t *wc = L"ABCDEF";
    size_t want = PARAM_6;
    size_t ret = wcsnlen(wc, PARAM_6);
    napi_value result = nullptr;
    napi_create_int32(env, ret == want, &result);
    return result;
}

static napi_value Wcsnrtombs_One(napi_env env, napi_callback_info info)
{
    const wchar_t src[] = L"test wcsnrtombs";
    const wchar_t *p;
    mbstate_t mbs;
    char buffer[PARAM_32];
    int wn = PARAM_4;
    int n = PARAM_4;
    mbrlen(nullptr, PARAM_0, &mbs);
    memset(buffer, PARAM_0, sizeof(buffer));
    p = src;
    int ret = wcsnrtombs(buffer, &p, wn, n, &mbs);
    NAPI_ASSERT(env, ret > PARAM_0, "wcsnrtombs Error");
    napi_value result = nullptr;
    napi_create_int32(env, strcmp(buffer, "test") == ERRON_0, &result);
    return result;
}

static napi_value Wcspbrk_One(napi_env env, napi_callback_info info)
{
    wchar_t s[] = L"hello, world!";
    wchar_t *ret = wcspbrk(s, L"abch");
    NAPI_ASSERT(env, ret != nullptr, "wcspbrk Error");
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(ret, s) == ERRON_0, &result);
    return result;
}

static napi_value Wcsrchr_One(napi_env env, napi_callback_info info)
{
    wchar_t ch[] = L"hello, world";
    wchar_t *ret = wcsrchr(ch, L'h');
    NAPI_ASSERT(env, ret != nullptr, "wcsrchr Error");
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(ret, ch) == ERRON_0, &result);
    return result;
}

static napi_value Wcsrtombs_One(napi_env env, napi_callback_info info)
{
    char str[SIZE_256] = {PARAM_0};
    size_t want = PARAM_6;
    const wchar_t *src = L"ABCDEF";
    size_t ret = wcsrtombs(str, &src, PARAM_10, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret == want, &result);
    return result;
}

static napi_value Wcsspn_One(napi_env env, napi_callback_info info)
{
    size_t ret = wcsspn(L"hello world", L"abcdefghijklmnopqrstuvwxyz");
    size_t want = 5U;
    napi_value result = nullptr;
    napi_create_int32(env, ret == want, &result);
    return result;
}

static napi_value Wcsstr_One(napi_env env, napi_callback_info info)
{
    wchar_t wcs[] = L"This is a simple string";
    wchar_t *ret = nullptr;
    ret = wcsstr(wcs, L"simple");
    NAPI_ASSERT(env, ret != nullptr, "wcsstr Error");
    wcsncpy(ret, L"sample", PARAM_6);
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(ret, L"sample string") == ERRON_0, &result);
    return result;
}

static napi_value Wcstod_One(napi_env env, napi_callback_info info)
{
    wchar_t str0[] = L"3.14wcstod";
    wchar_t *end = nullptr;
    wchar_t str1[] = L"wcstod";
    double ret = wcstod(str0, &end);
    NAPI_ASSERT(env, (fabs(ret - PARAM_314) < DBL_EPSILON), "wcstod Error");
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(end, str1) == ERRON_0, &result);
    return result;
}

static napi_value Wcstof_One(napi_env env, napi_callback_info info)
{
    wchar_t str0[] = L"3.14wcstof";
    wchar_t *end = nullptr;
    wchar_t str1[] = L"wcstof";
    float ret = wcstof(str0, &end);
    NAPI_ASSERT(env, (fabsf(ret - 3.14f) < FLT_EPSILON), "wcstof Error");
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(end, str1) == ERRON_0, &result);
    return result;
}

static napi_value Wcstok_One(napi_env env, napi_callback_info info)
{
    wchar_t str[] = L"parrot,owl.sparrow,pigeon,crow";
    wchar_t delim[] = L",.";
    wchar_t *ptr;
    wchar_t *ret = wcstok(str, delim, &ptr);
    NAPI_ASSERT(env, ret != nullptr, "wcstok Error");
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(ret, L"parrot") == ERRON_0, &result);
    return result;
}

static napi_value Wcstol_One(napi_env env, napi_callback_info info)
{
    wchar_t wsNumbers[] = L"2001 60c0c0 -1101110100110100100000 0x6fffff";
    wchar_t *pEnd = nullptr;
    long int li1 = wcstol(wsNumbers, &pEnd, PARAM_10);
    long int li2 = wcstol(pEnd, &pEnd, PARAM_16);
    long int li3 = wcstol(pEnd, &pEnd, PARAM_2);
    long int li4 = wcstol(pEnd, nullptr, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, li1 == PARAM_2001 && li2 == PARAM_6340800 && li3 == MPARAM_36242240 && li4 == PARAM_7340031, &result);
    return result;
}

static napi_value Wcstold_One(napi_env env, napi_callback_info info)
{
    wchar_t str0[] = L"3.14wcstold";
    wchar_t *end = nullptr;
    wchar_t str1[] = L"wcstold";
    long double ret = wcstold(str0, &end);
    NAPI_ASSERT(env, (fabsl(ret - 3.14L) < LDBL_EPSILON), "wcstold Error");
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(end, str1) == ERRON_0, &result);
    return result;
}

static napi_value Wcstoll_One(napi_env env, napi_callback_info info)
{
    wchar_t wsNumbers[] = L"1856892505 17b00a12b -01100011010110000010001101100 0x6fffff";
    wchar_t *pEnd = nullptr;
    long long int lli1 = wcstoll(wsNumbers, &pEnd, PARAM_10);
    long long int lli2 = wcstoll(pEnd, &pEnd, PARAM_16);
    long long int lli3 = wcstoll(pEnd, &pEnd, PARAM_2);
    long long int lli4 = wcstoll(pEnd, nullptr, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, lli1 == PARAM_1856892505 && lli2 == PARAM_6358606123 && lli3 == MPARAM_208340076 && lli4 == PARAM_7340031, &result);
    return result;
}

static napi_value Wcstombs_One(napi_env env, napi_callback_info info)
{
    const wchar_t str[] = L"wcstombs example";
    char buffer[PARAM_32];
    int ret = wcstombs(buffer, str, sizeof(buffer));
    napi_value result = nullptr;
    napi_create_int32(env, ret == wcslen(L"wcstombs example"), &result);
    return result;
}

static napi_value Wcstoul_One(napi_env env, napi_callback_info info)
{
    unsigned long want = PARAM_25;
    unsigned long ret = wcstoul(L"25", nullptr, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, ret == want, &result);
    return result;
}

static napi_value Wcstoull_One(napi_env env, napi_callback_info info)
{
    wchar_t wsNumbers[] = L"250068492 7b06af00 1100011011110101010001100000 0x6fffff";
    wchar_t *pEnd;
    unsigned long long int ulli1 = wcstoull(wsNumbers, &pEnd, PARAM_10);
    unsigned long long int ulli2 = wcstoull(pEnd, &pEnd, PARAM_16);
    unsigned long long int ulli3 = wcstoull(pEnd, &pEnd, PARAM_2);
    unsigned long long int ulli4 = wcstoull(pEnd, nullptr, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, ulli1 == PARAM_250068492 && ulli2 == PARAM_2064035584 && ulli3 == PARAM_208622688 && ulli4 == PARAM_7340031,
                      &result);
    return result;
}

static napi_value Wcswcs_One(napi_env env, napi_callback_info info)
{
    wchar_t wstr[] = L"abcd";
    wchar_t wch[] = L"a";
    wchar_t *q = wcswcs(wstr, wch);
    napi_value result = nullptr;
    napi_create_int32(env, q - wstr == ERRON_0, &result);
    return result;
}

static napi_value Wcswidth_One(napi_env env, napi_callback_info info)
{
    int want = PARAM_2;
    int ret = wcswidth(L"abc", want);
    napi_value result = nullptr;
    napi_create_int32(env, ret == want, &result);
    return result;
}

static napi_value Wcsxfrm_One(napi_env env, napi_callback_info info)
{
    wchar_t wc[] = L"ABCD";
    wchar_t src[PARAM_20] = {PARAM_0};
    size_t ret = wcsxfrm(src, wc, PARAM_5);
    napi_value result = nullptr;
    napi_create_int32(env, ret == wcslen(wc), &result);
    return result;
}

static napi_value Wcsxfrml_One(napi_env env, napi_callback_info info)
{
    locale_t localInfo = nullptr;
    wchar_t wc[] = L"ABCD";
    wchar_t src[PARAM_20] = {PARAM_0};
    size_t ret = wcsxfrm_l(src, wc, PARAM_5, localInfo);
    napi_value result = nullptr;
    napi_create_int32(env, ret == wcslen(wc), &result);
    return result;
}

static napi_value Wctob_One(napi_env env, napi_callback_info info)
{
    wchar_t c = L'A';
    int ret = wctob(c);
    napi_value result = nullptr;
    napi_create_int32(env, ret == 'A', &result);
    return result;
}

static napi_value Wctomb_One(napi_env env, napi_callback_info info)
{
    char byte[SIZE_256] = {PARAM_0};
    int ret = wctomb(byte, L'h');
    napi_value result = nullptr;
    napi_create_int32(env, ret == SUCCESS, &result);
    return result;
}

static napi_value Wcwidth_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    const int INPUT_VALUE[PARAM_12] = {0x0300, 0x20dd, 0x00ad,  0x200b,  0x4e00, 0x9fff,
                                 0x3400, 0x4dbf, 0x20000, 0x2a6df, 0xac00, 0xd7a3};
    ret = wcwidth(INPUT_VALUE[PARAM_0]);
    NAPI_ASSERT(env, ret == ERRON_0, "wcwidth Error");
    ret = wcwidth(INPUT_VALUE[PARAM_1]);
    NAPI_ASSERT(env, ret == ERRON_0, "wcwidth Error");
    ret = wcwidth(INPUT_VALUE[PARAM_2]);
    NAPI_ASSERT(env, ret == SUCCESS, "wcwidth Error");
    ret = wcwidth(INPUT_VALUE[PARAM_3]);
    NAPI_ASSERT(env, ret == ERRON_0, "wcwidth Error");
    ret = wcwidth(INPUT_VALUE[PARAM_4]);
    NAPI_ASSERT(env, ret == PARAM_2, "wcwidth Error");
    ret = wcwidth(INPUT_VALUE[PARAM_11]);
    NAPI_ASSERT(env, ret == PARAM_2, "wcwidth Error");
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_2, &result);
    return result;
}

static napi_value Wmemchr_One(napi_env env, napi_callback_info info)
{
    wchar_t wcs[] = L"Example wide string";
    wchar_t *ret = wmemchr(wcs, L'p', wcslen(wcs));
    NAPI_ASSERT(env, ret != nullptr, "wcwidth Error");
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(ret, L"ple wide string") == ERRON_0, &result);
    return result;
}

static napi_value Wmemcmp_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    wchar_t str[] = L"ABCDEFG";
    wchar_t tar[] = L"ABCDEFF";
    ret = wmemcmp(str, tar, wcslen(str));
    NAPI_ASSERT(env, ret == SUCCESS, "wmemcmp Error");
    ret = wmemcmp(tar, str, wcslen(str));
    NAPI_ASSERT(env, ret == MPARAM_1, "wmemcmp Error");
    ret = wmemcmp(str, str, wcslen(str));
    NAPI_ASSERT(env, ret == ERRON_0, "wmemcmp Error");
    napi_value result = nullptr;
    napi_create_int32(env, ret == ERRON_0, &result);
    return result;
}

static napi_value Wmemcpy_One(napi_env env, napi_callback_info info)
{
    wchar_t dest[PARAM_3];
    wchar_t src[] = L"aaa";
    wchar_t *ret = wmemcpy(dest, src, PARAM_3);
    NAPI_ASSERT(env, ret != nullptr, "wmemcpy Error");
    napi_value result = nullptr;
    napi_create_int32(env, wcsncmp(dest, src, PARAM_3) == ERRON_0, &result);
    return result;
}

static napi_value Wmemmove_One(napi_env env, napi_callback_info info)
{
    wchar_t src[] = L"This is a c test for wmemmove function";
    wchar_t *dest = &src[PARAM_0];
    wchar_t *ret = wmemmove(dest, src, PARAM_5);
    NAPI_ASSERT(env, ret != nullptr, "wmemmove Error");
    napi_value result = nullptr;
    napi_create_int32(env, ret == dest, &result);
    return result;
}

static napi_value Wmemset_One(napi_env env, napi_callback_info info)
{
    wchar_t wcs[] = L"almost every programmer should know wmemset!";
    wchar_t *ret = wmemset(wcs, L'-', PARAM_6);
    NAPI_ASSERT(env, ret != nullptr, "wmemset Error");
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(ret, L"------ every programmer should know wmemset!") == ERRON_0, &result);
    return result;
}

extern "C" int Vfwprintf_Test(const wchar_t *format, ...);
int Vfwprintf_Test(FILE *stream, const wchar_t *format, ...)
{
    va_list args;
    va_start(args, format);
    int ret = vfwprintf(stream, format, args);
    va_end(args);
    return ret;
}
static napi_value Vfwprintf_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(TEMP_FILE, "w");
    NAPI_ASSERT(env, fp != nullptr, "Vfwprintf_One fopen Error");
    int ret = MINUSONE;
    ret = Vfwprintf_Test(fp, L"Call with %d variable argument.\n", PARAM_1);
    NAPI_ASSERT(env, ret = PARAM_31, "vfwprintf Error");
    ret = Vfwprintf_Test(fp, L"Call with %d variable %ls.\n", PARAM_2, L"arguments");
    fclose(fp);
    remove(TEMP_FILE);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_32, &result);
    return result;
}

extern "C" int Vswprintf_Test(const wchar_t *format, ...);
int Vswprintf_Test(const wchar_t *format, ...)
{
    wchar_t buffer[SIZE_256];
    va_list args;
    va_start(args, format);
    int ret = vswprintf(buffer, SIZE_256, format, args);
    fputws(buffer, stdout);
    va_end(args);
    return ret;
}

static napi_value Vswprintf_One(napi_env env, napi_callback_info info)
{
    wchar_t str[] = L"test string has %d wide characters.\n";
    size_t ret = MINUSONE;
    ret = Vswprintf_Test(str, wcslen(str));
    napi_value result = nullptr;
    napi_create_int32(env, ret == wcslen(str), &result);
    return result;
}

extern "C" int Vwscanf_Test(const wchar_t *format, ...);
int Vwscanf_Test(const wchar_t *format, ...)
{
    va_list args;
    va_start(args, format);
    int ret = vwscanf(format, args);
    va_end(args);
    return ret;
}

static napi_value Vwscanf_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(TEMP_FILE, "w");
    NAPI_ASSERT(env, fp != nullptr, "Vwscanf_One fopen Error");
    wchar_t wstr[] = L"vwscanf";
    fputws(wstr, fp);
    fseek(fp, PARAM_0, SEEK_SET);
    FILE *fp1 = freopen(TEMP_FILE, "r", stdin);
    NAPI_ASSERT(env, fp1 != nullptr, "Vwscanf_One freopen Error");
    wchar_t wch[PARAM_20];
    int ret = Vwscanf_Test(L"%ls", wch);
    NAPI_ASSERT(env, ret == SUCCESS, "vwscanf Error");
    fclose(fp);
    fclose(fp1);
    remove(TEMP_FILE);
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(wch, wstr) == ERRON_0, &result);
    return result;
}

extern "C" int Vwprintf_Test(const wchar_t *format, ...);
int Vwprintf_Test(const wchar_t *format, ...)
{
    va_list args;
    va_start(args, format);
    int ret = vwprintf(format, args);
    va_end(args);
    return ret;
}
static napi_value Vwprintf_One(napi_env env, napi_callback_info info)
{
    int ret = MINUSONE;
    ret = Vwprintf_Test(L"Call with %d variable %ls.\n", PARAM_2, L"arguments");
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_32, &result);
    return result;
}

extern "C" int Vfwscanf_Test(FILE *fp, const wchar_t *format, ...);
int Vfwscanf_Test(FILE *fp, const wchar_t *format, ...)
{
    va_list args;
    va_start(args, format);
    int result = vfwscanf(fp, format, args);
    va_end(args);
    return result;
}

static napi_value Vfwscanf_One(napi_env env, napi_callback_info info)
{
    setlocale(LC_ALL, "en_US.UTF-8");
    wchar_t symbol[] = L"\u0915\u0916\u0917\u0918\u0919";
    wchar_t names[PARAM_5][PARAM_5] = {L"Ka", L"Kha", L"Ga", L"Gha", L"Nga"};
    FILE *fp = fopen(TEMP_FILE, "w+");
    NAPI_ASSERT(env, fp != nullptr, "vfwscanf fopen Error");
    for (int i = PARAM_0; i < PARAM_5; i++) {
        fwprintf(fp, L"%lc %ls ", symbol[i], names[i]);
    }
    fseek(fp, PARAM_0, SEEK_SET);
    wchar_t ch, str[PARAM_5];
    int ret = PARAM_0;
    for (ret = PARAM_0; ret < PARAM_5; ret++) {
        Vfwscanf_Test(fp, L"%lc %ls ", &ch, str);
        NAPI_ASSERT(env, wcscmp(str, names[ret]) == ERRON_0, "vfwscanf Error");
    }
    fclose(fp);
    remove(TEMP_FILE);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_5, &result);
    return result;
}

static napi_value Getwchar_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(TEMP_FILE, "w");
    NAPI_ASSERT(env, fp != nullptr, "Getwchar_One fopen Error");
    wchar_t wstr[] = L"getwchar";
    fputws(wstr, fp);
    fseek(fp, PARAM_0, SEEK_SET);
    FILE *fp1 = freopen(TEMP_FILE, "r", stdin);
    NAPI_ASSERT(env, fp1 != nullptr, "Getwchar_One freopen Error");
    wint_t ret = getwchar();
    fclose(fp);
    fclose(fp1);
    remove(TEMP_FILE);
    napi_value result = nullptr;
    napi_create_int32(env, static_cast<wchar_t>(ret) == L'g', &result);
    return result;
}

static napi_value Wscanf_One(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen(TEMP_FILE, "w");
    NAPI_ASSERT(env, fp != nullptr, "Wscanf_One fopen Error");
    wchar_t wstr[] = L"testwscanf";
    fputws(wstr, fp);
    fseek(fp, PARAM_0, SEEK_SET);
    FILE *fp1 = freopen(TEMP_FILE, "r", stdin);
    NAPI_ASSERT(env, fp1 != nullptr, "Wscanf_One freopen Error");
    wchar_t wch[50] = {PARAM_0};
    int ret = wscanf(L"%ls", wch);
    NAPI_ASSERT(env, ret == SUCCESS, "wscanf Error");
    fclose(fp);
    fclose(fp1);
    remove(TEMP_FILE);
    napi_value result = nullptr;
    napi_create_int32(env, wcscmp(wch, L"testwscanf") == ERRON_0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"Btowc_One", nullptr, Btowc_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Btowc_Two", nullptr, Btowc_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fputwc_One", nullptr, Fputwc_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fputws_One", nullptr, Fputws_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fwide_One", nullptr, Fwide_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fwide_Two", nullptr, Fwide_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fwprintf_One", nullptr, Fwprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fwprintf_Two", nullptr, Fwprintf_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fwscanf_One", nullptr, Fwscanf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Fwscanf_Two", nullptr, Fwscanf_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getwchar_One", nullptr, Getwchar_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Mbrtowc_One", nullptr, Mbrtowc_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Mbsinit_One", nullptr, Mbsinit_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Mbsnrtowcs_One", nullptr, Mbsnrtowcs_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Mbsrtowcs_One", nullptr, Mbsrtowcs_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Mbstowcs_One", nullptr, Mbstowcs_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Mbtowc_One", nullptr, Mbtowc_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Mbtowc_Two", nullptr, Mbtowc_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OpenWmemstream_One", nullptr, OpenWmemstream_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Putwc_One", nullptr, Putwc_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PutWChar_One", nullptr, PutWChar_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Swprintf_One", nullptr, Swprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Swprintf_Two", nullptr, Swprintf_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Swscanf_One", nullptr, Swscanf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Swscanf_Two", nullptr, Swscanf_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Towlower_One", nullptr, Towlower_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Towupper_One", nullptr, Towupper_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Ungetwc_One", nullptr, Ungetwc_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vfwprintf_One", nullptr, Vfwprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vfwscanf_One", nullptr, Vfwscanf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vswprintf_One", nullptr, Vswprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vwprintf_One", nullptr, Vwprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Vwscanf_One", nullptr, Vwscanf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcpcpy_One", nullptr, Wcpcpy_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcpncpy_One", nullptr, Wcpncpy_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcrtomb_One", nullptr, Wcrtomb_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcscasecmp_One", nullptr, Wcscasecmp_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcscasecmpl_One", nullptr, Wcscasecmpl_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcscat_One", nullptr, Wcscat_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcschr_One", nullptr, Wcschr_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcscmp_One", nullptr, Wcscmp_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcscoll_One", nullptr, Wcscoll_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcscolll_One", nullptr, Wcscolll_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcscpy_One", nullptr, Wcscpy_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcscspn_One", nullptr, Wcscspn_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsdup_One", nullptr, Wcsdup_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsftime_One", nullptr, Wcsftime_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsftimel_One", nullptr, Wcsftimel_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcslen_One", nullptr, Wcslen_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsncasecmp_One", nullptr, Wcsncasecmp_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsncasecmpl_One", nullptr, Wcsncasecmpl_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsncat_One", nullptr, Wcsncat_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsncmp_One", nullptr, Wcsncmp_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsncpy_One", nullptr, Wcsncpy_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsnlen_One", nullptr, Wcsnlen_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsnrtombs_One", nullptr, Wcsnrtombs_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcspbrk_One", nullptr, Wcspbrk_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsrchr_One", nullptr, Wcsrchr_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsrtombs_One", nullptr, Wcsrtombs_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsspn_One", nullptr, Wcsspn_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsstr_One", nullptr, Wcsstr_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcstod_One", nullptr, Wcstod_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcstof_One", nullptr, Wcstof_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcstok_One", nullptr, Wcstok_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcstol_One", nullptr, Wcstol_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcstold_One", nullptr, Wcstold_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcstoll_One", nullptr, Wcstoll_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcstombs_One", nullptr, Wcstombs_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcstoul_One", nullptr, Wcstoul_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcstoull_One", nullptr, Wcstoull_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcswcs_One", nullptr, Wcswcs_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcswidth_One", nullptr, Wcswidth_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsxfrm_One", nullptr, Wcsxfrm_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcsxfrml_One", nullptr, Wcsxfrml_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wctob_One", nullptr, Wctob_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wctomb_One", nullptr, Wctomb_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wcwidth_One", nullptr, Wcwidth_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wmemchr_One", nullptr, Wmemchr_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wmemcmp_One", nullptr, Wmemcmp_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wmemcpy_One", nullptr, Wmemcpy_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wmemmove_One", nullptr, Wmemmove_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wmemset_One", nullptr, Wmemset_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wprintf_One", nullptr, Wprintf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wprintf_Two", nullptr, Wprintf_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Wscanf_One", nullptr, Wscanf_One, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "wcharndk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
