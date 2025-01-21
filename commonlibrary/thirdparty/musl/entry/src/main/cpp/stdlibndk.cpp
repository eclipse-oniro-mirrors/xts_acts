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
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <fcntl.h>
#include <string>
#include <unistd.h>
#include <utmp.h>
#define ERRON_0 0
#define BUF_SIZE 256
#define EXPECTERROR (-1)
#define NO_ERR 0
#define FAIL (-1)
#define ARRY_MAX 128
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_4 4
#define PARAM_5 5
#define PARAM_6 6
#define PARAM_7 7
#define PARAM_10 10
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define RETURN_1 1
#define FAILD (-1)
#define ERRNO_0 0
#define SIZE_0 0
#define SIZE_5 5
#define SIZE_8 8
#define SIZE_10 10
#define SIZE_16 16
#define SIZE_20 20
#define SIZE_32 32
#define SIZE_64 64
#define SIZE_1024 1024
#define SUCCESS 1
#define INIT 0
#define DEF_VALUE (-2)
#define FAILED (-1)
#define STAT_SIZE 64
#define SEED 0
#define TEST_NUM 10
#define LIB_BUFF_SIZE 64

static napi_value Ldiv(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int num, den;
    napi_get_value_int32(env, args[0], &num);
    napi_get_value_int32(env, args[1], &den);
    ldiv_t ret = ldiv(num, den);
    napi_value result = nullptr;
    napi_create_object(env, &result);
    napi_value quot = nullptr;
    napi_value rem = nullptr;
    int a = ret.quot;
    int b = ret.rem;
    napi_create_int32(env, a, &quot);
    napi_set_named_property(env, result, "quot", quot);
    napi_create_int32(env, b, &rem);
    napi_set_named_property(env, result, "rem", rem);
    return result;
}

static napi_value LLdiv(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int num, den;
    napi_get_value_int32(env, args[0], &num);
    napi_get_value_int32(env, args[1], &den);
    lldiv_t ret = lldiv(num, den);
    napi_value result = nullptr;
    napi_create_object(env, &result);
    napi_value quot = nullptr;
    napi_value rem = nullptr;
    int a = ret.quot;
    int b = ret.rem;
    napi_create_int32(env, a, &quot);
    napi_set_named_property(env, result, "quot", quot);
    napi_create_int32(env, b, &rem);
    napi_set_named_property(env, result, "rem", rem);
    return result;
}

static napi_value Lcong48(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_7;
    napi_value args[7] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t a;
    uint32_t b;
    uint32_t c;
    uint32_t d;
    uint32_t e;
    uint32_t f;
    uint32_t g;
    napi_get_value_uint32(env, args[0], &a);
    napi_get_value_uint32(env, args[1], &b);
    napi_get_value_uint32(env, args[PARAM_2], &c);
    napi_get_value_uint32(env, args[PARAM_3], &d);
    napi_get_value_uint32(env, args[PARAM_4], &e);
    napi_get_value_uint32(env, args[PARAM_5], &f);
    napi_get_value_uint32(env, args[PARAM_6], &g);
    unsigned short xSubFirst[7] = {(unsigned short)a, (unsigned short)b, (unsigned short)c, (unsigned short)d,
                                   (unsigned short)e, (unsigned short)f, (unsigned short)g};
    long randValue = jrand48(xSubFirst);
    napi_value result = nullptr;
    napi_create_int32(env, static_cast<int>(randValue), &result);
    return result;
}

static napi_value Rand(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        int randValue = rand();
        if (randValue < RAND_MAX) {
            resultValue = RETURN_0;
        }
    } else {
        int randValue = rand();
        if (randValue > PARAM_0) {
            resultValue = RETURN_0;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value LLabs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int a;
    napi_get_value_int32(env, args[0], &a);
    long randValue = llabs(a);
    napi_value result = nullptr;
    napi_create_int32(env, randValue, &result);
    return result;
}

static napi_value Labs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int a;
    napi_get_value_int32(env, args[0], &a);
    long randValue = labs(a);
    napi_value result = nullptr;
    napi_create_int32(env, randValue, &result);
    return result;
}

