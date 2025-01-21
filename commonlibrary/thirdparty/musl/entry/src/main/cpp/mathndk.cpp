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

#include "cstdlib"
#include "napi/native_api.h"
#include <cmath>
#include <cstdlib>
#include <js_native_api.h>
#include <node_api.h>

#define PI 3.14159265358979
#define HALFCIRCLE 180.0
#define TRUE 1
#define FALSE 0
#define ERROR (-1)
#define ONE 1
#define TWO 2
#define STRLENGTH 64
#define FAIL (-1)
#define SUCCESS 1
#define MAGICNUM (-0.5385416161050316)
#define MAGICYNFNUM (-0.5385416746139526)
#define PARAM_FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_30 3.0
#define PARAM_UNNORMAL (-1)

static napi_value LLround(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    int roundValue = llround(value);
    napi_value result = nullptr;
    napi_create_int32(env, roundValue, &result);
    return result;
}
static napi_value LLroundf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    int roundValue = llroundf(value);
    napi_value result = nullptr;
    napi_create_int32(env, roundValue, &result);
    return result;
}

static napi_value LLroundl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    int roundValue = llroundl(value);
    napi_value result = nullptr;
    napi_create_int32(env, roundValue, &result);
    return result;
}

static napi_value LLrint(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    int roundValue = llrint(value);
    napi_value result = nullptr;
    napi_create_int32(env, roundValue, &result);
    return result;
}
static napi_value LLrintf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    int roundValue = llrintf(value);
    napi_value result = nullptr;
    napi_create_int32(env, roundValue, &result);
    return result;
}
static napi_value LRintf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double lrintf_value = lrintf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, lrintf_value, &result);

    return result;
}
static napi_value LLrintl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    int roundValue = llrintl(value);
    napi_value result = nullptr;
    napi_create_int32(env, roundValue, &result);
    return result;
}

static napi_value Lgamma(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param, ret;
    napi_get_value_double(env, args[0], &param);
    ret = lgamma(param);
    napi_value result;
    if (HUGE_VAL == ret) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_double(env, ret, &result);
    }
    return result;
}
static napi_value Lgammaf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param, ret;
    napi_get_value_double(env, args[0], &param);
    ret = lgammaf(param);
    napi_value result;
    if (HUGE_VALF == ret) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_double(env, ret, &result);
    }
    return result;
}
static napi_value Lgammal(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param, ret;
    napi_get_value_double(env, args[0], &param);
    ret = lgammal(param);
    napi_value result;
    if (HUGE_VALL == ret) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_double(env, ret, &result);
    }
    return result;
}

#define THIRTYONE 31

static napi_value Lgamma_r(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param, ret;
    int a;
    napi_get_value_double(env, args[0], &param);
    ret = lgamma_r(param, &a);
    napi_value result;
    if (HUGE_VAL == ret) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_double(env, ret, &result);
    }
    return result;
}
static napi_value Lgammaf_r(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param, ret;
    int a;
    napi_get_value_double(env, args[0], &param);
    ret = lgammaf_r(param, &a);
    napi_value result;
    if (HUGE_VALF == ret) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_double(env, ret, &result);
    }
    return result;
}
static napi_value Lgammal_r(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param, ret;
    int a;
    napi_get_value_double(env, args[0], &param);
    ret = lgammal_r(param, &a);
    napi_value result;
    if (HUGE_VALL == ret) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_double(env, ret, &result);
    }
    return result;
}

static napi_value Ldexp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int secondParam;
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_get_value_int32(env, args[1], &secondParam);
    double retj = ldexp(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, retj, &result);
    return result;
}

static napi_value Ldexpl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int secondParam;
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_get_value_int32(env, args[1], &secondParam);
    double retj = ldexpl(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, retj, &result);
    return result;
}

static napi_value Ldexpf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int secondParam;
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_get_value_int32(env, args[1], &secondParam);
    double retj = ldexpf(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, retj, &result);
    return result;
}

static napi_value J0(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double expect;
    napi_get_value_double(env, args[0], &expect);
    double retj = j0(expect);
    napi_value result;
    napi_create_double(env, retj, &result);
    return result;
}

static napi_value J0f(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double expect;
    napi_get_value_double(env, args[0], &expect);
    double retj = j0f(expect);
    napi_value result;
    napi_create_double(env, retj, &result);
    return result;
}

static napi_value J1(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double expect;
    napi_get_value_double(env, args[0], &expect);
    double retj = j1(expect);
    napi_value result;
    napi_create_double(env, retj, &result);
    return result;
}

static napi_value J1f(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double expect;
    napi_get_value_double(env, args[0], &expect);
    double retj = j1f(expect);
    napi_value result;
    napi_create_double(env, retj, &result);
    return result;
}

