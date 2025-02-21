/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <unicode/uidna.h>

static napi_value TestUidna_openUTS46(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UIDNA *uts461 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    bool flagA = (uts461 != NULL);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_close(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UIDNA *uts461 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    uidna_close(uts461);
    bool flag = (uts461 != NULL);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_labelToASCII(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    static const UChar sharps16[] = {0x66, 0x41, 0xdf, 0};
    UChar dest16[10];
    UIDNAInfo info1 = UIDNA_INFO_INITIALIZER;
    int32_t capacity = 10;
    uidna_labelToASCII(uts46, sharps16, -1, dest16, capacity, &info1, &errorCode);
    bool flagA = (uts46 != NULL);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_labelToUnicode(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    static const UChar sharps[] = {0x66, 0x41, 0xc3, 0x9f, 0};
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;

    int32_t data1 = uidna_labelToUnicode(uts46, sharps, -1, NULL, -1, &plnfo, &errorCode1);
    bool flagA = (data1 == 0);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_nameToASCII(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    UChar dest16[10];
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;

    int32_t data1 = uidna_nameToASCII(uts46, NULL, -1, dest16, 0, &plnfo, &errorCode1);
    bool flagA = (data1 == 0);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_nameToUnicode(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    static const UChar sharps16[] = {0x66, 0x41, 0xdf, 0};
    int32_t length = -1;
    UChar dest16[10];
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;
    int32_t capacity = 3;

    int32_t data1 = uidna_nameToUnicode(uts46, sharps16, length, dest16, capacity, &plnfo, &errorCode1);
    bool flagA = (data1 > 0);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_labelToASCLL_UTF8(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    const char sharps[] = {0x66, 0x41, static_cast<char>(0xc3), static_cast<char>(0x9f), 0};
    int32_t length = -1;
    char dest = '\0';
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;
    int32_t capacity = 0;
    int32_t data1 = uidna_labelToASCII_UTF8(uts46, sharps, length, &dest, capacity, &plnfo, &errorCode1);
    bool flagA = (data1 > 0);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_labelToUnicodeUTF8(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    const char sharps[] = {0x66, 0x41, static_cast<char>(0xc3), static_cast<char>(0x9f), 0};
    int32_t length = -1;
    char dest = '\0';
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;
    int32_t capacity = 0;

    int32_t data1 = uidna_labelToUnicodeUTF8(uts46, sharps, length, &dest, capacity, &plnfo, &errorCode1);
    bool flagA = (data1 > 0);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_nameToASCII_UTF8(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    const char sharps[] = {0x66, 0x41, static_cast<char>(0xc3), static_cast<char>(0x9f), 0};
    int32_t length = -1;
    char dest = '\0';
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;
    int32_t capacity = 0;
    int32_t data1 = uidna_nameToASCII_UTF8(uts46, sharps, length, &dest, capacity, &plnfo, &errorCode1);
    bool flagA = (data1 > 0);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_nameToUnicodeUTF8(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    const char sharps[] = {0x66, 0x41, static_cast<char>(0xc3), static_cast<char>(0x9f), 0};
    int32_t length = -1;
    char dest = '\0';
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;
    int32_t capacity = 0;
    int32_t data1 = uidna_nameToUnicodeUTF8(uts46, sharps, length, &dest, capacity, &plnfo, &errorCode1);
    bool flagA = (data1 > 0);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testuidna_openUTS46", nullptr, TestUidna_openUTS46, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testuidna_close", nullptr, testUidna_close, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testuidna_labelToASCII", nullptr, testUidna_labelToASCII, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testuidna_labelToUnicode", nullptr, testUidna_labelToUnicode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testuidna_nameToASCII", nullptr, testUidna_nameToASCII, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testuidna_nameToUnicode", nullptr, testUidna_nameToUnicode, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"testuidna_labelToASCLL_UTF8", nullptr, testUidna_labelToASCLL_UTF8, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuidna_labelToUnicodeUTF8", nullptr, testUidna_labelToUnicodeUTF8, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuidna_nameToASCII_UTF8", nullptr, testUidna_nameToASCII_UTF8, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuidna_nameToUnicodeUTF8", nullptr, testUidna_nameToUnicodeUTF8, nullptr,
            nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