static napi_value RandR(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        unsigned seed = getpid();
        int randR_value = rand_r(&seed);
        if (randR_value < RAND_MAX) {
            resultValue = RETURN_0;
        }
    } else {
        unsigned seed = getpid();
        int randR_value = rand_r(&seed);
        if (randR_value > PARAM_0) {
            resultValue = RETURN_0;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Random(napi_env env, napi_callback_info info)
{
    int randomValue = random();
    napi_value result = nullptr;
    napi_create_int32(env, randomValue, &result);
    return result;
}

static napi_value Seed48(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t first;
    uint32_t second;
    uint32_t third;
    napi_get_value_uint32(env, args[0], &first);
    napi_get_value_uint32(env, args[1], &second);
    napi_get_value_uint32(env, args[PARAM_2], &third);
    unsigned short int *p,
        seedV[3] = {(unsigned short int)first, (unsigned short int)second, (unsigned short int)third};
    p = seed48(seedV);
    napi_value result;
    napi_create_double(env, *p, &result);
    return result;
}
static napi_value Srand(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    if (valueZero == PARAM_0) {
        int timeValue = time(nullptr);
        srand(timeValue);
    } else {
        srand(valueZero);
    }
    int sin_value;
    sin_value = rand();
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}
static napi_value Srand48(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    if (valueZero == PARAM_0) {
        int timeValue = time(nullptr);
        srand48(timeValue);
    } else {
        srand48(valueZero);
    }
    int sin_value;
    sin_value = rand();
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}
static napi_value Srandom(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    if (valueZero == PARAM_0) {
        int timeValue = time(nullptr);
        srandom(timeValue);
    } else {
        srandom(valueZero);
    }
    int sin_value;
    sin_value = rand();
    napi_value result = nullptr;
    napi_create_int32(env, sin_value, &result);
    return result;
}

static napi_value Strtod(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueZero = NapiHelper::GetString(env, args[0]);
    double strtod_value = strtod(valueZero, nullptr);
    napi_value result = nullptr;
    napi_create_double(env, strtod_value, &result);
    return result;
}

static napi_value Strtof(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueZero = NapiHelper::GetString(env, args[0]);
    double strTofValue = strtof(valueZero, nullptr);
    napi_value result = nullptr;
    napi_create_double(env, strTofValue, &result);

    return result;
}

static napi_value Strtol(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueZero = NapiHelper::GetString(env, args[0]);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    double strTolValue = strtol(valueZero, nullptr, valueFirst);

    napi_value result = nullptr;
    napi_create_double(env, strTolValue, &result);

    return result;
}

static napi_value Strtold(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueZero = NapiHelper::GetString(env, args[0]);
    double strToldValue = strtold(valueZero, nullptr);

    napi_value result = nullptr;
    napi_create_double(env, strToldValue, &result);

    return result;
}

static napi_value Strtoll(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueZero = NapiHelper::GetString(env, args[0]);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    double strTollValue = strtoll(valueZero, nullptr, valueFirst);

    napi_value result = nullptr;
    napi_create_double(env, strTollValue, &result);

    return result;
}

static napi_value Strtoul(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueZero = NapiHelper::GetString(env, args[0]);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    double strTouLValue = strtoul(valueZero, nullptr, valueFirst);

    napi_value result = nullptr;
    napi_create_double(env, strTouLValue, &result);

    return result;
}

static napi_value Strtoull(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *valueZero = NapiHelper::GetString(env, args[0]);
    int valueFirst;
    napi_get_value_int32(env, args[1], &valueFirst);
    double strTouLlValue = strtoull(valueZero, nullptr, valueFirst);

    napi_value result = nullptr;
    napi_create_double(env, strTouLlValue, &result);

    return result;
}

static napi_value Setenv(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    char *valueSecond = NapiHelper::GetString(env, args[1]);
    int valueThree;
    napi_get_value_int32(env, args[PARAM_2], &valueThree);
    int setValue = setenv(valueFirst, valueSecond, valueThree);
    napi_value result;
    napi_create_int32(env, setValue, &result);
    return result;
}
static napi_value GetLoadAvg(napi_env env, napi_callback_info info)
{
    double avgs[3];
    int getInfo = getloadavg(avgs, PARAM_3);
    napi_value result = nullptr;
    napi_create_double(env, getInfo, &result);
    return result;
}

static napi_value MkTemp(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int flag = PARAM_0;
    napi_get_value_int32(env, args[0], &flag);
    char tpl[BUFSIZ];
    switch (flag) {
    case PARAM_0:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXXXXX");
        break;
    case PARAM_1:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXX");
        break;
    case PARAM_2:
        strcpy(tpl, "/data/storage/el2/base/files/temp");
        break;
    default:
        strcpy(tpl, "/data/storage/el2/base/files/temp");
        break;
    }
    char *ret = mktemp(tpl);

    napi_value result = nullptr;
    if (*ret == '\0') {
        napi_create_int32(env, FAILD, &result);
    } else {
        napi_create_int32(env, RETURN_0, &result);
    }
    unlink(tpl);
    return result;
}

static napi_value MkSTemp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int flag = PARAM_0;
    napi_get_value_int32(env, args[0], &flag);
    char tpl[BUFSIZ];
    switch (flag) {
    case PARAM_0:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXXXXX");
        break;
    case PARAM_1:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXX");
        break;
    case PARAM_2:
        strcpy(tpl, "/data/storage/el2/base/files/temp");
        break;
    default:
        strcpy(tpl, "/data/storage/el2/base/files/temp");
        break;
    }
    int mktfp = mkstemp(tpl);
    napi_value result = nullptr;
    if (mktfp == PARAM_UNNORMAL) {
        napi_create_int32(env, FAILD, &result);
    } else {
        napi_create_int32(env, RETURN_0, &result);
    }
    unlink(tpl);
    return result;
}

static napi_value MkSTempS(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int flag = PARAM_0;
    napi_get_value_int32(env, args[0], &flag);
    char tpl[BUFSIZ];
    switch (flag) {
    case PARAM_0:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXXXXX.dat");
        break;
    case PARAM_1:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXX.dat");
        break;
    case PARAM_2:
        strcpy(tpl, "/data/storage/el2/base/files/temp.dat");
        break;
    default:
        strcpy(tpl, "/data/storage/el2/base/files/temp.dat");
        break;
    }
    int mktfp = mkstemps(tpl, strlen(".dat"));
    napi_value result = nullptr;
    if (mktfp == PARAM_UNNORMAL) {
        napi_create_int32(env, FAILD, &result);
    } else {
        napi_create_int32(env, RETURN_0, &result);
    }
    unlink(tpl);
    return result;
}

static napi_value MkOSTemp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int flag = PARAM_0;
    napi_get_value_int32(env, args[0], &flag);
    char tpl[BUFSIZ];
    switch (flag) {
    case PARAM_0:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXXXXX");
        break;
    case PARAM_1:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXX");
        break;
    case PARAM_2:
        strcpy(tpl, "/data/storage/el2/base/files/temp");
        break;
    default:
        strcpy(tpl, "/data/storage/el2/base/files/temp");
        break;
    }
    int fileFlag = PARAM_0;
    int mktfp = PARAM_0;
    napi_get_value_int32(env, args[1], &fileFlag);
    switch (fileFlag) {
    case PARAM_0:
        mktfp = mkostemp(tpl, O_APPEND);
        break;
    case PARAM_1:
        mktfp = mkostemp(tpl, O_CLOEXEC);
        break;
    case PARAM_2:
        mktfp = mkostemp(tpl, O_SYNC);
        break;
    default:
        mktfp = mkostemp(tpl, O_SYNC);
        break;
    }
    napi_value result = nullptr;
    if (mktfp == PARAM_UNNORMAL) {
        napi_create_int32(env, FAILD, &result);
    } else {
        napi_create_int32(env, RETURN_0, &result);
    }
    unlink(tpl);
    return result;
}

