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
#include <cerrno>
#include <clocale>
#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <js_native_api.h>
#include <node_api.h>
#include <string>

#define FAIL (-1)
#define NO_ERR 0
#define ONE 1
#define TWO 2
#define TEST_BUFFER_SIZE 128
#define TEST_DATA_LEN 2
#define SUCCESS 1
#define ONE 1
#define THREE 3
#define FOURVALUE 4
#define MAX_NUMBER 1000
#define MIM_NUMBER 10
#define TWOVALUE 2
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_15 15
#define SIZE_30 30
#define SIZE_100 100
#define SIZE_1024 1024
#define SIZE_4096 4096
#define SIZE_8192 8192
#define SIZE_5 5
#define SIZE_10 10
#define EQ_0 '0'
#define ONEVAL 1
#define MINUSONE (-1)
#define TEST_MODE 0666
#define SIZE_15 15
#define SIZE_100 100
#define STRLEN_10 "0123456789"
#define PARAM_5 5
#define PARAM_0x0 0x0
#define PARAM_4 4
#define PARAM_50 50
#define PARAM_CHAR 95
extern "C" void *__memmove_chk(void *dest, const void *src, size_t len, size_t dst_len);
extern "C" void *__memset_chk(void *dest, int byte, size_t count, size_t dst_len);
extern "C" char *__stpncpy_chk(char *dest, const char *src, size_t len, size_t dst_len);
extern "C" void *__mempcpy_chk(void *dest, const void *src, size_t count, size_t dst_len);
extern "C" size_t __strlen_chk(const char *s, size_t s_len);
extern "C" char *__strncpy_chk(char *dest, const char *src, size_t len, size_t dst_len);
extern "C" char *__strncat_chk(char *dest, const char *src, size_t len, size_t dst_buf_size);
extern "C" char *__strcat_chk(char *dest, const char *src, size_t dst_buf_size);
extern "C" void *__memcpy_chk(void *dest, const void *src, size_t count, size_t dst_len);
extern "C" void *__memrchr_chk(const void *, int, size_t, size_t);
extern "C" char *__strcpy_chk(char *dest, const char *src, size_t dst_len);
extern "C" char *__stpcpy_chk(char *dest, const char *src, size_t dst_len);

