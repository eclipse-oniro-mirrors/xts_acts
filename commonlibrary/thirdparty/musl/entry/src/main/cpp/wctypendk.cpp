/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use thisw file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * diswtributed under the License isw diswtributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permiswsions and
 * limitations under the License.
 */

#include <cwchar>
#include <cwctype>
#include <js_native_api.h>
#include <malloc.h>
#include <node_api.h>
#include <sys/select.h>

#define STRLENGTH 16
#define FAIL (-1)
#define NO_ERR 0
#define SUCCESS 1
#define FALSE 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
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

static napi_value Iswalnum(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswalnum((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != NO_ERR) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value IswalnumL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswalnum_l((wint_t) * (char16_t *)ch, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswalpha(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswalpha((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value IswalphaL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswalpha_l((wint_t) * (char16_t *)ch, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswblank(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswblank((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value IswblankL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswblank_l((wint_t) * (char16_t *)ch, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswcntrl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int retVal = iswcntrl(first);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value IswcntrlL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first;
    napi_get_value_int32(env, args[0], &first);
    int retVal = iswcntrl_l(first, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswdigit(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswdigit((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}
static napi_value IswdigitL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswdigit_l((wint_t) * (char16_t *)ch, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswgraph(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswgraph((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}
static napi_value IswgraphL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswgraph_l((wint_t) * (char16_t *)ch, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswlower(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswlower((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value IswlowerL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswlower_l((wint_t) * (char16_t *)ch, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswprint(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswprint((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value IswprintL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswprint_l((wint_t) * (char16_t *)ch, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswpunct(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswpunct((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value IswpunctL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswpunct_l((wint_t) * (char16_t *)ch, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswspace(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswspace((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}
static napi_value IswspaceL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswspace_l((wint_t) * (char16_t *)ch, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswupper(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswupper((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value IswupperL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswupper_l((wint_t) * (char16_t *)ch, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswctype(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char chFirst[length];
    char chSecond[length];
    napi_get_value_string_utf8(env, args[0], chFirst, length, &strResult);
    napi_get_value_string_utf8(env, args[1], chSecond, length, &strResult);
    int retVal = iswctype((wint_t) * (char16_t *)chFirst, wctype(chSecond));
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value IswctypeL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char chFirst[length];
    char chSecond[length];
    napi_get_value_string_utf8(env, args[0], chFirst, length, &strResult);
    napi_get_value_string_utf8(env, args[1], chSecond, length, &strResult);
    int retVal = iswctype_l((wint_t) * (char16_t *)chFirst, wctype(chSecond), PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Iswxdigit(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswxdigit((wint_t) * (char16_t *)ch);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value IswxdigitL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = STRLENGTH;
    size_t strResult = NO_ERR;
    char ch[length];
    napi_get_value_string_utf8(env, args[0], ch, length, &strResult);
    int retVal = iswxdigit_l((wint_t) * (char16_t *)ch, PARAM_0);
    napi_value result;
    if (retVal != PARAM_0) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    } else {
        napi_create_int32(env, FALSE, &result);
        return result;
    }
}

static napi_value Towctrans(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int towctrans_value = FAILD;

    if (param == PARAM_0) {
        wchar_t str[] = L"ABCD";
        wctrans_t trans = wctrans("tolower");
        for (int i = PARAM_0; i < wcslen(str); i++) {
            str[i] = towctrans(str[i], trans);
        }
        if (wcscmp(str, L"abcd") == PARAM_0) {
            towctrans_value = RETURN_0;
        }
    } else if (param == PARAM_1) {
        wchar_t str[] = L"abcd";
        wctrans_t trans = wctrans("toupper");
        for (int i = PARAM_0; i < wcslen(str); i++) {
            str[i] = towctrans(str[i], trans);
        }
        if (wcscmp(str, L"ABCD") == PARAM_0) {
            towctrans_value = RETURN_0;
        }
    } else {
        wchar_t str[] = L"Abcd";
        for (int i = PARAM_0; i < wcslen(str); i++) {
            str[i] = towctrans(str[i], PARAM_0);
        }
        if (wcscmp(str, L"Abcd") == PARAM_0) {
            towctrans_value = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, towctrans_value, &result);

    return result;
}

static napi_value TowctransL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int towctrans_l_value = FAILD;
    locale_t locale = nullptr;
    if (param == PARAM_0) {
        wchar_t str[] = L"ABCD";
        wctrans_t trans = wctrans("tolower");
        for (int i = PARAM_0; i < wcslen(str); i++) {
            str[i] = towctrans_l(str[i], trans, locale);
        }
        if (wcscmp(str, L"abcd") == PARAM_0) {
            towctrans_l_value = RETURN_0;
        }
    } else if (param == PARAM_1) {
        wchar_t str[] = L"abcd";
        wctrans_t trans = wctrans("toupper");
        for (int i = PARAM_0; i < wcslen(str); i++) {
            str[i] = towctrans_l(str[i], trans, locale);
        }
        if (wcscmp(str, L"ABCD") == PARAM_0) {
            towctrans_l_value = RETURN_0;
        }
    } else {
        wchar_t str[] = L"Abcd";
        for (int i = PARAM_0; i < wcslen(str); i++) {
            str[i] = towctrans_l(str[i], PARAM_0, locale);
        }
        if (wcscmp(str, L"Abcd") == PARAM_0) {
            towctrans_l_value = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, towctrans_l_value, &result);

    return result;
}

static napi_value TowlowerL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int towlowerLValue = FAILD;
    locale_t locale = nullptr;
    if (param == PARAM_0) {
        char ch = 'A';
        char result = towlower_l(ch, locale);
        if (result == 'a') {
            towlowerLValue = RETURN_0;
        }
    } else if (param == PARAM_1) {
        char ch = PARAM_2;
        char result = towlower_l(ch, locale);
        if (result == ch) {
            towlowerLValue = RETURN_0;
        }

    } else if (param == PARAM_2) {
        char ch = 'a';
        char result = towlower_l(ch, locale);
        if (result == 'a') {
            towlowerLValue = RETURN_0;
        }
    } else {
        char ch = '$';
        char result = towlower_l(ch, locale);
        if (result == '$') {
            towlowerLValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, towlowerLValue, &result);

    return result;
}

static napi_value TowupperL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int towupper_l_value = FAILD;
    locale_t local = nullptr;
    if (param == PARAM_0) {
        char ch = 'a';
        char result = towupper_l(ch, local);
        if (result == 'A') {
            towupper_l_value = RETURN_0;
        }
    } else if (param == PARAM_1) {
        char ch = PARAM_2;
        char result = towupper_l(ch, local);
        if (result == ch) {
            towupper_l_value = RETURN_0;
        }

    } else if (param == PARAM_2) {
        char ch = 'A';
        char result = towupper_l(ch, local);
        if (result == 'A') {
            towupper_l_value = RETURN_0;
        }
    } else {
        char ch = '$';
        char result = towupper_l(ch, local);
        if (result == '$') {
            towupper_l_value = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, towupper_l_value, &result);

    return result;
}

static napi_value Wctrans(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        if (wctrans("tolower")) {
            resultValue = RETURN_0;
        }
    } else {
        if (wctrans("toupper")) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value WctransL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    locale_t locale = nullptr;
    if (param == PARAM_0) {
        if (wctrans_l("tolower", locale)) {
            resultValue = RETURN_0;
        }
    } else {
        if (wctrans_l("toupper", locale)) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Wctype(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    if (param == PARAM_0) {
        wctype_t wt = wctype("alnum");
        int result = iswctype(L'1', wt);
        if (result == PARAM_1) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value WctypeL(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int resultValue = FAILD;
    locale_t locale = nullptr;
    if (param == PARAM_0) {
        wctype_t wt = wctype_l("alnum", locale);
        int result = iswctype_l(L'1', wt, locale);
        if (result == PARAM_1) {
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
        {"iswalnum", nullptr, Iswalnum, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswalnumL", nullptr, IswalnumL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswalpha", nullptr, Iswalpha, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswalphaL", nullptr, IswalphaL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswblank", nullptr, Iswblank, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswblankL", nullptr, IswblankL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswcntrl", nullptr, Iswcntrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswcntrlL", nullptr, IswcntrlL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswdigit", nullptr, Iswdigit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswdigitL", nullptr, IswdigitL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswgraph", nullptr, Iswgraph, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswgraphL", nullptr, IswgraphL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswlower", nullptr, Iswlower, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswlowerL", nullptr, IswlowerL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswprint", nullptr, Iswprint, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswprintL", nullptr, IswprintL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswpunct", nullptr, Iswpunct, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswpunctL", nullptr, IswpunctL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswspace", nullptr, Iswspace, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswspaceL", nullptr, IswspaceL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswupper", nullptr, Iswupper, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswupperL", nullptr, IswupperL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswctype", nullptr, Iswctype, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswctypeL", nullptr, IswctypeL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswxdigit", nullptr, Iswxdigit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iswxdigitL", nullptr, IswxdigitL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"towctrans", nullptr, Towctrans, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"towctransL", nullptr, TowctransL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"towlowerL", nullptr, TowlowerL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"towupperL", nullptr, TowupperL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wctrans", nullptr, Wctrans, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wctransL", nullptr, WctransL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wctype", nullptr, Wctype, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wctypeL", nullptr, WctypeL, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "dirent",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegiswterEntryModule(void) { napi_module_register(&demoModule); }