static napi_value Jn(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double expect;
    int n;
    napi_get_value_int32(env, args[0], &n);
    napi_get_value_double(env, args[1], &expect);
    double retj = jn(n, expect);
    napi_value result;
    napi_create_double(env, retj, &result);
    return result;
}

static napi_value Jnf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double expect;
    int n;
    napi_get_value_int32(env, args[0], &n);
    napi_get_value_double(env, args[1], &expect);
    double retj = jnf(n, expect);
    napi_value result;
    napi_create_double(env, retj, &result);
    return result;
}

static napi_value ASin(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asin(valueZero);
    int resultTrue = PARAM_1;
    if (resultValue <= M_PI && resultValue >= -M_PI) {
        napi_create_double(env, resultTrue, &result);
    } else {
        napi_create_double(env, resultValue, &result);
    }

    return result;
}

static napi_value ASinF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asinf(valueZero);
    int resultTrue = PARAM_1;
    if (resultValue <= M_PI && resultValue >= -M_PI) {
        napi_create_double(env, resultTrue, &result);
    } else {
        napi_create_double(env, resultValue, &result);
    }

    return result;
}

static napi_value ASinL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asinl(valueZero);
    int resultTrue = PARAM_1;
    if (resultValue <= M_PI && resultValue >= -M_PI) {
        napi_create_double(env, resultTrue, &result);
    } else {
        napi_create_double(env, resultValue, &result);
    }

    return result;
}

