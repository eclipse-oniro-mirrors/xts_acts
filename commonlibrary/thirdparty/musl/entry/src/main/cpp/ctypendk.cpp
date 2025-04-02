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

#include <cctype>
#include <js_native_api.h>
#include <malloc.h>
#include <node_api.h>

#define TRUE 1
#define FALSE 0
#define ERROR (-1)
#define STRLENGTH 8
#define INPUT_VALUE_ZERO 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_4096 4096
#define SIZE_8192 8192
#define SIZE_128 128

static napi_value Isalnum(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char ch[STRLENGTH];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isalnum(static_cast<int>(ch[0]));
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value IsalnumL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isalnum_l(static_cast<int>(ch[0]), INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Isalpha(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isalpha(static_cast<int>(ch[0]));
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value IsalphaL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isalpha_l(static_cast<int>(ch[0]), INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Isascii(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int retVal = isascii(first);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Isblank(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isblank(static_cast<int>(ch[0]));
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value IsblankL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isblank_l(static_cast<int>(ch[0]), INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Iscntrl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int retVal = iscntrl(first);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value IscntrlL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int retVal = iscntrl_l(first, INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Isdigit(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isdigit(static_cast<int>(ch[0]));
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}
static napi_value IsdigitL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isdigit_l(static_cast<int>(ch[0]), INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Isgraph(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isgraph(static_cast<int>(ch[0]));
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}
static napi_value IsgraphL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isgraph_l(static_cast<int>(ch[0]), INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Islower(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = islower(static_cast<int>(ch[0]));
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value IslowerL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = islower_l(static_cast<int>(ch[0]), INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Isprint(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isprint(static_cast<int>(ch[0]));
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value IsprintL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isprint_l(static_cast<int>(ch[0]), INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Ispunct(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = ispunct(static_cast<int>(ch[0]));
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value IspunctL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = ispunct_l(static_cast<int>(ch[0]), INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Isspace(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isspace(static_cast<int>(ch[0]));
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}
static napi_value IsspaceL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isspace_l(static_cast<int>(ch[0]), INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Isupper(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isupper(static_cast<int>(ch[0]));
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value IsupperL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isupper_l(static_cast<int>(ch[0]), INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Isxdigit(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isxdigit(static_cast<int>(ch[0]));
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value IsxdigitL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = FALSE;
    char *ch = static_cast<char *>(malloc(sizeof(char) * length));
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = isxdigit_l(static_cast<int>(ch[0]), INPUT_VALUE_ZERO);
    napi_value result;
    if (retVal != FALSE) {
        napi_create_int32(env, TRUE, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value Toascii(napi_env env, napi_callback_info info)
{
    int c1 = 'a' + SIZE_128;
    char char_value = toascii(c1);
    napi_value result;
    napi_create_string_utf8(env, &char_value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Tolower(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        char ch = 'A';
        char result = tolower(ch);
        if (result == 'a') {
            resultValue = RETURN_0;
        }
    } else if (param == PARAM_1) {
        char ch = PARAM_2;
        char result = tolower(ch);
        if (result == ch) {
            resultValue = RETURN_0;
        }

    } else if (param == PARAM_2) {
        char ch = 'a';
        char result = tolower(ch);
        if (result == 'a') {
            resultValue = RETURN_0;
        }
    } else {
        char ch = '$';
        char result = tolower(ch);
        if (result == '$') {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value TolowerL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    locale_t locale = nullptr;

    int resultValue = FAILD;
    if (param == PARAM_0) {
        char ch = 'A';
        char result = tolower_l(ch, locale);
        if (result == 'a') {
            resultValue = RETURN_0;
        }
    } else if (param == PARAM_1) {
        char ch = PARAM_2;
        char result = tolower_l(ch, locale);
        if (result == ch) {
            resultValue = RETURN_0;
        }

    } else if (param == PARAM_2) {
        char ch = 'a';
        char result = tolower_l(ch, locale);
        if (result == 'a') {
            resultValue = RETURN_0;
        }
    } else {
        char ch = '$';
        char result = tolower_l(ch, locale);
        if (result == '$') {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Toupper(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;

    if (param == PARAM_0) {
        char ch = 'a';
        char result = toupper(ch);
        if (result == 'A') {
            resultValue = RETURN_0;
        }
    } else if (param == PARAM_1) {
        char ch = PARAM_2;
        char result = toupper(ch);
        if (result == ch) {
            resultValue = RETURN_0;
        }

    } else if (param == PARAM_2) {
        char ch = 'A';
        char result = toupper(ch);
        if (result == 'A') {
            resultValue = RETURN_0;
        }
    } else {
        char ch = '$';
        char result = toupper(ch);
        if (result == '$') {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value ToupperL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    locale_t locale = nullptr;
    int resultValue = FAILD;
    if (param == PARAM_0) {
        char ch = 'a';
        char result = toupper_l(ch, locale);
        if (result == 'A') {
            resultValue = RETURN_0;
        }
    } else if (param == PARAM_1) {
        char ch = PARAM_2;
        char result = toupper_l(ch, locale);
        if (result == ch) {
            resultValue = RETURN_0;
        }

    } else if (param == PARAM_2) {
        char ch = 'A';
        char result = toupper_l(ch, locale);
        if (result == 'A') {
            resultValue = RETURN_0;
        }
    } else {
        char ch = '$';
        char result = toupper_l(ch, locale);
        if (result == '$') {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"isalnum", nullptr, Isalnum, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isalnumL", nullptr, IsalnumL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isalpha", nullptr, Isalpha, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isalphaL", nullptr, IsalphaL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isascii", nullptr, Isascii, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isblank", nullptr, Isblank, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isblankL", nullptr, IsblankL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iscntrl", nullptr, Iscntrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iscntrlL", nullptr, IscntrlL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isdigit", nullptr, Isdigit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isdigitL", nullptr, IsdigitL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isgraph", nullptr, Isgraph, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isgraphL", nullptr, IsgraphL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"islower", nullptr, Islower, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"islowerL", nullptr, IslowerL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isprint", nullptr, Isprint, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isprintL", nullptr, IsprintL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ispunct", nullptr, Ispunct, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ispunctL", nullptr, IspunctL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isspace", nullptr, Isspace, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isspaceL", nullptr, IsspaceL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isupper", nullptr, Isupper, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isupperL", nullptr, IsupperL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isxdigit", nullptr, Isxdigit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isxdigitL", nullptr, IsxdigitL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"toascii", nullptr, Toascii, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tolower", nullptr, Tolower, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tolowerL", nullptr, TolowerL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"toupper", nullptr, Toupper, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"toupperL", nullptr, ToupperL, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "ctypendk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
