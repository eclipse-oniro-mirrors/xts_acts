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
#include "cstdio"
#include "cstdlib"
#include "napi/native_api.h"
#include <cerrno>
#include <clocale>
#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <cwchar>
#include <js_native_api.h>
#include <linux/elf-fdpic.h>
#include <node_api.h>
#include <unistd.h>

#define FAIL (-1)
#define NORMAL 1
#define MAX (20)
#define ONEVAL 1
#define MINUSONE (-1)
#define NUMBER 5
#define MAX_NUMBER 60

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_10 10
#define PARAM_20 20
#define PARAM_0x0 0x0
#define PARAM_0x00ad 0x00ad
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define RETURN_ONE 1
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_3 3
#define SIZE_5 5
#define SIZE_6 6
#define SIZE_10 10
#define SIZE_13 13
#define SIZE_18 18
#define SIZE_20 20
#define SIZE_25 25
#define SIZE_30 30
#define SIZE_80 80
#define SIZE_100 100
#define SIZE_256 256
#define SIZE_1024 1024
#define SIZE_4096 4096
#define SIZE_8192 8192
#define ASCII_LA 97
#define SUCCESS 1
#define ARRY_MAX 128
#define ZEROVAL 0
#define ZERO 0

int vfwprintfTest(FILE *stream, wchar_t *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    int vfwval = vfwprintf(stream, fmt, ap);
    va_end(ap);
    return vfwval;
}

