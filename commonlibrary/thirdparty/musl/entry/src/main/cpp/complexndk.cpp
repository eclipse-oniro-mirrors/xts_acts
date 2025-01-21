/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain testComplex copy of the License at
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

#include "complex.h"
#include "napi/native_api.h"
#include <math.h>

#define INDEX0 0
#define INDEX1 1
#define INDEX2 2
#define INDEX3 3
#define INDEX4 4
#define FAIL (-1)

static napi_value CReal(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, backParam;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    double complex testComplex = {firstParam, secondParam};
    backParam = creal(testComplex);
    napi_value result = nullptr;
    napi_create_double(env, backParam, &result);
    return result;
}

static napi_value CRealF(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, backParam;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    float real, image;
    real = float(firstParam);
    image = float(secondParam);
    float complex testComplex = {real, image};
    backParam = crealf(testComplex);
    napi_value result = nullptr;
    napi_create_double(env, backParam, &result);
    return result;
}

static napi_value CRealL(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, backParam;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    backParam = creall(testComplex);
    napi_value result = nullptr;
    napi_create_double(env, backParam, &result);
    return result;
}

static napi_value Conj(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    double complex testComplex = {firstParam, secondParam};
    double complex getComplex = conj(testComplex);
    getRealAndImage = creal(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimag(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value ConjF(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    float real, image, getRealAndImage;
    real = float(firstParam);
    image = float(secondParam);
    float complex testComplex = {real, image};
    float complex getComplex = conjf(testComplex);
    getRealAndImage = crealf(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagf(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value ConjL(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = conjl(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CPow(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX4;
    napi_value args[4] = {nullptr, nullptr, nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, mid3, mid4, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    napi_get_value_double(env, args[INDEX2], &mid3);
    napi_get_value_double(env, args[INDEX3], &mid4);
    double complex testComplex = {firstParam, secondParam}, anotherTestComplex = {mid3, mid4};
    double complex getComplex = cpow(testComplex, anotherTestComplex);
    getRealAndImage = creal(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimag(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CPowF(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX4;
    napi_value args[4] = {nullptr, nullptr, nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, mid3, mid4;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    napi_get_value_double(env, args[INDEX2], &mid3);
    napi_get_value_double(env, args[INDEX3], &mid4);
    float real = float(firstParam), image = float(secondParam), anotherReal = float(mid3), anotherImage = float(mid4),
          getRealAndImage;
    float complex testComplex = {real, image}, anotherTestComplex = {anotherReal, anotherImage};
    float complex getComplex = cpow(testComplex, anotherTestComplex);
    getRealAndImage = crealf(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagf(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CPowL(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX4;
    napi_value args[4] = {nullptr, nullptr, nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, mid3, mid4, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    napi_get_value_double(env, args[INDEX2], &mid3);
    napi_get_value_double(env, args[INDEX3], &mid4);
    long double complex testComplex = {firstParam, secondParam}, anotherTestComplex = {mid3, mid4};
    long double complex getComplex = cpowl(testComplex, anotherTestComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CProj(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    double complex testComplex = {firstParam, secondParam};
    double complex getComplex = cproj(testComplex);
    getRealAndImage = creal(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimag(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CProjF(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    float real, image, getRealAndImage;
    real = float(firstParam);
    image = float(secondParam);
    float complex testComplex = {real, image};
    float complex getComplex = cprojf(testComplex);
    getRealAndImage = crealf(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagf(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CProjL(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = cprojl(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CSin(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = csin(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CSinF(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = csinf(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CSinL(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = csinl(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CSinH(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = csinh(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CSinHf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = csinhf(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CSinHl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = csinhl(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CSqrt(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = csqrt(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CSqrtF(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = csqrtf(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CSqrtL(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = csqrtl(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CTan(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = ctan(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CTanF(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = ctanf(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CTanL(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = ctanl(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CTanH(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = ctanh(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CTanHf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = ctanhf(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value CTanHl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double firstParam, secondParam, getRealAndImage;
    napi_get_value_double(env, args[INDEX0], &firstParam);
    napi_get_value_double(env, args[INDEX1], &secondParam);
    long double complex testComplex = {firstParam, secondParam};
    long double complex getComplex = ctanhl(testComplex);
    getRealAndImage = creall(getComplex);
    char buffer[20];
    char backParam[128] = {"("};
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ",");
    getRealAndImage = cimagl(getComplex);
    sprintf(buffer, "%.2f", getRealAndImage);
    strcat(backParam, buffer);
    strcat(backParam, ")");
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Cabs(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double resultValue = cabs(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);
    return result;
}

static napi_value Cabsf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    float complex param = {(float)real, (float)image};
    float resultValue = cabsf(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);
    return result;
}

static napi_value Cabsl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double resultValue = cabsl(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);
    return result;
}

static napi_value Cacos(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = cacos(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Cacosl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = cacosl(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Cacosf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = cacosf(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Cacosh(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = cacosh(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Cacoshf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = cacoshf(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Cacoshl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = cacoshl(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Carg(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double resultValue = carg(param);
    napi_value result = nullptr;
    double finalValue = FAIL;
    if (resultValue <= M_PI && resultValue >= -M_PI) {
        finalValue = INDEX1;
    }
    napi_create_double(env, finalValue, &result);
    return result;
}

static napi_value Cargl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double resultValue = cargl(param);
    napi_value result = nullptr;
    double finalValue = FAIL;
    if (resultValue <= M_PI && resultValue >= -M_PI) {
        finalValue = INDEX1;
    }
    napi_create_double(env, finalValue, &result);
    return result;
}

static napi_value Cargf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double resultValue = cargf(param);
    napi_value result = nullptr;
    double finalValue = FAIL;
    if (resultValue <= M_PI && resultValue >= -M_PI) {
        finalValue = INDEX1;
    }
    napi_create_double(env, finalValue, &result);
    return result;
}

static napi_value Casin(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = casin(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Casinl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = casinl(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Casinf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = casinf(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Casinh(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = casinh(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Casinhf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = casinhf(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Casinhl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = casinhl(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Catan(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = catan(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Catanl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = catanl(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Catanf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = catanf(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Catanh(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = catanh(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Catanhf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = catanhf(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Catanhl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = catanhl(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Ccos(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = ccos(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Ccosl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = ccosl(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Ccosf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = ccosf(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Ccosh(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = ccosh(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Ccoshf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = ccoshf(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Ccoshl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = ccoshl(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Cexp(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = cexp(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Cexpl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = cexpl(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Cexpf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = cexpf(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Clog(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = clog(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Clogf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = clogf(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Clogl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double complex resultValue = clogl(param);
    napi_value result = nullptr;
    double end;
    char buffer[20];
    char value[128] = {"("};
    end = creal(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ",");
    end = cimag(resultValue);
    sprintf(buffer, "%.2f", end);
    strcat(value, buffer);
    strcat(value, ")");
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Cimag(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double resultValue = cimag(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);
    return result;
}

static napi_value Cimagf(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double resultValue = cimagf(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);
    return result;
}

static napi_value Cimagl(napi_env env, napi_callback_info info)
{
    size_t argc = INDEX2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double real, image;
    napi_get_value_double(env, args[0], &real);
    napi_get_value_double(env, args[1], &image);
    double complex param = {real, image};
    double resultValue = cimagl(param);
    napi_value result = nullptr;
    napi_create_double(env, resultValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {{"creal", nullptr, CReal, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"crealf", nullptr, CRealF, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"creall", nullptr, CRealL, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"conj", nullptr, Conj, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"conjf", nullptr, ConjF, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"conjl", nullptr, ConjL, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cpow", nullptr, CPow, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cpowf", nullptr, CPowF, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cpowl", nullptr, CPowL, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cproj", nullptr, CProj, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cprojf", nullptr, CProjF, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cprojl", nullptr, CProjL, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"csin", nullptr, CSin, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"csinf", nullptr, CSinF, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"csinl", nullptr, CSinL, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"csinh", nullptr, CSinH, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"csinhf", nullptr, CSinHf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"csinhl", nullptr, CSinHl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"csqrt", nullptr, CSqrt, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"csqrtf", nullptr, CSqrtF, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"csqrtl", nullptr, CSqrtL, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ctan", nullptr, CTan, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ctanf", nullptr, CTanF, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ctanl", nullptr, CTanL, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ctanh", nullptr, CTanH, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ctanhf", nullptr, CTanHf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ctanhl", nullptr, CTanHl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cabs", nullptr, Cabs, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cabsf", nullptr, Cabsf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cacos", nullptr, Cacos, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cexpf", nullptr, Cexpf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cexpl", nullptr, Cexpl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cexp", nullptr, Cexp, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cacosf", nullptr, Cacosf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cacosl", nullptr, Cacosl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cacosh", nullptr, Cacosh, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cacoshl", nullptr, Cacoshl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cacoshf", nullptr, Cacoshf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"casin", nullptr, Casin, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"casinf", nullptr, Casinf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"casinl", nullptr, Casinl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"casinh", nullptr, Casinh, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"casinhf", nullptr, Casinhf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"casinhl", nullptr, Casinhl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"catan", nullptr, Catan, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"catanf", nullptr, Catanf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"catanl", nullptr, Catanl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"catanh", nullptr, Catanh, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"catanhf", nullptr, Catanhf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"catanhl", nullptr, Catanhl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ccos", nullptr, Ccos, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ccosf", nullptr, Ccosf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ccosl", nullptr, Ccosl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ccosh", nullptr, Ccosh, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ccoshf", nullptr, Ccoshf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"ccoshl", nullptr, Ccoshl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"carg", nullptr, Carg, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cargf", nullptr, Cargf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cargl", nullptr, Cargl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"clog", nullptr, Clog, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"clogf", nullptr, Clogf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"clogl", nullptr, Clogl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cimag", nullptr, Cimag, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cimagf", nullptr, Cimagf, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cimagl", nullptr, Cimagl, nullptr, nullptr, nullptr, napi_default, nullptr},
                                       {"cabsl", nullptr, Cabsl, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "complexndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