static napi_value MkOSTempS(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int flag = PARAM_0;
    napi_get_value_int32(env, args[0], &flag);
    char tpl[BUFSIZ];
    switch (flag) {
    case PARAM_0:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXXXXX.dat");
        break;
    case PARAM_1:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXX.dat");
        break;
    case PARAM_2:
        strcpy(tpl, "/data/storage/el2/base/files/temp.dat");
        break;
    default:
        strcpy(tpl, "/data/storage/el2/base/files/temp.dat");
        break;
    }
    int fileFlag = PARAM_0;
    int mktfp = PARAM_0;
    napi_get_value_int32(env, args[1], &fileFlag);
    switch (fileFlag) {
    case PARAM_0:
        mktfp = mkostemps(tpl, strlen(".dat"), O_APPEND);
        break;
    case PARAM_1:
        mktfp = mkostemps(tpl, strlen(".dat"), O_CLOEXEC);
        break;
    case PARAM_2:
        mktfp = mkostemps(tpl, strlen(".dat"), O_SYNC);
        break;
    default:
        mktfp = mkostemps(tpl, strlen(".dat"), O_SYNC);
        break;
    }
    napi_value result = nullptr;
    if (mktfp == PARAM_UNNORMAL) {
        napi_create_int32(env, FAILD, &result);
    } else {
        napi_create_int32(env, RETURN_0, &result);
    }
    unlink(tpl);
    return result;
}