static napi_value Strerror(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    char *errorValue;
    if (valueFirst == PARAM_0) {
        FILE *file = fopen("non_existent_file.txt", "r");
        if (file == nullptr) {
            errorValue = strerror(errno);
        } else {
            fclose(file);
        }

    } else if (valueFirst == ONE) {
        errorValue = strerror(FAIL);

    } else if (valueFirst == TWO) {
        int valueSecond = rand();
        errorValue = strerror(valueSecond);
    }
    napi_value result = nullptr;
    napi_create_string_utf8(env, errorValue, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value Strerror_l(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    char *errorValue;
    locale_t locale = newlocale(LC_ALL_MASK, "en_US", nullptr);
    if (valueFirst == PARAM_0) {
        FILE *file = fopen("non_existent_file.txt", "r");
        if (file == nullptr) {
            errorValue = strerror_l(errno, locale);
        } else {
            fclose(file);
        }
    } else if (valueFirst == ONE) {
        errorValue = strerror_l(FAIL, locale);
    } else if (valueFirst == TWO) {
        int valueSecond = rand();
        errorValue = strerror_l(valueSecond, locale);
    }
    napi_value result = nullptr;
    napi_create_string_utf8(env, errorValue, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value Strerror_r(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int errorValue = PARAM_0;
    if (valueFirst == PARAM_0) {
        char src[MAX_NUMBER] = "error_message";
        errorValue = strerror_r(PARAM_UNNORMAL, src, MAX_NUMBER);
    } else if (valueFirst == ONE) {
        char src[MAX_NUMBER] = "";
        errorValue = strerror_r(PARAM_UNNORMAL, src, MAX_NUMBER);
    } else if (valueFirst == TWO) {
        int valueSecond = rand();
        char src[MAX_NUMBER] = "";
        errorValue = strerror_r(valueSecond, src, MAX_NUMBER);
    } else if (valueFirst == THREE) {
        char src[MAX_NUMBER] = "error_message";
        FILE *file = fopen("non_existent_file.txt", "r");
        if (file == nullptr) {
            errorValue = strerror_r(errno, src, MAX_NUMBER);
        } else {
            fclose(file);
        }
    } else if (valueFirst == FOURVALUE) {
        char src[MAX_NUMBER] = "error_message";
        FILE *file = fopen("non_existent_file.txt", "r");
        if (file == nullptr) {
            errorValue = strerror_r(errno, src, MIM_NUMBER);
        } else {
            fclose(file);
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorValue, &result);
    return result;
}

static napi_value Strdup(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *char_value;
    char_value = strdup(valueFirst);
    napi_value result = nullptr;
    napi_create_string_utf8(env, char_value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strcat(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *char_value;
    char_value = strcat(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_string_utf8(env, char_value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strchr(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char valueSecond = '9';
    char *char_value;
    char_value = strchr(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_string_utf8(env, char_value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strcmp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int sinValue = strcmp(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_int32(env, sinValue, &result);
    return result;
}

static napi_value Strcoll(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int sinValue = strcoll(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_int32(env, sinValue, &result);
    return result;
}

static napi_value Strcoll_l(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    locale_t locale = newlocale(LC_ALL_MASK, "en_US", nullptr);
    int sinValue = strcoll_l(valueFirst, valueSecond, locale);
    napi_value result = nullptr;
    napi_create_int32(env, sinValue, &result);
    return result;
}

static napi_value Strlen(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    int sinValue = strlen(valueFirst);
    napi_value result = nullptr;
    napi_create_int32(env, sinValue, &result);
    return result;
}

static napi_value Strncat(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int valueThird = napi_get_value_int32(env, args[2], &valueThird);
    char *value3 = strncat(valueFirst, valueSecond, valueThird);
    napi_value result = nullptr;
    napi_create_string_utf8(env, value3, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value Strncmp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int valueThird;
    napi_get_value_int32(env, args[0], &valueThird);
    int strNCmpValue = strncmp(valueFirst, valueSecond, valueThird);

    napi_value result = nullptr;
    napi_create_int32(env, strNCmpValue, &result);
    return result;
}

static napi_value Strncpy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int valueThird;
    napi_get_value_int32(env, args[PARAM_2], &valueThird);
    char *strNCpyValue = strncpy(valueFirst, valueSecond, valueThird);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strNCpyValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strndup(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    char *strNdUpValue = strndup(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strNdUpValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strnlen(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    int valueSecond;
    napi_get_value_int32(env, args[1], &valueSecond);
    int strNLenValue = strnlen(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_int32(env, strNLenValue, &result);

    return result;
}

static napi_value Strpbrk(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *strPBrkValue = strpbrk(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strPBrkValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strrchr(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *param = NapiHelper::GetString(env, args[0]);

    char *strrchr_value = strrchr(param, 'd');

    napi_value result = nullptr;
    napi_create_string_utf8(env, strrchr_value, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strsep(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *strSepValue = strsep(&valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strSepValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strspn(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int strSpnValue = strspn(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_int32(env, strSpnValue, &result);

    return result;
}

static napi_value Strstr(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *strStrValue = strstr(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strStrValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strtok(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *strTokValue = strtok(valueFirst, valueSecond);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strTokValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value StrtokR(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *valueThird = NapiHelper::GetString(env, args[2]);
    char *strTokValue = strtok_r(valueFirst, valueSecond, &valueThird);

    napi_value result = nullptr;
    napi_create_string_utf8(env, strTokValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value Strxfrm(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int valueThird;
    napi_get_value_int32(env, args[PARAM_2], &valueThird);
    int strTxFrmValue;
    if (valueFirst == PARAM_0) {
        char value[10];
        strTxFrmValue = strxfrm(value, valueSecond, valueThird);
    } else {
        char value[30];
        strTxFrmValue = strxfrm(value, valueSecond, valueThird);
    }

    napi_value result = nullptr;
    napi_create_int32(env, strTxFrmValue, &result);

    return result;
}
static napi_value MemCpy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char deSt[10] = {'A', 'B', 'C', 'D', 'E', 'F'};
    memcpy(deSt, valueFirst, strlen(valueFirst));
    napi_value result = nullptr;
    napi_create_string_utf8(env, deSt, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value MemMem(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char deSt[30] = "ABCDEFGHIGKLMN";
    void *pointer = memmem(deSt, strlen(deSt), valueFirst, strlen(valueFirst));

    napi_value result = nullptr;
    if (pointer != nullptr) {
        napi_create_int32(env, NO_ERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}
static napi_value MemMove(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char deSt[10] = {0};
    memmove(deSt, valueFirst, strlen(valueFirst));
    napi_value result = nullptr;
    napi_create_string_utf8(env, deSt, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value MemPCpy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char deSt[10] = {0};
    mempcpy(deSt, valueFirst, strlen(valueFirst));

    napi_value result = nullptr;
    napi_create_string_utf8(env, deSt, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value MemPCpy2(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char deSt[10] = {'A', 'B', 'C', 'D', 'E', 'F'};
    mempcpy(deSt, valueFirst + PARAM_2, strlen(valueFirst) - PARAM_2);

    napi_value result = nullptr;
    napi_create_string_utf8(env, deSt, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value MemPCpy3(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char deSt[10] = {'A', 'B', 'C', 'D', 'E', 'F'};
    mempcpy(deSt, valueFirst + PARAM_2, strlen(valueFirst) - PARAM_3);

    napi_value result = nullptr;
    napi_create_string_utf8(env, deSt, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value MemPCpy4(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char deSt[10] = {'A', 'B', 'C', 'D', 'E', 'F'};
    mempcpy(deSt, valueFirst, 0);

    napi_value result = nullptr;
    napi_create_string_utf8(env, deSt, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value MemrChr(napi_env env, napi_callback_info info)
{
    const char *src = "this is memrchr_0100 test.";
    char *ret = static_cast<char *>(memrchr(src, 'r', strlen(src)));
    napi_value result = nullptr;
    napi_create_string_utf8(env, static_cast<char *>(ret), NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value MemrChr2(napi_env env, napi_callback_info info)
{
    const char *src = "this is memrchr_0100 test.";
    char *ret = nullptr;
    ret = static_cast<char *>(memrchr(src, 'w', strlen(src)));
    napi_value result = nullptr;
    if (ret == nullptr) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, ONE, &result);
    }
    return result;
}
static napi_value MemSet(napi_env env, napi_callback_info info)
{
    char *ret = nullptr;
    ret = static_cast<char *>(malloc(sizeof(char) * ONE));
    ret = static_cast<char *>(memset(ret, '2', sizeof(char) * ONE));
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, ONE, &result);
    }
    return result;
}
static napi_value MemCcpy(napi_env env, napi_callback_info info)
{
    const char src[TEST_BUFFER_SIZE] = "musl test";
    char dest[TEST_BUFFER_SIZE] = "";
    void *rev = memccpy(dest, src, ' ', TEST_DATA_LEN);

    memset(dest, PARAM_0x0, sizeof(dest));
    rev = memccpy(dest, src, ' ', sizeof(src));
    int ret = FAIL;
    napi_value result = nullptr;
    if (rev != nullptr) {
        ret = NO_ERR;
    } else {
        ret = FAIL;
    }
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value MemChr(napi_env env, napi_callback_info info)
{
    const char *srcstring = "this is a unittest";
    char fitch = 'u';
    char *findch = (char *)memchr(srcstring, fitch, strlen(srcstring));
    int ret = PARAM_0;
    if (findch[0] == fitch) {
        ret = SUCCESS;
    } else {
        ret = FAIL;
    }
    napi_value result = nullptr;

    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value MemCmp(napi_env env, napi_callback_info info)
{
    char buffer1[] = "DWgaOtP12df0";
    char buffer2[] = "DWgaOtP12df0";
    int ret = memcmp(buffer1, buffer2, sizeof(buffer1));
    if (ret != PARAM_0) {
        ret = FAIL;
    } else {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ONE, &result);
    return result;
}

static napi_value Strlcat(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char valueFirst[4];
    valueFirst[0] = '\0';
    char *valueSecond = NapiHelper::GetString(env, args[0]);
    int strlcat_value = strlcat(valueFirst, valueSecond, PARAM_4);
    napi_value result = nullptr;
    napi_create_int32(env, strlcat_value, &result);
    return result;
}

static napi_value Strlcpy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char valueFirst[4];
    char *valueSecond = NapiHelper::GetString(env, args[0]);
    int len = strlen(valueSecond);
    int strlcpyValue = strlcpy(valueFirst, valueSecond, len);
    napi_value result = nullptr;
    napi_create_int32(env, strlcpyValue, &result);
    return result;
}

static napi_value Strchrnul(napi_env env, napi_callback_info info)
{
    size_t argc = TWO;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    int valueSecond = napi_get_value_int32(env, args[1], &valueSecond);
    char *strchrnulValue;
    int int_value = PARAM_0;

    if (valueSecond == ONE) {
        int_value = 'o';
    } else if (valueSecond == TWO) {
        int_value = '\0';
    } else if (valueSecond == THREE) {
        int_value = 'a';
    }
    strchrnulValue = strchrnul(valueFirst, int_value);
    napi_value result = nullptr;
    napi_create_string_utf8(env, strchrnulValue, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strcasestr(napi_env env, napi_callback_info info)
{
    size_t argc = TWO;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *strcasestr_value = strcasestr(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_string_utf8(env, strcasestr_value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strsignal(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    char *sigValue;
    if (valueFirst == PARAM_0) {
        sigValue = strsignal(SIGHUP);
    } else {
        sigValue = strsignal(SIGINT);
    }
    napi_value result;
    napi_create_string_utf8(env, sigValue, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value StrxfrmL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    char *param_char = NapiHelper::GetString(env, args[1]);
    int param_int;
    napi_get_value_int32(env, args[2], &param_int);
    int resultValue;
    if (param == PARAM_0) {
        char value[SIZE_10];
        locale_t locale = nullptr;
        resultValue = strxfrm_l(value, param_char, param_int, locale);
    } else {
        char value[SIZE_30];
        locale_t locale = nullptr;
        resultValue = strxfrm_l(value, param_char, param_int, locale);
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Stpcpy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char valueFirst[4];
    char *valueSecond = NapiHelper::GetString(env, args[0]);
    stpcpy(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_string_utf8(env, valueFirst, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Stpncpy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char valueFirst[SIZE_5] = "abcd";
    valueFirst[0] = '\0';
    char *valueSecond = NapiHelper::GetString(env, args[0]);
    stpncpy(valueFirst, valueSecond, TWOVALUE);
    napi_value result = nullptr;
    napi_create_string_utf8(env, valueFirst, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strcpy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char valueFirst[4];
    char *valueSecond = NapiHelper::GetString(env, args[0]);
    strcpy(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_string_utf8(env, valueFirst, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strcspn(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int int_value;
    int_value = strcspn(valueFirst, valueSecond);
    napi_value result = nullptr;
    napi_create_int32(env, int_value, &result);
    return result;
}
static napi_value MemmoveChk(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value MemsetChk(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}
static napi_value StpncpyChk(napi_env env, napi_callback_info info)
{
    char valueFirst[SIZE_5] = "abcd";
    valueFirst[0] = '\0';
    char valueSecond[] = "ef";
    char *strncpyValue = __stpncpy_chk(valueFirst, valueSecond, strlen(valueSecond), strlen(valueSecond));
    napi_value result = nullptr;
    napi_create_string_utf8(env, strncpyValue, NAPI_AUTO_LENGTH, &result);
    return result;
}
static napi_value MempcpyChk(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value StrlenChk(napi_env env, napi_callback_info info)
{
    char valueFirst[] = "ABCD";
    int strlenChkValue = __strlen_chk(valueFirst, MAX_NUMBER);
    napi_value result = nullptr;
    napi_create_int32(env, strlenChkValue, &result);
    return result;
}
static napi_value StrncpyChk(napi_env env, napi_callback_info info)
{
    char valueFirst[SIZE_5] = "abcd";
    valueFirst[0] = '\0';
    char valueSecond[] = "ef";
    char *strncpyValue = __strncpy_chk(valueFirst, valueSecond, strlen(valueSecond), strlen(valueSecond));
    napi_value result = nullptr;
    napi_create_string_utf8(env, strncpyValue, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value StrncatChk(napi_env env, napi_callback_info info)
{
    char dst[50] = "ABCD";
    char src[] = "ABCD";
    size_t src_len = strlen(src) + strlen(dst);
    errno = ERRON_0;
    char *resultValue = __strncat_chk(dst, src, src_len, PARAM_50);
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultValue, NAPI_AUTO_LENGTH, &result);

    return result;
}

static napi_value StrcatChk(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    char *char_value;
    char_value = __strcat_chk(valueFirst, valueSecond, SIZE_100);
    napi_value result = nullptr;
    napi_create_string_utf8(env, char_value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value MemcpyChk(napi_env env, napi_callback_info info)
{
    char dst[SIZE_15];
    napi_value result;
    __memcpy_chk(dst, STRLEN_10, SIZE_10, SIZE_15);
    if (dst[0] == EQ_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}

static napi_value MemrchrChk(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string valueFirst = NapiHelper::GetString(env, args[0]);
    std::string valueSecond = NapiHelper::GetString(env, args[1]);
    void *voidResult =
        __memrchr_chk(valueFirst.data(), *(valueSecond.data()), strlen(valueFirst.data()), strlen(valueFirst.data()));
    napi_value result = nullptr;
    char *valueResult = static_cast<char *>(voidResult);
    napi_create_string_utf8(env, valueResult, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value StrcpyChk(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string valueFirst = NapiHelper::GetString(env, args[0]);
    char copyTo[strlen(valueFirst.data()) + PARAM_1];
    __strcpy_chk(copyTo, valueFirst.data(), strlen(valueFirst.data()) + PARAM_1);
    napi_value result = nullptr;
    napi_create_string_utf8(env, copyTo, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value StpcpyChk(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string valueFirst = NapiHelper::GetString(env, args[0]);
    char copyTo[strlen(valueFirst.data()) + PARAM_1];
    __stpcpy_chk(copyTo, valueFirst.data(), strlen(valueFirst.data()));
    napi_value result = nullptr;
    napi_create_string_utf8(env, copyTo, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value StrchrChk(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string valueFirst = NapiHelper::GetString(env, args[0]);
    std::string valueSecond = NapiHelper::GetString(env, args[1]);
    char tmp = valueSecond[PARAM_0];
    std::string resultValue = __strchr_chk(valueFirst.data(), tmp, strlen(valueFirst.data()) + PARAM_1);
    napi_value result = nullptr;
    napi_create_string_utf8(env, resultValue.data(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Strrchr_Chk(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int character = PARAM_CHAR;
    size_t size = PARAM_5;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    char *checkParam = nullptr;
    checkParam = __strrchr_chk(path, character, size);
    if (checkParam != nullptr) {
        errno = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value MemChr_chk(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    const char *srcstring = "this is a unittest";
    char fitch = 'u';
    __memchr_chk(srcstring, fitch, strlen(srcstring), MINUSONE);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}
static napi_value Strlcpy_chk(napi_env env, napi_callback_info info)
{
    char valueFirst[] = {"stringCopy"};
    char valueSecond[] = {"string"};
    int strlcpyValue = __strlcpy_chk(valueFirst, valueSecond, strlen(valueSecond), MINUSONE);
    napi_value result = nullptr;
    napi_create_int32(env, strlcpyValue, &result);
    return result;
}
static napi_value Strlcat_chk(napi_env env, napi_callback_info info)
{
    char valueFirst[4];
    valueFirst[0] = '\0';
    char valueSecond[MAX_NUMBER] = "123456";
    int strlcat_chk_value = __strlcat_chk(valueFirst, valueSecond, PARAM_3, MINUSONE);
    napi_value result = nullptr;
    napi_create_int32(env, strlcat_chk_value, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"strerror", nullptr, Strerror, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strerror_l", nullptr, Strerror_l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strerror_r", nullptr, Strerror_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strchr", nullptr, Strchr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strdup", nullptr, Strdup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcat", nullptr, Strcat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcmp", nullptr, Strcmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcoll", nullptr, Strcoll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcoll_l", nullptr, Strcoll_l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strlen", nullptr, Strlen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strncat", nullptr, Strncat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strncmp", nullptr, Strncmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strncpy", nullptr, Strncpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strndup", nullptr, Strndup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strnlen", nullptr, Strnlen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strpbrk", nullptr, Strpbrk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strrchr", nullptr, Strrchr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strsep", nullptr, Strsep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strspn", nullptr, Strspn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strstr", nullptr, Strstr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtok", nullptr, Strtok, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtokR", nullptr, StrtokR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strxfrm", nullptr, Strxfrm, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strlcat", nullptr, Strlcat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strlcpy", nullptr, Strlcpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strchrnul", nullptr, Strchrnul, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcasestr", nullptr, Strcasestr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strsignal", nullptr, Strsignal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strxfrmL", nullptr, StrxfrmL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stpcpy", nullptr, Stpcpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stpncpy", nullptr, Stpncpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcpy", nullptr, Strcpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcspn", nullptr, Strcspn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memmoveChk", nullptr, MemmoveChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memsetChk", nullptr, MemsetChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stpncpyChk", nullptr, StpncpyChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mempcpyChk", nullptr, MempcpyChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strlenChk", nullptr, StrlenChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strncpyChk", nullptr, StrncpyChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memCpy", nullptr, MemCpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memMem", nullptr, MemMem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memMove", nullptr, MemMove, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memPCpy", nullptr, MemPCpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memPCpy2", nullptr, MemPCpy2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memPCpy3", nullptr, MemPCpy3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memPCpy4", nullptr, MemPCpy4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memrChr", nullptr, MemrChr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memrChr2", nullptr, MemrChr2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memSet", nullptr, MemSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memCcpy", nullptr, MemCcpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memChr", nullptr, MemChr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memCmp", nullptr, MemCmp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strncatChk", nullptr, StrncatChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcatChk", nullptr, StrcatChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memcpyChk", nullptr, MemcpyChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"memrchrChk", nullptr, MemrchrChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strcpyChk", nullptr, StrcpyChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stpcpyChk", nullptr, StpcpyChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strchrChk", nullptr, StrchrChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__strrchr_chk", nullptr, Strrchr_Chk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__memchr_chk", nullptr, MemChr_chk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__strlcpy_chk", nullptr, Strlcpy_chk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__strlcat_chk", nullptr, Strlcat_chk, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "string",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