static napi_value ASinH(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asinh(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ASinHF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asinhf(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ASinHL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = asinhl(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACos(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acos(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACosF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acosf(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACosL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acosl(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACosH(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acosh(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACosHL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acoshl(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ACosHF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = acoshf(valueZero);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ATan(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = atan(valueZero);
    int resultTrue = TRUE;
    if (valueZero == ERROR || valueZero == TRUE) {
        if (resultValue <= M_PI_2 && resultValue >= -M_PI_2) {
            napi_create_double(env, resultTrue, &result);
        }
    } else {
        napi_create_double(env, resultValue, &result);
    }
    return result;
}

static napi_value ATanF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;

    double resultValue = atanf(valueZero);
    int resultTrue = TRUE;
    if (valueZero == ERROR || valueZero == TRUE) {
        if (resultValue <= M_PI_2 && resultValue >= -M_PI_2) {
            napi_create_double(env, resultTrue, &result);
        }
    } else {
        napi_create_double(env, resultValue, &result);
    }
    return result;
}

static napi_value ATanL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    int resultTrue = PARAM_1;
    napi_get_value_double(env, args[0], &valueZero);
    napi_value result = nullptr;
    double resultValue = atanl(valueZero);
    if (resultValue <= M_PI_2 && resultValue >= -M_PI_2) {
        napi_create_double(env, resultTrue, &result);
        if (valueZero == INFINITY || valueZero == -INFINITY) {
            napi_create_double(env, resultValue, &result);
        }
    } else {
        napi_create_double(env, resultValue, &result);
    }
    return result;
}

static napi_value ATan2(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    double firstParam;
    napi_get_value_double(env, args[0], &valueZero);
    napi_get_value_double(env, args[1], &firstParam);
    napi_value result = nullptr;

    double resultValue = atan2(valueZero, firstParam);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ATan2F(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    double firstParam;
    napi_get_value_double(env, args[0], &valueZero);
    napi_get_value_double(env, args[1], &firstParam);
    napi_value result = nullptr;

    double resultValue = atan2f(valueZero, firstParam);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ATan2L(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    double firstParam;
    napi_get_value_double(env, args[0], &valueZero);
    napi_get_value_double(env, args[1], &firstParam);
    napi_value result = nullptr;

    double resultValue = atan2l(valueZero, firstParam);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Fmod(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmod(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMin(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmin(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMax(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmax(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Fma(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr, nullptr, nullptr};
    int indexSecond = TWO, indexFirst = ONE, indexZero = PARAM_0;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[indexZero], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[indexFirst], &secondParam);
    double thirdParam;
    napi_get_value_double(env, args[indexSecond], &thirdParam);
    double getResult = fma(firstParam, secondParam, thirdParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Floor(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = floor(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FDim(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fdim(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FAbs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = fabs(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Exp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = exp(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CopySignL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = copysignl(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CopySignF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = copysignf(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CopySign(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = copysign(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Erf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erf(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Cos(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = cos(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Cosh(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = cosh(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Exp2(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = exp2(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ExpM1(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = expm1(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FmodF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmodf(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FmodL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmodl(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMinF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fminf(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMinL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fminl(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMaxF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmaxf(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FMaxL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fmaxl(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FmaF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr, nullptr, nullptr};
    int indexSecond = TWO, indexFirst = ONE, indexZero = PARAM_0;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[indexZero], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[indexFirst], &secondParam);
    double thirdParam;
    napi_get_value_double(env, args[indexSecond], &thirdParam);
    double getResult = fmaf(firstParam, secondParam, thirdParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FmaL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr, nullptr, nullptr};
    int indexSecond = TWO, indexFirst = ONE, indexZero = PARAM_0;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[indexZero], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[indexFirst], &secondParam);
    double thirdParam;
    napi_get_value_double(env, args[indexSecond], &thirdParam);
    double getResult = fmal(firstParam, secondParam, thirdParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FloorF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = floorf(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FloorL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = floorl(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FDimF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fdimf(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FDimL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double secondParam;
    napi_get_value_double(env, args[1], &secondParam);
    double getResult = fdiml(firstParam, secondParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FAbsL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = fabsl(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value FAbsF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    float getVOne = firstParam;
    float getResultF = fabsf(getVOne);
    double getResult = getResultF;
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Ceil(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = ceil(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CeilF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = ceilf(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CeilL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = ceill(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ExpM1f(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = expm1f(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ExpM1l(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = expm1l(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ExpF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = expf(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ExpL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = expl(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Exp2f(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = exp2f(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value Exp2l(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = exp2l(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ErfC(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erfc(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ErfCf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erfcf(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ErfCl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erfcl(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ErfF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erff(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value ErfL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = erfl(firstParam);
    napi_value result;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CosF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = cosf(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CosL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = cosl(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CosHf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = coshf(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static napi_value CosHl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    double getResult = coshl(firstParam * PI / HALFCIRCLE);
    napi_value result = nullptr;
    napi_create_double(env, getResult, &result);
    return result;
}

static double doubleInput(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double expect;
    napi_get_value_double(env, args[0], &expect);
    return expect;
}

static napi_value doubleOutput(napi_env env, double output)
{
    napi_value result;
    napi_create_double(env, output, &result);
    return result;
}

static napi_value Log(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log(input));
}

static napi_value Log10(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log10(input));
}

static napi_value Log10f(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log10f(input));
}

static napi_value Log10l(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log10l(input));
}

static napi_value Log1p(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log1p(input));
}

static napi_value Log1pf(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    return doubleOutput(env, log1pf(input));
}

static napi_value Log1pl(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = log1pl(input);
    return doubleOutput(env, result);
}

static napi_value Log2(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = log2(input);
    return doubleOutput(env, result);
}

static napi_value Log2f(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = log2(input);
    return doubleOutput(env, result);
}

static napi_value Log2l(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = log2(input);
    return doubleOutput(env, result);
}

static napi_value LogB(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = logb(input);
    return doubleOutput(env, result);
}

static napi_value LogBf(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = logbf(input);
    return doubleOutput(env, result);
}

static napi_value LogBl(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = logbf(input);
    return doubleOutput(env, result);
}

static napi_value LogF(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = logf(input);
    return doubleOutput(env, result);
}

static napi_value LogL(napi_env env, napi_callback_info info)
{
    double input = doubleInput(env, info);
    double result = logl(input);
    return doubleOutput(env, result);
}

static napi_value Sin(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sinValue = sin(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sinValue, &result);
    return result;
}

static napi_value Sinf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sinValue = sinf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sinValue, &result);
    return result;
}

static napi_value Sinh(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sinValue = sinh(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sinValue, &result);
    return result;
}

static napi_value Sinhf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sinValue = sinhf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sinValue, &result);
    return result;
}

static napi_value Sinhl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sinValue = sinhl(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sinValue, &result);
    return result;
}

static napi_value Sinl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sinValue = sinl(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sinValue, &result);
    return result;
}

static napi_value Sqrt(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sinValue = sqrt(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sinValue, &result);
    return result;
}

static napi_value Sqrtf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sinValue = sqrtf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sinValue, &result);
    return result;
}

static napi_value Sqrtl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double sinValue = sqrtl(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, sinValue, &result);
    return result;
}

static napi_value Remainder(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);

    double remainderValue = remainder(valueZero, firstParam);
    napi_value result = nullptr;
    napi_create_double(env, remainderValue, &result);

    return result;
}

static napi_value Remainderf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);

    double remainderValue = remainderf(valueZero, firstParam);
    napi_value result = nullptr;
    napi_create_double(env, remainderValue, &result);

    return result;
}

static napi_value Remainderl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);

    double remainderValue = remainderl(valueZero, firstParam);
    napi_value result = nullptr;
    napi_create_double(env, remainderValue, &result);
    return result;
}

static napi_value Remquo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);
    int secondParam;
    napi_get_value_int32(env, args[2], &secondParam);

    double remQuoValue = remquo(valueZero, firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_double(env, remQuoValue, &result);

    return result;
}

static napi_value Remquof(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);
    int secondParam;
    napi_get_value_int32(env, args[2], &secondParam);

    double remQuoValue = remquof(valueZero, firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_double(env, remQuoValue, &result);

    return result;
}

static napi_value Remquol(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);
    int secondParam;
    napi_get_value_int32(env, args[2], &secondParam);

    double remQuoValue = remquol(valueZero, firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_double(env, remQuoValue, &result);

    return result;
}

static napi_value Rint(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    int rinTValue = rint(valueZero);
    napi_value result = nullptr;
    napi_create_int32(env, rinTValue, &result);

    return result;
}

static napi_value Rintf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double rinTfValue = rintf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, rinTfValue, &result);

    return result;
}

static napi_value Rintl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double rinTLValue = rintl(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, rinTLValue, &result);

    return result;
}

static napi_value Round(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double roundValue = round(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, roundValue, &result);

    return result;
}

static napi_value Roundf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double roundFValue = roundf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, roundFValue, &result);

    return result;
}

static napi_value Roundl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double roundLValue = roundl(valueZero);
    napi_value result = nullptr;
    napi_create_int32(env, roundLValue, &result);

    return result;
}

static napi_value Scalbln(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double firstParam;
    napi_get_value_double(env, args[1], &firstParam);
    double scaLBlnValue = scalbln(valueZero, firstParam);
    napi_value result = nullptr;
    napi_create_double(env, scaLBlnValue, &result);

    return result;
}

static napi_value Tan(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tan_value = tan(value);
    napi_value result = nullptr;
    napi_create_double(env, tan_value, &result);
    return result;
}

static napi_value Tanf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tanFValue = tanf(value);
    napi_value result = nullptr;
    napi_create_double(env, tanFValue, &result);
    return result;
}

static napi_value Tanh(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tanHValue = tanh(value);
    napi_value result = nullptr;
    napi_create_double(env, tanHValue, &result);
    return result;
}

static napi_value Tanhf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tanHfValue = tanhf(value);
    napi_value result = nullptr;
    napi_create_double(env, tanHfValue, &result);
    return result;
}

static napi_value Tanhl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tanHlValue = tanhl(value);
    napi_value result = nullptr;
    napi_create_double(env, tanHlValue, &result);
    return result;
}

static napi_value Tanl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value;
    napi_get_value_double(env, args[0], &value);
    double tanLValue = tanl(value);
    napi_value result = nullptr;
    napi_create_double(env, tanLValue, &result);
    return result;
}

static napi_value Tgamma(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double tgaMmaValue = tgamma(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, tgaMmaValue, &result);
    return result;
}

static napi_value Tgammaf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double tgaMmaFValue = tgammaf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, tgaMmaFValue, &result);
    return result;
}

static napi_value Tgammal(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double tgaMmaLValue = tgammal(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, tgaMmaLValue, &result);
    return result;
}

static napi_value Scalblnl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double first;
    napi_get_value_double(env, args[0], &first);
    int64_t second;
    napi_get_value_int64(env, args[1], &second);
    double value = scalblnl(first, second);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Scalbn(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double first;
    napi_get_value_double(env, args[0], &first);
    int second;
    napi_get_value_int32(env, args[1], &second);
    double value = scalbn(first, second);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Scalblnf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double first;
    napi_get_value_double(env, args[0], &first);
    int64_t second;
    napi_get_value_int64(env, args[1], &second);
    double value = scalblnf(first, second);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Scalbnf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double first;
    napi_get_value_double(env, args[0], &first);
    int64_t second;
    napi_get_value_int64(env, args[1], &second);
    double value = scalbnf(first, second);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Scalbnl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double first;
    napi_get_value_double(env, args[0], &first);
    int second;
    napi_get_value_int32(env, args[1], &second);
    double value = scalbnl(first, second);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Significand(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueFirst;
    napi_get_value_double(env, args[0], &valueFirst);
    double sigval = significand(valueFirst);
    napi_value result;
    napi_create_double(env, sigval, &result);
    return result;
}

static napi_value Significandf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueFirst;
    napi_get_value_double(env, args[0], &valueFirst);
    double sigval = significandf(valueFirst);
    napi_value result;
    napi_create_double(env, sigval, &result);
    return result;
}
static napi_value ATanH(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_value result = nullptr;

    double resultValue = atanh(firstParam);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ATanHF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_value result = nullptr;

    double resultValue = atanhf(firstParam);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value ATanHL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_value result = nullptr;

    double resultValue = atanhl(firstParam);
    napi_create_double(env, resultValue, &result);
    return result;
}
static napi_value ModF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_value result = nullptr;
    double value = PARAM_0;
    modf(firstParam, &value);
    napi_create_double(env, value, &result);
    return result;
}
static napi_value ModFf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_value result = nullptr;
    float value = 0.0;
    modff(firstParam, &value);
    napi_create_double(env, value, &result);
    return result;
}
static napi_value ModFl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_value result = nullptr;
    long double value = PARAM_0;
    modfl(firstParam, &value);
    napi_create_double(env, value, &result);

    return result;
}
static napi_value MRand48(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_value result = nullptr;
    int value = PARAM_0;
    long ret = mrand48();
    if (ret < pow(TWO, THIRTYONE) && ret > -pow(TWO, THIRTYONE)) {
        value = PARAM_0;
    } else {
        value = ERROR;
    }
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Pow(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    double valueFirst;
    double valueSecond;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_get_value_double(env, args[1], &valueSecond);
    napi_create_double(env, pow(valueFirst, valueSecond), &result);

    return result;
}

static napi_value Powf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    double valueFirst;
    double valueSecond;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_get_value_double(env, args[1], &valueSecond);
    napi_create_double(env, powf(valueFirst, valueSecond), &result);

    return result;
}

static napi_value Sincos(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double dLon;
    napi_get_value_double(env, args[0], &dLon);

    double sindLon;
    double cosdLon;
    int intValue;
    napi_get_value_int32(env, args[1], &intValue);
    sincos(dLon, &sindLon, &cosdLon);
    double napi_double_value;
    if (intValue == 1) {
        napi_double_value = sindLon;
    } else {
        napi_double_value = cosdLon;
    }
    napi_value result = nullptr;
    napi_create_double(env, napi_double_value, &result);
    return result;
}

static napi_value Sincosl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double dou;
    napi_get_value_double(env, args[0], &dou);
    int intValue;
    napi_get_value_int32(env, args[1], &intValue);
    long double dLon = dou;
    long double sindou;
    long double cosdou;
    sincosl(dLon, &sindou, &cosdou);
    double napi_double_value;
    if (intValue == 1) {
        napi_double_value = sindou;
    } else {
        napi_double_value = cosdou;
    }
    napi_value result = nullptr;
    napi_create_double(env, napi_double_value, &result);
    return result;
}
static napi_value Sincosf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double dou;
    napi_get_value_double(env, args[0], &dou);
    int intValue;
    napi_get_value_int32(env, args[1], &intValue);
    float dLon = dou;
    float sindou;
    float cosdou;
    sincosf(dLon, &sindou, &cosdou);
    float napi_double_value;
    if (intValue == 1) {
        napi_double_value = sindou;
    } else {
        napi_double_value = cosdou;
    }
    napi_value result = nullptr;
    napi_create_double(env, napi_double_value, &result);
    return result;
}

static napi_value Scalb(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);
    double paramExp;
    napi_get_value_double(env, args[1], &paramExp);
    double resultValue = scalb(param, paramExp);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Scalbf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);
    double paramExp;
    napi_get_value_double(env, args[1], &paramExp);
    double resultValue = scalbf(param, paramExp);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Trunc(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);
    double resultValue = trunc(param);

    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Truncf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);
    double resultValue = truncf(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Truncl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);
    double resultValue = truncl(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Y0(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);
    double resultValue = y0(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Y0f(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);
    double resultValue = y0f(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Y1(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);
    double resultValue = y1(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Y1f(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);
    double resultValue = y1f(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Fpclassify(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);

    double value = __fpclassify(param);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Fpclassifyf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);

    double value = __fpclassifyf(param);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Fpclassifyl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);

    double value = __fpclassifyl(param);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Signbit(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);

    double value = __signbit(param);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Signbitf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);

    double value = __signbitf(param);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value Signbitl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);

    double value = __signbitl(param);
    napi_value result;
    napi_create_double(env, value, &result);
    return result;
}

static napi_value CBrt(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value0;
    napi_get_value_double(env, args[0], &value0);
    napi_value result = nullptr;

    double resultValue = cbrt(value0);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value CBrtL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value0;
    napi_get_value_double(env, args[0], &value0);
    napi_value result = nullptr;

    double resultValue = cbrtl(value0);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value CBrtF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value0;
    napi_get_value_double(env, args[0], &value0);
    napi_value result = nullptr;

    double resultValue = cbrtf(value0);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Frexp(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value0;
    napi_get_value_double(env, args[0], &value0);
    int exp;
    napi_value result = nullptr;

    double resultValue = frexp(value0, &exp);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Frexpf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value0;
    napi_get_value_double(env, args[0], &value0);
    int exp;
    napi_value result = nullptr;

    double resultValue = frexpf(value0, &exp);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Frexpl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double value0;
    napi_get_value_double(env, args[0], &value0);
    int exp;
    napi_value result = nullptr;

    double resultValue = frexpl(value0, &exp);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value Powl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    double valueFirst;
    double valueSecond;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_get_value_double(env, args[1], &valueSecond);
    napi_create_double(env, powl(valueFirst, valueSecond), &result);

    return result;
}

static napi_value NextToward(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    double valueFirst;
    double valueSecond;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_get_value_double(env, args[1], &valueSecond);
    napi_create_double(env, nexttoward(valueFirst, valueSecond), &result);

    return result;
}

static napi_value NextTowardF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    double valueFirst;
    double valueSecond;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_get_value_double(env, args[1], &valueSecond);
    napi_create_double(env, nexttowardf(valueFirst, valueSecond), &result);

    return result;
}

static napi_value NextTowardL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    double valueFirst;
    double valueSecond;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_get_value_double(env, args[1], &valueSecond);
    napi_create_double(env, nexttowardl(valueFirst, valueSecond), &result);

    return result;
}

static napi_value Nextafter(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    double valueFirst;
    double valueSecond;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_get_value_double(env, args[1], &valueSecond);
    napi_create_double(env, nextafter(valueFirst, valueSecond), &result);

    return result;
}

static napi_value Nextafterf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    double valueFirst;
    double valueSecond;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_get_value_double(env, args[1], &valueSecond);
    napi_create_double(env, nextafterf(valueFirst, valueSecond), &result);

    return result;
}

static napi_value Nextafterl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    double valueFirst;
    double valueSecond;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_get_value_double(env, args[1], &valueSecond);
    napi_create_double(env, nextafterl(valueFirst, valueSecond), &result);

    return result;
}

static napi_value Nearbyint(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    double valueFirst;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_create_double(env, nearbyint(valueFirst), &result);

    return result;
}
static napi_value Nearbyintf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    double valueFirst;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_create_double(env, nearbyintf(valueFirst), &result);

    return result;
}
static napi_value Nearbyintl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    double valueFirst;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_double(env, args[0], &valueFirst);
    napi_create_double(env, nearbyintl(valueFirst), &result);

    return result;
}
static napi_value Nan(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    size_t size = STRLENGTH;
    char *value = static_cast<char *>(malloc(sizeof(char) * size));
    size_t actualVal;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], value, size, &actualVal);
    napi_create_double(env, nan(value), &result);

    return result;
}

static napi_value Nanf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    size_t size = STRLENGTH;
    char *value = static_cast<char *>(malloc(sizeof(char) * size));
    size_t actualVal;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], value, size, &actualVal);
    napi_create_double(env, nanf(value), &result);

    return result;
}

static napi_value Nanl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    size_t size = STRLENGTH;
    char *value = static_cast<char *>(malloc(sizeof(char) * size));
    size_t actualVal;
    napi_value result = nullptr;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], value, size, &actualVal);
    napi_create_double(env, nanf(value), &result);

    return result;
}
static napi_value LRint(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    int lrintValue = lrint(valueZero);
    napi_value result = nullptr;
    napi_create_int32(env, lrintValue, &result);

    return result;
}
static napi_value LRintl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double lrintl_value = lrintl(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, lrintl_value, &result);

    return result;
}

static napi_value LRound(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double lroundValue = lround(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, lroundValue, &result);

    return result;
}

static napi_value LRoundf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double lroundf_value = lroundf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, lroundf_value, &result);

    return result;
}

static napi_value LRoundl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double lroundl_value = lroundl(valueZero);
    napi_value result = nullptr;
    napi_create_int32(env, lroundl_value, &result);

    return result;
}

static napi_value HYpot(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double x;
    double y;
    napi_get_value_double(env, args[0], &x);
    napi_get_value_double(env, args[1], &y);
    napi_value result = nullptr;

    double resultValue = hypot(x, y);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value HYpotf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double x;
    double y;
    napi_get_value_double(env, args[0], &x);
    napi_get_value_double(env, args[1], &y);
    napi_value result = nullptr;

    double resultValue = hypotf(x, y);
    napi_create_double(env, resultValue, &result);

    return result;
}

static napi_value HYpotl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double x;
    double y;
    napi_get_value_double(env, args[0], &x);
    napi_get_value_double(env, args[1], &y);
    napi_value result = nullptr;

    double resultValue = hypotl(x, y);
    napi_create_double(env, resultValue, &result);
    return result;
}
static napi_value ILogb(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double ilogb_value = ilogb(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, ilogb_value, &result);
    return result;
}
static napi_value ILogbf(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double ilogbf_value = ilogbf(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, ilogbf_value, &result);

    return result;
}
static napi_value ILogbl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double valueZero;
    napi_get_value_double(env, args[0], &valueZero);
    double ilogbl_value = ilogbl(valueZero);
    napi_value result = nullptr;
    napi_create_double(env, ilogbl_value, &result);

    return result;
}

extern int signgam;
static napi_value SignGam(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double param;
    napi_get_value_double(env, args[0], &param);
    lgamma(param);
    napi_value result;
    int retVal = FAIL;
    if (signgam >= PARAM_0) {
        retVal = SUCCESS;
    } else {
        retVal = FAIL;
    }
    napi_create_double(env, retVal, &result);
    return result;
}
static napi_value Yn(napi_env env, napi_callback_info info)
{
    double ret = yn(PARAM_3, PARAM_30);
    napi_value result = nullptr;
    if (ret == MAGICNUM) {
        napi_create_double(env, PARAM_0, &result);
    } else {
        napi_create_double(env, PARAM_UNNORMAL, &result);
    }
    return result;
}
static napi_value Ynf(napi_env env, napi_callback_info info)
{
    double ret = ynf(PARAM_3, PARAM_30);
    napi_value result = nullptr;
    if (ret == MAGICYNFNUM) {
        napi_create_double(env, PARAM_0, &result);
    } else {
        napi_create_double(env, PARAM_UNNORMAL, &result);
    }
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"remainder", nullptr, Remainder, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remainderf", nullptr, Remainderf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remainderl", nullptr, Remainderl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remquo", nullptr, Remquo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remquof", nullptr, Remquof, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"remquol", nullptr, Remquol, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rint", nullptr, Rint, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rintf", nullptr, Rintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"rintl", nullptr, Rintl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"round", nullptr, Round, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"roundl", nullptr, Roundl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"roundf", nullptr, Roundf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalbln", nullptr, Scalbln, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tan", nullptr, Tan, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tanf", nullptr, Tanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tanh", nullptr, Tanh, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tanhf", nullptr, Tanhf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tanhl", nullptr, Tanhl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tanl", nullptr, Tanl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tgamma", nullptr, Tgamma, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tgammaf", nullptr, Tgammaf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tgammal", nullptr, Tgammal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalblnl", nullptr, Scalblnl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalbn", nullptr, Scalbn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalblnf", nullptr, Scalblnf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalbnf", nullptr, Scalbnf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalbnl", nullptr, Scalbnl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log", nullptr, Log, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log10", nullptr, Log10, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log10l", nullptr, Log10l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log10f", nullptr, Log10f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log1p", nullptr, Log1p, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log1pf", nullptr, Log1pf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log1pl", nullptr, Log1pl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2", nullptr, Log2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2f", nullptr, Log2f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2l", nullptr, Log2l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logB", nullptr, LogB, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logBf", nullptr, LogBf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logBl", nullptr, LogBl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logF", nullptr, LogF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"logL", nullptr, LogL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSin", nullptr, ASin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSinF", nullptr, ASinF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSinL", nullptr, ASinL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSinH", nullptr, ASinH, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSinHL", nullptr, ASinHL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aSinHF", nullptr, ASinHF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCos", nullptr, ACos, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCosF", nullptr, ACosF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCosL", nullptr, ACosL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCosH", nullptr, ACosH, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCosHL", nullptr, ACosHL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aCosHF", nullptr, ACosHF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTan", nullptr, ATan, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTanF", nullptr, ATanF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTanL", nullptr, ATanL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTan2", nullptr, ATan2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTan2F", nullptr, ATan2F, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTan2L", nullptr, ATan2L, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"coshl", nullptr, CosHl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"coshf", nullptr, CosHf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cosh", nullptr, Cosh, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cosl", nullptr, CosL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cosf", nullptr, CosF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erfl", nullptr, ErfL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erff", nullptr, ErfF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erfcl", nullptr, ErfCl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erfcf", nullptr, ErfCf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erfc", nullptr, ErfC, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2l", nullptr, Exp2l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2f", nullptr, Exp2f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expl", nullptr, ExpL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expf", nullptr, ExpF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expm1l", nullptr, ExpM1l, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expm1f", nullptr, ExpM1f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ceill", nullptr, CeilL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ceilf", nullptr, CeilF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ceil", nullptr, Ceil, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fabsl", nullptr, FAbsL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fabsf", nullptr, FAbsF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdiml", nullptr, FDimL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdimf", nullptr, FDimF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"floorl", nullptr, FloorL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"floorf", nullptr, FloorF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmal", nullptr, FmaL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmaf", nullptr, FmaF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmaxl", nullptr, FMaxL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmaxf", nullptr, FMaxF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fminl", nullptr, FMinL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fminf", nullptr, FMinF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmodl", nullptr, FmodL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmodf", nullptr, FmodF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expm1", nullptr, ExpM1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2", nullptr, Exp2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cos", nullptr, Cos, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"erf", nullptr, Erf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"copysignl", nullptr, CopySignL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"copysignf", nullptr, CopySignF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"copysign", nullptr, CopySign, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp", nullptr, Exp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fabs", nullptr, FAbs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdim", nullptr, FDim, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"floor", nullptr, Floor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fma", nullptr, Fma, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmax", nullptr, FMax, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmin", nullptr, FMin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fmod", nullptr, Fmod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sin", nullptr, Sin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sinf", nullptr, Sinf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sinl", nullptr, Sinl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sinh", nullptr, Sinh, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sinhf", nullptr, Sinhf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sinhl", nullptr, Sinhl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sqrt", nullptr, Sqrt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sqrtf", nullptr, Sqrtf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sqrtl", nullptr, Sqrtl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"j0", nullptr, J0, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"j0f", nullptr, J0f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"j1", nullptr, J1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"j1f", nullptr, J1f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"jn", nullptr, Jn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"jnf", nullptr, Jnf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ldexp", nullptr, Ldexp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ldexpf", nullptr, Ldexpf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ldexpl", nullptr, Ldexpl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTanH", nullptr, ATanH, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTanHF", nullptr, ATanHF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aTanHL", nullptr, ATanHL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sincos", nullptr, Sincos, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sincosl", nullptr, Sincosl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sincosf", nullptr, Sincosf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"significand", nullptr, Significand, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"significandf", nullptr, Significandf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"trunc", nullptr, Trunc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"truncf", nullptr, Truncf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"truncl", nullptr, Truncl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalb", nullptr, Scalb, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scalbf", nullptr, Scalbf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"y0", nullptr, Y0, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"y0f", nullptr, Y0f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"y1", nullptr, Y1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"y1f", nullptr, Y1f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cbrt", nullptr, CBrt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cbrtf", nullptr, CBrtF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cbrtl", nullptr, CBrtL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"frexp", nullptr, Frexp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"frexpl", nullptr, Frexpl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"frexpf", nullptr, Frexpf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fpclassifyl", nullptr, Fpclassifyl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fpclassify", nullptr, Fpclassify, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fpclassifyf", nullptr, Fpclassifyf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"signbit", nullptr, Signbit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"signbitf", nullptr, Signbitf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"signbitl", nullptr, Signbitl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nan", nullptr, Nan, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nanl", nullptr, Nanl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nanf", nullptr, Nanf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nearbyint", nullptr, Nearbyint, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nearbyintf", nullptr, Nearbyintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nearbyintl", nullptr, Nearbyintl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nextafter", nullptr, Nextafter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nextafterl", nullptr, Nextafterl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nextafterf", nullptr, Nextafterf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nextToward", nullptr, NextToward, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nextTowardF", nullptr, NextTowardF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nextTowardL", nullptr, NextTowardL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pow", nullptr, Pow, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powf", nullptr, Powf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powl", nullptr, Powl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"modF", nullptr, ModF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"modFf", nullptr, ModFf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"modFl", nullptr, ModFl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mRand48", nullptr, MRand48, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lgamma", nullptr, Lgamma, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lgammaf", nullptr, Lgammaf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lgammal", nullptr, Lgammal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lgammaR", nullptr, Lgamma_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lgammafR", nullptr, Lgammaf_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lgammalR", nullptr, Lgammal_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"llrint", nullptr, LLrint, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"llrintF", nullptr, LLrintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"llrintL", nullptr, LLrintl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"llround", nullptr, LLround, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"llroundF", nullptr, LLroundf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"llroundL", nullptr, LLroundl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"yn", nullptr, Yn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ynf", nullptr, Ynf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lRint", nullptr, LRint, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lRintf", nullptr, LRintf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lRintl", nullptr, LRintl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lRound", nullptr, LRound, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lRoundl", nullptr, LRoundl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lRoundf", nullptr, LRoundf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ilogb", nullptr, ILogb, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ilogbf", nullptr, ILogbf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ilogbl", nullptr, ILogbl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hypot", nullptr, HYpot, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hypotf", nullptr, HYpotf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hypotl", nullptr, HYpotl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"signGam", nullptr, SignGam, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "math",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