static napi_value MkSTemp64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int flag = PARAM_0;
    napi_get_value_int32(env, args[0], &flag);
    char tpl[BUFSIZ];
    switch (flag) {
    case PARAM_0:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXXXXX");
        break;
    case PARAM_1:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXX");
        break;
    case PARAM_2:
        strcpy(tpl, "/data/storage/el2/base/files/temp");
        break;
    default:
        strcpy(tpl, "/data/storage/el2/base/files/temp");
        break;
    }
    int mktfp = mkstemp64(tpl);
    napi_value result = nullptr;
    if (mktfp == PARAM_UNNORMAL) {
        napi_create_int32(env, FAILD, &result);
    } else {
        napi_create_int32(env, RETURN_0, &result);
    }
    unlink(tpl);
    return result;
}

static napi_value MkSTempS64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int flag = PARAM_0;
    napi_get_value_int32(env, args[0], &flag);
    char tpl[BUFSIZ];
    switch (flag) {
    case PARAM_0:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXXXXX.dat");
        break;
    case PARAM_1:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXX.dat");
        break;
    case PARAM_2:
        strcpy(tpl, "/data/storage/el2/base/files/temp.dat");
        break;
    default:
        strcpy(tpl, "/data/storage/el2/base/files/temp.dat");
        break;
    }
    int mktfp = mkstemps64(tpl, strlen(".dat"));
    napi_value result = nullptr;
    if (mktfp == PARAM_UNNORMAL) {
        napi_create_int32(env, FAILD, &result);
    } else {
        napi_create_int32(env, RETURN_0, &result);
    }
    unlink(tpl);
    return result;
}

static napi_value MkOSTemp64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int flag = PARAM_0;
    napi_get_value_int32(env, args[0], &flag);
    char tpl[BUFSIZ];
    switch (flag) {
    case PARAM_0:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXXXXX");
        break;
    case PARAM_1:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXX");
        break;
    case PARAM_2:
        strcpy(tpl, "/data/storage/el2/base/files/temp");
        break;
    default:
        strcpy(tpl, "/data/storage/el2/base/files/temp");
        break;
    }
    int fileFlag = PARAM_0;
    int mktfp = PARAM_0;
    napi_get_value_int32(env, args[1], &fileFlag);
    switch (fileFlag) {
    case PARAM_0:
        mktfp = mkostemp64(tpl, O_APPEND);
        break;
    case PARAM_1:
        mktfp = mkostemp64(tpl, O_CLOEXEC);
        break;
    case PARAM_2:
        mktfp = mkostemp64(tpl, O_SYNC);
        break;
    default:
        mktfp = mkostemp64(tpl, O_SYNC);
        break;
    }
    napi_value result = nullptr;
    if (mktfp == PARAM_UNNORMAL) {
        napi_create_int32(env, FAILD, &result);
    } else {
        napi_create_int32(env, RETURN_0, &result);
    }
    unlink(tpl);
    return result;
}