static napi_value Vfwprintf(napi_env env, napi_callback_info info)
{
    wchar_t value[] = L"hello %ls";
    char file_name[SIZE_256] = "/data/storage/el2/base/files/test.txt";
    FILE *file = fopen(file_name, "w");
    int vfwval = vfwprintfTest(file, value, L"world");
    napi_value result;
    if (vfwval < PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    fclose(file);
    return result;
}

int vfwscanfTest(FILE *fp, const wchar_t *format, ...)
{
    va_list args;
    va_start(args, format);
    int vfwval = vfwscanf(fp, format, args);
    va_end(args);
    return vfwval;
}

static napi_value Vfwscanf(napi_env env, napi_callback_info info)
{
    setlocale(LC_ALL, "en_US.UTF-8");
    wchar_t symbol[] = L"\u0915\u0916\u0917\u0918\u0919";
    wchar_t names[NUMBER][NUMBER] = {L"Ka", L"Kha", L"Ga", L"Gha", L"Nga"};
    FILE *fp = fopen("/data/storage/el2/base/files/test.txt", "w+");
    for (int i = PARAM_0; i < NUMBER; i++)
        fwprintf(fp, L"%lc %ls ", symbol[i], names[i]);
    rewind(fp);
    napi_value result;
    wchar_t ch, str[NUMBER];
    for (int i = PARAM_0; i < NUMBER; i++) {
        vfwscanfTest(fp, L"%lc %ls ", &ch, str);
        if (wcscmp(str, names[i]) != PARAM_0) {
            napi_create_int32(env, MINUSONE, &result);
        } else {
            napi_create_int32(env, PARAM_0, &result);
        }
    }
    fclose(fp);
    unlink("/data/storage/el2/base/files/test.txt");
    return result;
}

int vswprintfTest(wchar_t *ws, size_t len, const wchar_t *format, ...)
{
    va_list arg;
    va_start(arg, format);
    int vswval = vswprintf(ws, len, format, arg);
    va_end(arg);
    return vswval;
}

static napi_value Vswprintf(napi_env env, napi_callback_info info)
{
    wchar_t ws[MAX_NUMBER];
    wchar_t str[] = L"\u0025 \u0026 \u0027 \u0028 \u0029";
    int vswval = vswprintfTest(ws, MAX_NUMBER, L"Some Latin letters : %ls\n", str);
    napi_value result;
    if (vswval < PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

int vwprintfTest(wchar_t *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    int vmpval = vwprintf(fmt, ap);
    va_end(ap);
    return vmpval;
}

static napi_value Vwprintf(napi_env env, napi_callback_info info)
{
    wchar_t value[] = L"hello %ls\n";
    int vmpval = vwprintfTest(value, L"world");
    napi_value result;
    if (vmpval < PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

int GetWideMatches(wchar_t *format, ...)
{
    errno = ERRON_0;
    va_list args;
    va_start(args, format);
    int vwsval = vwscanf(format, args);
    va_end(args);
    return vwsval;
}
static napi_value Wcpcpy(napi_env env, napi_callback_info info)
{
    wchar_t deSt[20];
    wchar_t src[] = L"123456";
    wcpcpy(deSt, src);
    int value = wcslen(deSt);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcscat(napi_env env, napi_callback_info info)
{
    wchar_t deSt[50] = L"1234";
    wchar_t src[50] = L"5678";
    wcscat(deSt, src);
    int value = wcslen(deSt);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcschr(napi_env env, napi_callback_info info)
{
    wchar_t deSt[] = L"1234";
    wchar_t src = L'5';
    int value = FAIL;
    if (wcschr(deSt, src) == nullptr) {
        value = PARAM_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcscmp(napi_env env, napi_callback_info info)
{
    wchar_t deSt[50] = L"12345";
    wchar_t src[50] = L"12345";
    int wcscmpValue = wcscmp(deSt, src);
    napi_value result = nullptr;
    napi_create_int32(env, wcscmpValue, &result);

    return result;
}

static napi_value Wcscoll(napi_env env, napi_callback_info info)
{
    wchar_t deSt[50] = L"12345";
    wchar_t src[50] = L"12345";
    int wcscmpValue = wcscoll(deSt, src);
    napi_value result = nullptr;
    napi_create_int32(env, wcscmpValue, &result);

    return result;
}

static napi_value Wcscpy(napi_env env, napi_callback_info info)
{
    wchar_t deSt[20];
    wchar_t src[] = L"123456";
    wcscpy(deSt, src);
    int value = wcslen(deSt);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcscspn(napi_env env, napi_callback_info info)
{
    wchar_t deSt[9] = L"12345";
    wchar_t src[] = L"52678";
    size_t value = wcscspn(deSt, src);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcsdup(napi_env env, napi_callback_info info)
{
    wchar_t deSt[] = L"12345";
    int value = FAIL;
    if (wcsdup(deSt) != nullptr) {
        value = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcslen(napi_env env, napi_callback_info info)
{
    wchar_t src[] = L"abcd";
    int value = wcslen(src);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcsncat(napi_env env, napi_callback_info info)
{
    wchar_t deSt[50] = L"123";
    wchar_t src[] = L"456";
    wcsncat(deSt, src, NORMAL);
    int value = wcslen(deSt);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcsncmp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    wchar_t deSt[50] = L"1232";
    wchar_t src[50] = L"1231";
    int wcsncmp_value = wcsncmp(deSt, src, valueFirst);
    napi_value result = nullptr;
    napi_create_int32(env, wcsncmp_value, &result);

    return result;
}

static napi_value Wcsnlen(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    wchar_t src[] = L"abcde";
    int value = wcsnlen(src, valueFirst);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Wcspbrk(napi_env env, napi_callback_info info)
{
    wchar_t deSt[] = L"abcd";
    wchar_t src[] = L"a";
    wchar_t *wcspbrk_value = wcspbrk(deSt, src);
    int value = FAIL;
    if (wcspbrk_value != nullptr) {
        value = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Mbrtowc(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    char pt[] = "mbrtowc example";
    int max = strlen(pt);
    wchar_t dest;
    size_t length;
    mbstate_t mbs;
    mbrlen(nullptr, PARAM_0, &mbs);
    length = mbrtowc(&dest, pt, max, &mbs);
    if (length > PARAM_0) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Fputwc(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    wchar_t str[] = L"T";
    int ret = FAIL;
    wint_t wc;
    FILE *fp = fopen(path, "w+");

    for (unsigned int i = PARAM_0; i < wcslen(str); i++) {
        wc = fputwc(str[i], fp);
        if (wc == str[i]) {
            ret = PARAM_0;
        }
    }

    fclose(fp);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value Getwchar(napi_env env, napi_callback_info info)
{
    wint_t wc = getwchar();
    napi_value result = nullptr;
    if (wc == WEOF) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

static napi_value Putwc(napi_env env, napi_callback_info info)
{
    const char *ptr = "/data/storage/el2/base/files/test.txt";
    FILE *fptr = fopen(ptr, "w+");
    wchar_t wc = L'p';
    putwc(wc, fptr);
    rewind(fptr);
    wint_t wret = getwc(fptr);
    napi_value result = nullptr;
    if (wret == wc) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    fclose(fptr);
    return result;
}

static napi_value PutWChar(napi_env env, napi_callback_info info)
{
    wchar_t wc = L'p';
    char ret = putwchar(wc);
    napi_value result = nullptr;
    if (ret == wc) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value OpenWmemstream(napi_env env, napi_callback_info info)
{
    size_t len = PARAM_UNNORMAL;
    int ret = PARAM_0;
    wchar_t *ptr = nullptr;

    FILE *fp = open_wmemstream(&ptr, &len);

    ret = fprintf(fp, "open_wmemstream success!");
    ret = fclose(fp);
    free(ptr);
    ptr = nullptr;
    napi_value result = nullptr;

    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Mbsinit(napi_env env, napi_callback_info info)
{
    mbstate_t mbst;
    memset(&mbst, PARAM_0, sizeof(mbst));
    int ret = mbsinit(&mbst);
    if (ret != PARAM_0) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Mbsnrtowcs(napi_env env, napi_callback_info info)
{
    const char *test = "musl test";
    wchar_t wc[ARRY_MAX];
    memset(wc, PARAM_0, sizeof(wc));
    size_t ret = mbsnrtowcs(wc, &test, PARAM_2, ARRY_MAX, nullptr);
    if (ret != PARAM_UNNORMAL) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Mbsrtowcs(napi_env env, napi_callback_info info)
{
    setlocale(LC_ALL, "en_US.utf8");
    const char *src = "\u0763\u0757";
    wchar_t dest[20];
    mbstate_t ps = mbstate_t();
    int max = PARAM_10;
    int ret = mbsrtowcs(dest, &src, max, &ps);
    if (ret != PARAM_UNNORMAL) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Mbstowcs(napi_env env, napi_callback_info info)
{
    const char *src = "mbstowcs_0100";
    wchar_t dst[ARRY_MAX];
    memset(dst, PARAM_0x0, sizeof(wchar_t) * ARRY_MAX);
    size_t ret = mbstowcs(dst, src, strlen(src));
    if (ret > PARAM_0) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Mbtowc(napi_env env, napi_callback_info info)
{
    const char *test = "musl";
    wchar_t wc[ARRY_MAX];
    size_t ret = PARAM_0;
    ret = mbtowc(wc, test, PARAM_1);
    if (ret == PARAM_1) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Swprintf(napi_env env, napi_callback_info info)
{
    wchar_t hebrew_str[] = L"\u05D0 \u05D1 \u05E1 \u05D3 \u05EA";
    wchar_t buffer[MAX];
    int value = swprintf(buffer, MAX, L"%ls", hebrew_str);
    napi_value resultS = nullptr;
    napi_create_int32(env, value, &resultS);
    return resultS;
}

static napi_value Swscanf(napi_env env, napi_callback_info info)
{
    wchar_t wstr[] = L"swscanf 123";
    int i, j;
    int value = swscanf(wstr, L"%d %d", &i, &j);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Wscanf(napi_env env, napi_callback_info info)
{
    wchar_t wstr[] = L"swscanf 123";
    int i, j;
    int value = wscanf(wstr, L"%d %d", &i, &j);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Vwscanf(napi_env env, napi_callback_info info)
{
    wchar_t wstr[] = L"swscanf 123";
    va_list aptr;
    int value = vwscanf(wstr, aptr);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Towlower(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int towlower_value = FAILD;
    if (param == PARAM_0) {
        char ch = 'A';
        char result = towlower(ch);
        if (result == 'a') {
            towlower_value = RETURN_0;
        }
    } else if (param == PARAM_1) {
        char ch = PARAM_2;
        char result = towlower(ch);
        if (result == ch) {
            towlower_value = RETURN_0;
        }

    } else if (param == PARAM_2) {
        char ch = 'a';
        char result = towlower(ch);
        if (result == 'a') {
            towlower_value = RETURN_0;
        }
    } else {
        char ch = '$';
        char result = towlower(ch);
        if (result == '$') {
            towlower_value = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, towlower_value, &result);

    return result;
}

static napi_value Towupper(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int towupper_value = FAILD;
    if (param == PARAM_0) {
        char ch = 'a';
        char result = towupper(ch);
        if (result == 'A') {
            towupper_value = RETURN_0;
        }
    } else if (param == PARAM_1) {
        char ch = PARAM_2;
        char result = towupper(ch);
        if (result == ch) {
            towupper_value = RETURN_0;
        }

    } else if (param == PARAM_2) {
        char ch = 'A';
        char result = towupper(ch);
        if (result == 'A') {
            towupper_value = RETURN_0;
        }
    } else {
        char ch = '$';
        char result = towupper(ch);
        if (result == '$') {
            towupper_value = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, towupper_value, &result);

    return result;
}

static napi_value Wcpncpy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int sizeParam;
    napi_get_value_int32(env, args[0], &sizeParam);

    wchar_t src[] = L"Source string";
    wchar_t dest[SIZE_18];

    int resultValue = RETURN_0;
    wchar_t *wcpncpyValue = wcpncpy(dest, src, sizeParam);

    if (wcscmp(wcpncpyValue, dest + sizeParam) != PARAM_0) {
        resultValue = FAILD;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wcrtomb(napi_env env, napi_callback_info info)
{
    wchar_t src = L'A';
    char dest[SIZE_25];
    mbstate_t ps = mbstate_t();

    int wcrtomb_value = wcrtomb(dest, src, &ps);

    napi_value result = nullptr;
    napi_create_int32(env, wcrtomb_value, &result);

    return result;
}

static napi_value Wcscasecmp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int wcscasecmp_value;
    if (param == PARAM_0) {
        wcscasecmp_value = wcscasecmp(L"hello", L"HELLO");
    } else if (param > PARAM_0) {
        wcscasecmp_value = wcscasecmp(L"helloA", L"HELLO");
    } else {
        wcscasecmp_value = wcscasecmp(L"hello", L"HELLOA");
    }

    napi_value result = nullptr;
    napi_create_int32(env, wcscasecmp_value, &result);

    return result;
}

static napi_value WcscasecmpL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    locale_t locale = nullptr;
    int wcscasecmpLValue;
    if (param == PARAM_0) {
        wcscasecmpLValue = wcscasecmp_l(L"hello", L"HELLO", locale);
    } else if (param > PARAM_0) {
        wcscasecmpLValue = wcscasecmp_l(L"helloA", L"HELLO", locale);
    } else {
        wcscasecmpLValue = wcscasecmp_l(L"hello", L"HELLOA", locale);
    }

    napi_value result = nullptr;
    napi_create_int32(env, wcscasecmpLValue, &result);

    return result;
}

static napi_value WcscollL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    locale_t locale = nullptr;
    int wcscmpValue;
    if (param == PARAM_0) {
        wcscmpValue = wcscoll_l(L"12345", L"12345", locale);
    } else if (param > PARAM_0) {
        wcscmpValue = wcscoll_l(L"12345A", L"12345", locale);
    } else {
        wcscmpValue = wcscoll_l(L"12345", L"12345A", locale);
    }

    napi_value result = nullptr;
    napi_create_int32(env, wcscmpValue, &result);

    return result;
}

static napi_value Wcsftime(napi_env env, napi_callback_info info)
{
    time_t rtime;
    struct tm *timeinfo;
    wchar_t buffer[80];
    time(&rtime);
    timeinfo = localtime(&rtime);
    int wcsftime_value = wcsftime(buffer, SIZE_80, L"%Y", timeinfo);

    napi_value result = nullptr;
    napi_create_double(env, wcsftime_value, &result);

    return result;
}

static napi_value WcsftimeL(napi_env env, napi_callback_info info)
{
    time_t rtime;
    struct tm *timeinfo;
    wchar_t buffer[SIZE_80];
    time(&rtime);
    timeinfo = localtime(&rtime);
    locale_t locale = nullptr;
    int wcsftime_l_value = wcsftime_l(buffer, SIZE_80, L"%Y", timeinfo, locale);

    napi_value result = nullptr;
    napi_create_double(env, wcsftime_l_value, &result);

    return result;
}

static napi_value Wcsncasecmp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int sizeParam;
    napi_get_value_int32(env, args[0], &sizeParam);

    int wcsncasecmp_value;
    if (sizeParam == PARAM_0) {
        wcsncasecmp_value = wcsncasecmp(L"hello", L"HELLO", SIZE_6);
    } else if (sizeParam > PARAM_0) {
        wcsncasecmp_value = wcsncasecmp(L"hello2", L"HELLO1", SIZE_6);
    } else {
        wcsncasecmp_value = wcsncasecmp(L"hello1", L"HELLO2", SIZE_6);
    }

    napi_value result = nullptr;
    napi_create_int32(env, wcsncasecmp_value, &result);

    return result;
}

static napi_value WcsncasecmpL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int sizeParam;
    napi_get_value_int32(env, args[0], &sizeParam);

    locale_t locale = nullptr;
    int wcsncasecmp_l_value;
    if (sizeParam == PARAM_0) {
        wcsncasecmp_l_value = wcsncasecmp_l(L"hello", L"HELLO", SIZE_6, locale);
    } else if (sizeParam > PARAM_0) {
        wcsncasecmp_l_value = wcsncasecmp_l(L"hello2", L"HELLO1", SIZE_6, locale);
    } else {
        wcsncasecmp_l_value = wcsncasecmp_l(L"hello1", L"HELLO2", SIZE_6, locale);
    }

    napi_value result = nullptr;
    napi_create_int32(env, wcsncasecmp_l_value, &result);

    return result;
}

static napi_value Wcsncpy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int sizeParam;
    napi_get_value_int32(env, args[0], &sizeParam);

    int resultValue = RETURN_0;
    if (sizeParam == PARAM_1) {
        const wchar_t src[] = L"Hello";
        wchar_t buf[SIZE_6];
        wmemset(buf, L'A', SIZE_6);
        wchar_t *dest = static_cast<wchar_t *>(buf);

        if (dest == wcsncpy(dest, src, SIZE_6)) {
            resultValue = RETURN_ONE;
        }

    } else {
        wchar_t src[] = L"Hello";
        wchar_t *result = wcsncpy(nullptr, src, PARAM_0);
        if (result == nullptr) {
            resultValue = RETURN_ONE;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wcsrchr(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    wchar_t dest[] = L"abcdefg";
    wchar_t *p;
    int resultValue;
    if (param == PARAM_0) {
        p = wcsrchr(dest, L'a');
        if (p) {
            resultValue = RETURN_0;
        } else {
            resultValue = FAILD;
        }
    } else {
        p = wcsrchr(dest, L'1');
        if (p) {
            resultValue = RETURN_0;
        } else {
            resultValue = FAILD;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wcsrtombs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int sizeParam;
    napi_get_value_int32(env, args[0], &sizeParam);

    const wchar_t *src = L"abcdefg";
    char dest[SIZE_20];
    mbstate_t ps = mbstate_t();

    size_t wcsrtombsValue = wcsrtombs(dest, &src, sizeParam, &ps);

    napi_value result = nullptr;
    napi_create_int32(env, wcsrtombsValue, &result);

    return result;
}

static napi_value Wcsspn(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    wchar_t dest[] = L"abcdefg";

    int wcsspn_value;
    if (param == PARAM_0) {
        wchar_t src[] = L"abc";
        wcsspn_value = wcsspn(dest, src);

    } else {
        wchar_t src[] = L"123";
        wcsspn_value = wcsspn(dest, src);
    }

    napi_value result = nullptr;
    napi_create_int32(env, wcsspn_value, &result);

    return result;
}

static napi_value Wcsstr(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    wchar_t dest[] = L"ab cd efg";

    int wcsstrValue;
    if (param == PARAM_0) {
        wchar_t src[] = L"cd";
        wchar_t *p = wcsstr(dest, src);
        if (p) {
            wcsstrValue = RETURN_0;
        } else {
            wcsstrValue = FAILD;
        }

    } else {
        wchar_t src[] = L"1";
        wchar_t *p = wcsstr(dest, src);
        if (p) {
            wcsstrValue = RETURN_0;
        } else {
            wcsstrValue = FAILD;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, wcsstrValue, &result);

    return result;
}

static napi_value Wcstod(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    double wcstod_value;
    if (param == PARAM_0) {
        wchar_t dest[] = L"abcdefg";
        wchar_t *end;
        wcstod_value = wcstod(dest, &end);
    } else {
        wchar_t dest[] = L"95.6abcdefg";
        wchar_t *end;
        wcstod_value = wcstod(dest, &end);
    }

    napi_value result = nullptr;
    napi_create_double(env, wcstod_value, &result);

    return result;
}

static napi_value Wcstof(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    double wcstof_value;
    if (param == PARAM_0) {
        wchar_t dest[] = L"abcdefg";
        wchar_t *end;
        wcstof_value = wcstof(dest, &end);
    } else {
        wchar_t dest[] = L"95.6abcdefg";
        wchar_t *end;
        wcstof_value = wcstof(dest, &end);
    }

    napi_value result = nullptr;
    napi_create_double(env, wcstof_value, &result);

    return result;
}

static napi_value Wcstok(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    wchar_t *ptr;
    int wcstokValue = FAILD;
    if (param == PARAM_0) {
        wchar_t str[] = L"123,456";
        wchar_t delim[] = L",";
        wchar_t *want = wcstok(str, delim, &ptr);
        if (wcscmp(want, L"123") == PARAM_0) {
            wcstokValue = RETURN_0;
        }
    } else {
        wchar_t str[] = L"123,456";
        wchar_t delim[] = L"/";
        wchar_t *want = wcstok(str, delim, &ptr);
        if (wcscmp(want, str) == PARAM_0) {
            wcstokValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, wcstokValue, &result);

    return result;
}

static napi_value Wcstol(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param;
    napi_get_value_int32(env, args[0], &param);

    double wcstol_value;
    if (param == PARAM_0) {
        wcstol_value = wcstol(L"123AB-20", nullptr, SIZE_10);
    } else {
        wchar_t *endString = nullptr;
        wcstol_value = wcstol(L"123xyz", &endString, SIZE_10);
    }

    napi_value result = nullptr;
    napi_create_double(env, wcstol_value, &result);

    return result;
}

static napi_value Wcstold(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param;
    napi_get_value_int32(env, args[0], &param);

    double wcstoldValue;
    if (param == PARAM_0) {
        wchar_t str[] = L"123AB-20";
        wchar_t *end = nullptr;
        wcstoldValue = wcstold(str, &end);
    } else {
        wchar_t str[] = L"123xyz";
        wchar_t *end = nullptr;
        wcstoldValue = wcstold(str, &end);
    }

    napi_value result = nullptr;
    napi_create_double(env, wcstoldValue, &result);

    return result;
}

static napi_value Wcstoll(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param;
    napi_get_value_int32(env, args[0], &param);

    double wcstollValue;
    if (param == PARAM_0) {
        wcstollValue = wcstoll(L"123AB-20", nullptr, SIZE_10);
    } else {
        wchar_t *endString = nullptr;
        wcstollValue = wcstoll(L"123xyz", &endString, SIZE_10);
    }

    napi_value result = nullptr;
    napi_create_double(env, wcstollValue, &result);

    return result;
}

static napi_value Wcstombs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param;
    napi_get_value_int32(env, args[0], &param);

    wchar_t src[] = L"HelloWorld";
    char dest[SIZE_100];
    int wcstombsValue = wcstombs(dest, src, param);

    napi_value result = nullptr;
    napi_create_double(env, wcstombsValue, &result);

    return result;
}

static napi_value Wcstoul(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param;
    napi_get_value_int32(env, args[0], &param);

    double wcstoul_value;
    if (param == PARAM_0) {
        wcstoul_value = wcstoul(L"123AB-20", nullptr, SIZE_10);
    } else {
        wchar_t *endString = nullptr;
        wcstoul_value = wcstoul(L"123xyz", &endString, SIZE_10);
    }

    napi_value result = nullptr;
    napi_create_double(env, wcstoul_value, &result);

    return result;
}

static napi_value Wcstoull(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param;
    napi_get_value_int32(env, args[0], &param);

    double wcstoullValue;
    if (param == PARAM_0) {
        wcstoullValue = wcstoull(L"123AB-20", nullptr, SIZE_10);
    } else {
        wchar_t *endString = nullptr;
        wcstoullValue = wcstoll(L"123xyz", &endString, SIZE_10);
    }

    napi_value result = nullptr;
    napi_create_double(env, wcstoullValue, &result);

    return result;
}

static napi_value Wcswidth(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int param;
    napi_get_value_int32(env, args[0], &param);

    int wcswidth_value;
    if (param == PARAM_0) {
        wcswidth_value = wcswidth(L"abc", PARAM_2);
    } else {
        wcswidth_value = wcswidth(L"a\tb", PARAM_2);
    }

    napi_value result = nullptr;
    napi_create_double(env, wcswidth_value, &result);

    return result;
}

static napi_value Wcsxfrm(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    wchar_t src[SIZE_10];
    int wcsxfrmValue = wcsxfrm(src, L"abcdefg", param);

    napi_value result = nullptr;
    napi_create_int32(env, wcsxfrmValue, &result);

    return result;
}

static napi_value Wcsnrtombs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int sizeParam;
    napi_get_value_int32(env, args[0], &sizeParam);

    const wchar_t *src = L"abcdefg";
    char dest[SIZE_20];
    mbstate_t ps = mbstate_t();

    size_t wcsrtombsValue = wcsnrtombs(dest, &src, sizeParam, sizeParam, &ps);

    napi_value result = nullptr;
    napi_create_int32(env, wcsrtombsValue, &result);

    return result;
}

static napi_value WcsxfrmL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    wchar_t src[SIZE_10];
    locale_t locale = nullptr;
    int wcsxfrmValue = wcsxfrm_l(src, L"abcdefg", param, locale);

    napi_value result = nullptr;
    napi_create_int32(env, wcsxfrmValue, &result);

    return result;
}

static napi_value Wctob(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        wchar_t c = L'A';
        int result = wctob(c);
        if (result == 'A') {
            resultValue = RETURN_0;
        }
    } else {
        wchar_t c = L'\u00df';
        int result = wctob(c);
        if (result == EOF) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wctomb(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        wchar_t c = L'h';
        char byte[SIZE_256] = {PARAM_0};
        int result = wctomb(byte, c);
        if (result == PARAM_1) {
            resultValue = RETURN_0;
        }
    } else if (param == PARAM_1) {
        wchar_t c = L'\0';
        char byte[SIZE_256] = {PARAM_0};
        int result = wctomb(byte, c);
        if (result == PARAM_1) {
            resultValue = RETURN_0;
        }
    } else if (param == PARAM_2) {
        wchar_t c = L'h';
        int result = wctomb(nullptr, c);
        if (result == PARAM_0) {
            resultValue = RETURN_0;
        }
    } else {
        wchar_t c = L'\0';
        int result = wctomb(nullptr, c);
        if (result == PARAM_0) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wcwidth(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        int result = wcwidth(PARAM_0);
        if (result == PARAM_0) {
            resultValue = PARAM_0;
        }
    } else {
        int result = wcwidth(PARAM_0x00ad);
        if (result == PARAM_1) {
            resultValue = RETURN_ONE;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wmemchr(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        wchar_t str[] = L"ABCDEFG";
        wchar_t target = L'C';
        size_t sz = sizeof(str) / sizeof(*str);
        wchar_t *result = wmemchr(str, target, sz);
        if (result) {
            resultValue = RETURN_0;
        }
    } else if (param == PARAM_1) {
        wchar_t str[] = L"ABCDEFG";
        wchar_t target = L'H';
        size_t sz = sizeof(str) / sizeof(*str);
        wchar_t *result = wmemchr(str, target, sz);
        if (!result) {
            resultValue = RETURN_0;
        }
    } else {
        wchar_t str[] = L"ABCDEFG";
        wchar_t target = L'C';
        size_t sz = PARAM_0;
        wchar_t *result = wmemchr(str, target, sz);
        if (!result) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wmemcmp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        wchar_t l[] = L"ABCD";
        wchar_t r[] = L"ABCD";
        int result = wmemcmp(l, r, sizeof(l) / sizeof(*l));
        if (result == PARAM_0) {
            resultValue = RETURN_0;
        }
    } else if (param == 1) {
        wchar_t l[] = L"ABCD";
        wchar_t r[] = L"ABCE";
        int result = wmemcmp(l, r, sizeof(l) / sizeof(*l));
        if (result < PARAM_0) {
            resultValue = RETURN_0;
        }
    } else if (param == PARAM_2) {
        wchar_t l[] = L"ABCD";
        wchar_t r[] = L"ABCC";
        int result = wmemcmp(l, r, sizeof(l) / sizeof(*l));
        if (result > PARAM_0) {
            resultValue = RETURN_0;
        }
    } else {
        wchar_t l[] = L"ABCD";
        wchar_t r[] = L"ABCC";
        int n = PARAM_0;
        int result = wmemcmp(l, r, n);
        if (result == PARAM_0) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wmemcpy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        wchar_t des[SIZE_30];
        wchar_t src[] = L"This is a c test for wmemcpy";
        int n = SIZE_13;
        wmemcpy(des, src, n);
        if (!wcsncmp(des, src, n)) {
            resultValue = RETURN_0;
        }
    } else if (param == PARAM_1) {
        wchar_t des[SIZE_3];
        wchar_t src[] = L"aaa";
        int n = SIZE_3;
        wmemcpy(des, src, n);
        if (!wcsncmp(des, src, n)) {
            resultValue = RETURN_0;
        }
    } else {
        wchar_t des[SIZE_3];
        wchar_t src[] = L"aaa";
        int n = PARAM_0;
        wmemcpy(des, src, n);
        if (!wcsncmp(des, src, n)) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wmemmove(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        wchar_t des[] = L"This is a c test for wmemmove function";
        const wchar_t src[] = L"src content";
        int count = SIZE_5;
        wchar_t tmp[count + PARAM_1];
        wcsncpy(tmp, src, count);
        wmemmove(des, src, count);
        if (!wcsncmp(des, tmp, count)) {
            resultValue = RETURN_0;
        }
    } else {
        wchar_t src[] = L"This is a c test for wmemmove function";
        wchar_t *des = &src[PARAM_0];
        int count = SIZE_5;
        wchar_t *result = wmemmove(des, src, count);
        if (result == des) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wmemset(napi_env env, napi_callback_info info)
{
    int resultValue = PARAM_0;
    wchar_t ch = L'G';
    wchar_t des[SIZE_20];
    int count = SIZE_5;
    wmemset(des, ch, count);
    for (int i = PARAM_0; i < count; i++) {
        if (des[i] != ch) {
            resultValue = FAIL;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Wprintf(napi_env env, napi_callback_info info)
{
    int resultValue = wprintf(L"%lc\n", L'a');
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wcswcs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        wchar_t *ret = wcswcs(L"abcd", L"a");
        if (ret != nullptr) {
            resultValue = RETURN_0;
        }
    } else {
        wchar_t *ret = wcswcs(L"", L"");
        if (ret == nullptr) {
            resultValue = FAILD;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Ungetwc(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);

    wint_t wint_t1 = PARAM_0;
    if (valueFirst == ASCII_LA) {
        wint_t1 = L'a';
    }
    wint_t ungetwcValue = ungetwc(wint_t1, stdin);

    napi_value result = nullptr;
    napi_create_uint32(env, ungetwcValue, &result);
    return result;
}

static napi_value Btowc(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int index;
    napi_get_value_int32(env, args[0], &index);
    char param[] = "Btowc";
    wchar_t value = btowc(param[index]);

    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Fwscanf(napi_env env, napi_callback_info info)
{
    FILE *fp = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");

    wchar_t str[10], ch[10];
    setlocale(LC_ALL, "en_US.UTF-8");
    fwprintf(fp, L"%ls %lc", L"Summation", L'\u2211');
    fwprintf(fp, L"%ls %lc", L"Integral", L'\u222b');

    rewind(fp);
    int ret = fwscanf(fp, L"%ls %lc", str, &ch);
    int value = FAIL;
    if (ret > PARAM_0) {
        value = SUCCESS;
    }
    fclose(fp);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value Fwprintf(napi_env env, napi_callback_info info)
{
    int value = fwprintf(stdout, L"This is a test!!");
    int ret = FAIL;
    if (value >= PARAM_0) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value Fwide(napi_env env, napi_callback_info info)
{
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    FILE *fp = fopen(path, "w+");
    int param = PARAM_20;
    int value = fwide(fp, param);
    int ret = FAIL;
    if (value > PARAM_0) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    fclose(fp);
    return result;
}

static napi_value Fputws(napi_env env, napi_callback_info info)
{
    const char *ptr = "/data/storage/el2/base/files/Fzl.txt";
    FILE *fptr = fopen(ptr, "w+");
    setlocale(LC_ALL, "en_US.utf8");
    int ret = fputws(L"this is the test", fptr);
    int value = FAIL;
    if (ret != FAIL) {
        value = PARAM_0;
    }
    fclose(fptr);
    remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value FGetWs(napi_env env, napi_callback_info info)
{
    errno = ZERO;
    wchar_t mystring[100];
    char str[] = "test";
    FILE *fp = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    NAPI_ASSERT(env, fp != nullptr, "FGetWs fopen Error");
    fwrite(str, sizeof(char), sizeof(str), fp);
    fseek(fp, ZEROVAL, SEEK_SET);
    wchar_t *ret = fgetws(mystring, SIZE_100, fp);
    napi_value result = nullptr;
    if (ret == mystring) {
        napi_create_int32(env, ZEROVAL, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    fclose(fp);
    return result;
}

static napi_value FGetWc(napi_env env, napi_callback_info info)
{
    setlocale(LC_ALL, "en_US.utf8");
    FILE *fp = fopen("/data/storage/el2/base/files/Fzl.txt", "w+");
    NAPI_ASSERT(env, fp != nullptr, "FGetWc fopen Error");
    fputs("кошка\n", fp);
    wint_t wc;
    napi_value result = nullptr;
    wc = fgetwc(fp);
    if (wc == WEOF) {
        napi_create_int32(env, ZEROVAL, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    fclose(fp);
    return result;
}

int vswscanfTest(const wchar_t *buffer, const wchar_t *format, ...)
{
    int result = ZEROVAL;
    va_list args;
    va_start(args, format);
    vswscanf(buffer, format, args);
    va_end(args);
    return result;
}

static napi_value Vswscanf(napi_env env, napi_callback_info info)
{
    setlocale(LC_ALL, "en_US.UTF-8");
    wchar_t symbol[] = L"\u0fd7\u00c6\u20b9\u2127\u17d8";
    wchar_t str[20];
    int vswval = vswscanfTest(symbol, L"%ls", str);
    napi_value result;
    if (vswval < PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Getwc(napi_env env, napi_callback_info info)
{
    const char *ptr = "/data/storage/el2/base/files/test.txt";
    FILE *fptr = fopen(ptr, "w+");
    NAPI_ASSERT(env, fptr != nullptr, "Getwc fopen Error");
    wchar_t wc = L'p';
    putwc(wc, fptr);
    rewind(fptr);
    wint_t wret = getwc(fptr);
    napi_value result = nullptr;
    if (wret == wc) {
        napi_create_int32(env, ZEROVAL, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    fclose(fptr);
    return result;
}

static napi_value Mbrlen(napi_env env, napi_callback_info info)
{
    char test[] = {'m', 'u', 's', 'l'};
    size_t limitsize = sizeof(test[0]);
    size_t ret = mbrlen(&test[0], limitsize, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"vfwprintf", nullptr, Vfwprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vfwscanf", nullptr, Vfwscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vswprintf", nullptr, Vswprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vwprintf", nullptr, Vwprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcpcpy", nullptr, Wcpcpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscat", nullptr, Wcscat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcschr", nullptr, Wcschr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscmp", nullptr, Wcscmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscoll", nullptr, Wcscoll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscpy", nullptr, Wcscpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscspn", nullptr, Wcscspn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcslen", nullptr, Wcslen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsncat", nullptr, Wcsncat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsdup", nullptr, Wcsdup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsncmp", nullptr, Wcsncmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsncpy", nullptr, Wcsncpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsnlen", nullptr, Wcsnlen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcspbrk", nullptr, Wcspbrk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"swprintf", nullptr, Swprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"swscanf", nullptr, Swscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wscanf", nullptr, Wscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vwscanf", nullptr, Vwscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"towlower", nullptr, Towlower, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"towupper", nullptr, Towupper, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcpncpy", nullptr, Wcpncpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcrtomb", nullptr, Wcrtomb, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscasecmp", nullptr, Wcscasecmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscasecmpL", nullptr, WcscasecmpL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcscollL", nullptr, WcscollL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsftime", nullptr, Wcsftime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsftimeL", nullptr, WcsftimeL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsncasecmp", nullptr, Wcsncasecmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsncasecmpL", nullptr, WcsncasecmpL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsncpy", nullptr, Wcsncpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsnrtombs", nullptr, Wcsnrtombs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsrchr", nullptr, Wcsrchr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsrtombs", nullptr, Wcsrtombs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsspn", nullptr, Wcsspn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsstr", nullptr, Wcsstr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstod", nullptr, Wcstod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstof", nullptr, Wcstof, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstok", nullptr, Wcstok, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstol", nullptr, Wcstol, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstold", nullptr, Wcstold, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoll", nullptr, Wcstoll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstombs", nullptr, Wcstombs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoul", nullptr, Wcstoul, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcstoull", nullptr, Wcstoull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcswidth", nullptr, Wcswidth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsxfrm", nullptr, Wcsxfrm, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcsxfrmL", nullptr, WcsxfrmL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wctob", nullptr, Wctob, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wctomb", nullptr, Wctomb, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcwidth", nullptr, Wcwidth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wmemchr", nullptr, Wmemchr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wmemcmp", nullptr, Wmemcmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wmemcpy", nullptr, Wmemcpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wmemmove", nullptr, Wmemmove, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wmemset", nullptr, Wmemset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wprintf", nullptr, Wprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wcswcs", nullptr, Wcswcs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ungetwc", nullptr, Ungetwc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"btowc", nullptr, Btowc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fwprintf", nullptr, Fwprintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fwscanf", nullptr, Fwscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fputwc", nullptr, Fputwc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fputws", nullptr, Fputws, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fwide", nullptr, Fwide, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"putwc", nullptr, Putwc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getwchar", nullptr, Getwchar, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"putWChar", nullptr, PutWChar, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"openWmemstream", nullptr, OpenWmemstream, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mbrtowc", nullptr, Mbrtowc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mbsinit", nullptr, Mbsinit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mbsnrtowcs", nullptr, Mbsnrtowcs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mbsrtowcs", nullptr, Mbsrtowcs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mbstowcs", nullptr, Mbstowcs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mbtowc", nullptr, Mbtowc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgetws", nullptr, FGetWs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgetwc", nullptr, FGetWc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vswscanf", nullptr, Vswscanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getwc", nullptr, Getwc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mbrlen", nullptr, Mbrlen, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "wchar",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