static napi_value MkOSTempS64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int flag = PARAM_0;
    napi_get_value_int32(env, args[0], &flag);
    char tpl[BUFSIZ];
    switch (flag) {
    case PARAM_0:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXXXXX.dat");
        break;
    case PARAM_1:
        strcpy(tpl, "/data/storage/el2/base/files/tempXXX.dat");
        break;
    case PARAM_2:
        strcpy(tpl, "/data/storage/el2/base/files/temp.dat");
        break;
    default:
        strcpy(tpl, "/data/storage/el2/base/files/temp.dat");
        break;
    }
    int fileFlag = PARAM_0;
    int mktfp = PARAM_0;
    napi_get_value_int32(env, args[1], &fileFlag);
    switch (fileFlag) {
    case PARAM_0:
        mktfp = mkostemps64(tpl, strlen(".dat"), O_APPEND);
        break;
    case PARAM_1:
        mktfp = mkostemps64(tpl, strlen(".dat"), O_CLOEXEC);
        break;
    case PARAM_2:
        mktfp = mkostemps64(tpl, strlen(".dat"), O_SYNC);
        break;
    default:
        mktfp = mkostemps64(tpl, strlen(".dat"), O_SYNC);
        break;
    }
    napi_value result = nullptr;
    if (mktfp == PARAM_UNNORMAL) {
        napi_create_int32(env, FAILD, &result);
    } else {
        napi_create_int32(env, RETURN_0, &result);
    }
    unlink(tpl);
    return result;
}

static napi_value Getloadavg(napi_env env, napi_callback_info info)
{
    double loadavg[3];
    int ret = getloadavg(loadavg, PARAM_3);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Getsubopt(napi_env env, napi_callback_info info)
{
    char getsubopt1[] = "getsubopt";
    char test[] = "test";

    char *tokens[] = {getsubopt1, test, nullptr};
    char buf[BUF_SIZE];
    strcpy(buf, "getsubopt=0100,unknown");
    char *subopts = buf;
    char *value = nullptr;
    int ret = getsubopt(&subopts, tokens, &value);
    napi_value result = nullptr;
    if (ret != PARAM_UNNORMAL) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }
    return result;
}
static napi_value Grantpt(napi_env env, napi_callback_info info)
{
    int rev = grantpt(PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, rev, &result);
    return result;
}
static napi_value MkDTemp(napi_env env, napi_callback_info info)
{
    char *ret = nullptr;
    char path[] = "/data/storage/el2/base/files/mk-XXXXXX";
    ret = mkdtemp(path);
    if (access(path, F_OK) == PARAM_0) {
        rmdir(path);
    }
    int res;
    napi_value result = nullptr;
    if (ret != nullptr) {
        res = PARAM_0;
    } else {
        res = FAIL;
    }
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value Jrand48(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    uint32_t a;
    uint32_t b;
    uint32_t c;
    napi_get_value_uint32(env, args[0], &a);
    napi_get_value_uint32(env, args[1], &b);
    napi_get_value_uint32(env, args[PARAM_2], &c);
    uint16_t aa = a;
    uint16_t ba = b;
    uint16_t ca = c;
    unsigned short sub[] = {aa, ba, ca};
    long rev = jrand48(sub);
    napi_value result = nullptr;
    napi_create_int32(env, rev, &result);
    return result;
}
static napi_value InitState(napi_env env, napi_callback_info info)
{
    char state[BUF_SIZE];
    errno = ERRNO_0;
    initstate(PARAM_1, state, sizeof state);
    napi_value result = nullptr;
    if (errno != ERRNO_0) {
        napi_create_int32(env, FAILD, &result);
    } else {
        napi_create_int32(env, RETURN_0, &result);
    }
    return result;
}

static napi_value Lrand48(napi_env env, napi_callback_info info)
{
    int ret = lrand48();
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Mblen(napi_env env, napi_callback_info info)
{
    size_t ret = FAIL;

    char src[ARRY_MAX];

    wchar_t pwc[] = L"mblen_0100";
    wcstombs(src, pwc, ARRY_MAX);
    ret = mblen(src, ARRY_MAX);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
int Compare(const void *a, const void *b)
{
    const int *x = static_cast<const int *>(a);
    const int *y = static_cast<const int *>(b);

    if (*x > *y) {
        return RETURN_1;
    } else if (*x < *y) {
         return FAILD;   
    }
    return NO_ERR;
}
static napi_value RealPath(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    char actualPath[PATH_MAX] = {0};
    char *ptrRet = nullptr;
    int fd = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    close(fd);
    ptrRet = realpath("/data/storage/el2/base/files/Fzl.txt", actualPath);
    napi_value result = nullptr;
    if (ptrRet != nullptr) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }
    return result;
}

static napi_value Qsort(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value = PARAM_0;
    napi_get_value_int32(env, args[0], &value);
    const int num = PARAM_10;
    int arr[num] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    qsort(arr, num, sizeof(int), Compare);
    napi_value result = nullptr;
    napi_create_int32(env, arr[value], &result);
    return result;
}

static napi_value PtsName(napi_env env, napi_callback_info info)
{
    char *returnValue;
    napi_value result = nullptr;
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT);
    returnValue = ptsname(fileDescribe);
    int backInfo = PARAM_0;
    if (returnValue != nullptr) {
        backInfo = RETURN_1;
    }
    napi_create_int32(env, backInfo, &result);
    return result;
}
void bye(void) {}

static napi_value Atexit(napi_env env, napi_callback_info info)
{
    int ret = atexit(bye);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value System(napi_env env, napi_callback_info info)
{
    int system_result = system(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, system_result, &result);
    return result;
}

static napi_value Unlockpt(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fdm = open("/data/storage/el2/base/files/Fzl.txt", O_RDWR | O_CREAT);
    grantpt(fdm);
    int ret = unlockpt(fdm);
    napi_create_int32(env, ret, &result);
    close(fdm);
    return result;
}

static napi_value Unsetenv(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string valueFirst = NapiHelper::GetString(env, args[0]);
    int unsetenvValue = DEF_VALUE;
    if (strcmp(valueFirst.data(), "") == PARAM_0) {
        unsetenvValue = unsetenv(valueFirst.data());
    } else {
        char env_temp[] = "test=putenv_0100";
        int ret = putenv(env_temp);
        std::string test = getenv("test");
        if (strcmp(test.data(), "putenv_0100") == PARAM_0) {
            ret = unsetenv("test");
            if (ret == PARAM_0) {
                unsetenvValue = RETURN_1;
            }
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, unsetenvValue, &result);
    return result;
}

static napi_value PosixMemAlign(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    void *memory = nullptr;
    int rev = posix_memalign(&memory, SIZE_16, RETURN_1);
    if (memory) {
        free(memory);
    }
    napi_value result = nullptr;
    napi_create_int32(env, rev, &result);
    return result;
}

static napi_value Exit(napi_env env, napi_callback_info info)
{
    int backParam = SUCCESS;
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    int pid = fork();
    if (pid == PARAM_UNNORMAL) {
        exit(RETURN_1);
    }
    return result;
}

static napi_value Abs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int backParam, firstParam;
    napi_get_value_int32(env, args[0], &firstParam);
    backParam = abs(firstParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value DRand48(napi_env env, napi_callback_info info)
{
    double backParam = drand48();
    napi_value result = nullptr;
    napi_create_double(env, backParam, &result);
    return result;
}

static napi_value ERand48(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr, nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstTemp;
    napi_get_value_int32(env, args[0], &firstTemp);
    int secondTemp;
    napi_get_value_int32(env, args[1], &secondTemp);
    int thirdTemp;
    napi_get_value_int32(env, args[PARAM_2], &thirdTemp);
    unsigned short firstParam, secondParam, thirdParam;
    firstParam = firstTemp;
    secondParam = secondTemp;
    thirdParam = thirdTemp;
    unsigned short testNo[3] = {firstParam, secondParam, thirdParam};
    double backParam = erand48(testNo);
    napi_value result = nullptr;
    napi_create_double(env, backParam, &result);
    return result;
}

static napi_value Div(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int firstParam, secondParam;
    char backParam[64] = {"("}, strBuufer[64];
    napi_get_value_int32(env, args[0], &firstParam);
    napi_get_value_int32(env, args[1], &secondParam);
    div_t divResult;
    divResult = div(firstParam, secondParam);
    sprintf(strBuufer, "%d", divResult.quot);
    strcat(backParam, strBuufer);
    strcat(backParam, ",");
    sprintf(strBuufer, "%d", divResult.rem);
    strcat(backParam, strBuufer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Atof(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *param = NapiHelper::GetString(env, args[0]);
    napi_value result = nullptr;

    double resultValue = atof(param);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Atoi(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *param = NapiHelper::GetString(env, args[0]);
    napi_value result = nullptr;

    double resultValue = atoi(param);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Atol(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *param = NapiHelper::GetString(env, args[0]);
    napi_value result = nullptr;

    double resultValue = atol(param);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Atoll(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *param = NapiHelper::GetString(env, args[0]);
    napi_value result = nullptr;

    double resultValue = atoll(param);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value AlignedAlloc(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int size;
    int resulTrue = SUCCESS;
    int resulFalse = EXPECTERROR;
    napi_get_value_int32(env, args[0], &size);
    napi_value result = nullptr;

    void *resultValue = aligned_alloc(alignof(void *), size);
    if (resultValue) {
        napi_create_int32(env, resulTrue, &result);
    } else {
        napi_create_int32(env, resulFalse, &result);
    }

    return result;
}

static napi_value Getenv(napi_env env, napi_callback_info info)
{
    const char *env_var[1] = {"HOME"};
    char *env_val[1];
    int resultValue = EXPECTERROR;
    for (int i = PARAM_0; i < 1; i++) {
        env_val[i] = getenv(env_var[i]);
        if (env_val[i] != nullptr) {
            resultValue = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value AtQuickExit(napi_env env, napi_callback_info info)
{
    int size;
    napi_value result = nullptr;
    size = at_quick_exit(bye);
    napi_create_int32(env, size, &result);
    return result;
}

static napi_value Calloc(napi_env env, napi_callback_info info)
{
    size_t size = SIZE_10;
    size_t param = SIZE_20;
    napi_value result = nullptr;
    int resultValue = EXPECTERROR;
    if (calloc(size, param)) {
        resultValue = SUCCESS;
    }
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Free(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int *ptr;
    size_t size = SIZE_5;
    ptr = static_cast<int*>(malloc(size * sizeof(int)));
    free(ptr);
    napi_value result = nullptr;
    int resultValue = EXPECTERROR;
    if (errno == PARAM_0) {
        resultValue = SUCCESS;
    }
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Bsearch(napi_env env, napi_callback_info info)
{
    const int num = SIZE_10;
    int arr[num] = {5, 9, 10, 14, 16, 19, 21, 26, 29, 31};
    int key1 = SIZE_10;
    int *p1 = static_cast<int*>(bsearch(&key1, arr, num, sizeof(int), Compare));
    int returnValue = EXPECTERROR;
    if (p1 != nullptr) {
        returnValue = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Clearenv(napi_env env, napi_callback_info info)
{
    int returnValue = clearenv();
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value SetState(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char state[STAT_SIZE] = {0, 1, 2, 3, 4};
    char *stateInit = nullptr;
    char *stateSet = nullptr;
    stateInit = initstate(SEED, state, STAT_SIZE);
    stateSet = setstate(stateInit);
    if (nullptr != stateSet) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    return result;
}

struct __locale_struct {
    double val;
};

static napi_value StrToFL(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char *nptr = "10";
    char *endptr = nullptr;
    struct __locale_struct loc = {0};
    double value = strtof_l(nptr, &endptr, &loc);
    if (value == TEST_NUM) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    return result;
}

static napi_value StrToDL(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char *nptr = "10";
    char *endptr = nullptr;
    struct __locale_struct loc = {0};
    double value = strtod_l(nptr, &endptr, &loc);
    if (value == TEST_NUM) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    return result;
}

static napi_value StrToLdL(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char *nptr = "10";
    char *endptr = nullptr;
    struct __locale_struct loc = {0};
    long double value = strtold_l(nptr, &endptr, &loc);
    if (value == TEST_NUM) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    return result;
}

static napi_value Realloc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    void *arr = malloc(LIB_BUFF_SIZE);
    void *ptr = realloc(arr, LIB_BUFF_SIZE + LIB_BUFF_SIZE);
    if (ptr != nullptr) {
        free(ptr);
        ptr = nullptr;
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    return result;
}

static napi_value Valloc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t len = LIB_BUFF_SIZE;
    void *memptr = valloc(len);
    if (memptr != nullptr) {
        napi_create_int32(env, PARAM_0, &result);
        free(memptr);
        memptr = nullptr;
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"rand", nullptr, Rand, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"randR", nullptr, RandR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"random", nullptr, Random, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"seed48", nullptr, Seed48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"srand", nullptr, Srand, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"srand48", nullptr, Srand48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"srandom", nullptr, Srandom, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtod", nullptr, Strtod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtof", nullptr, Strtof, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtol", nullptr, Strtol, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtold", nullptr, Strtold, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoll", nullptr, Strtoll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoul", nullptr, Strtoul, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strtoull", nullptr, Strtoull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"llabs", nullptr, LLabs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"labs", nullptr, Labs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lcong48", nullptr, Lcong48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ldiv", nullptr, Ldiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lldiv", nullptr, LLdiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkTemp", nullptr, MkTemp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkSTemp", nullptr, MkSTemp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkOSTemp", nullptr, MkOSTemp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkSTempS", nullptr, MkSTempS, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkOSTempS", nullptr, MkOSTempS, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkSTemp64", nullptr, MkSTemp64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkOSTemp64", nullptr, MkOSTemp64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkSTempS64", nullptr, MkSTempS64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkOSTempS64", nullptr, MkOSTempS64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getloadavg", nullptr, Getloadavg, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getsubopt", nullptr, Getsubopt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"grantpt", nullptr, Grantpt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setenv", nullptr, Setenv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLoadAvg", nullptr, GetLoadAvg, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"system", nullptr, System, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unlockpt", nullptr, Unlockpt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unsetenv", nullptr, Unsetenv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erand48", nullptr, ERand48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"drand48", nullptr, DRand48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exit", nullptr, Exit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"div", nullptr, Div, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"abs", nullptr, Abs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atof", nullptr, Atof, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atoi", nullptr, Atoi, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atol", nullptr, Atol, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atoll", nullptr, Atoll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"alignedAlloc", nullptr, AlignedAlloc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atQuickExit", nullptr, AtQuickExit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"calloc", nullptr, Calloc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getenv", nullptr, Getenv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"bsearch", nullptr, Bsearch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearenv", nullptr, Clearenv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"free", nullptr, Free, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mkDTemp", nullptr, MkDTemp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mblen", nullptr, Mblen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"jrand48", nullptr, Jrand48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initState", nullptr, InitState, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lrand48", nullptr, Lrand48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"realPath", nullptr, RealPath, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"atexit", nullptr, Atexit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"qsort", nullptr, Qsort, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixMemAlign", nullptr, PosixMemAlign, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ptsName", nullptr, PtsName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setState", nullptr, SetState, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strToFL", nullptr, StrToFL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strToDL", nullptr, StrToDL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"strToLdL", nullptr, StrToLdL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"valloc", nullptr, Valloc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"realloc", nullptr, Realloc, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "stdlib",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
