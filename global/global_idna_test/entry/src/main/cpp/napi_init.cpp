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
#include <cstdio>
#include <string>
#include "unicode/ustring.h"
#include "unicode/utext.h"
#include "unicode/utypes.h"
#include "unicode/uloc.h"
#include "hilog/log.h"
#include <cstdint>

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
    const int32_t compareZero = 0;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    static const UChar sharps[] = {0x66, 0x41, 0xc3, 0x9f, 0};
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;

    int32_t data1 = uidna_labelToUnicode(uts46, sharps, -1, NULL, -1, &plnfo, &errorCode1);
    bool flagA = (data1 == compareZero);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_nameToASCII(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    const int32_t compareZero = 0;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    UChar dest16[10];
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;

    int32_t data1 = uidna_nameToASCII(uts46, NULL, -1, dest16, 0, &plnfo, &errorCode1);
    bool flagA = (data1 == compareZero);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_nameToUnicode(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    const int32_t compareZero = 0;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    static const UChar sharps16[] = {0x66, 0x41, 0xdf, 0};
    int32_t length = -1;
    UChar dest16[10];
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;
    int32_t capacity = 3;

    int32_t data1 = uidna_nameToUnicode(uts46, sharps16, length, dest16, capacity, &plnfo, &errorCode1);
    bool flagA = (data1 > compareZero);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_labelToASCLL_UTF8(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    const int32_t compareZero = 0;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    const char sharps[] = {0x66, 0x41, static_cast<char>(0xc3), static_cast<char>(0x9f), 0};
    int32_t length = -1;
    char dest = '\0';
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;
    int32_t capacity = 0;
    int32_t data1 = uidna_labelToASCII_UTF8(uts46, sharps, length, &dest, capacity, &plnfo, &errorCode1);
    bool flagA = (data1 > compareZero);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_labelToUnicodeUTF8(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    const int32_t compareZero = 0;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    const char sharps[] = {0x66, 0x41, static_cast<char>(0xc3), static_cast<char>(0x9f), 0};
    int32_t length = -1;
    char dest = '\0';
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;
    int32_t capacity = 0;

    int32_t data1 = uidna_labelToUnicodeUTF8(uts46, sharps, length, &dest, capacity, &plnfo, &errorCode1);
    bool flagA = (data1 > compareZero);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_nameToASCII_UTF8(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    const int32_t compareZero = 0;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    const char sharps[] = {0x66, 0x41, static_cast<char>(0xc3), static_cast<char>(0x9f), 0};
    int32_t length = -1;
    char dest = '\0';
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;
    int32_t capacity = 0;
    int32_t data1 = uidna_nameToASCII_UTF8(uts46, sharps, length, &dest, capacity, &plnfo, &errorCode1);
    bool flagA = (data1 > compareZero);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUidna_nameToUnicodeUTF8(napi_env env, napi_callback_info)
{
    UErrorCode errorCode = U_ZERO_ERROR;
    UErrorCode errorCode1 = U_ZERO_ERROR;
    const int32_t compareZero = 0;
    UIDNA *uts46 = uidna_openUTS46(UIDNA_USE_STD3_RULES | UIDNA_NONTRANSITIONAL_TO_UNICODE, &errorCode);
    const char sharps[] = {0x66, 0x41, static_cast<char>(0xc3), static_cast<char>(0x9f), 0};
    int32_t length = -1;
    char dest = '\0';
    UIDNAInfo plnfo = UIDNA_INFO_INITIALIZER;
    int32_t capacity = 0;
    int32_t data1 = uidna_nameToUnicodeUTF8(uts46, sharps, length, &dest, capacity, &plnfo, &errorCode1);
    bool flagA = (data1 > compareZero);
    bool flag = (flagA & U_SUCCESS(errorCode));
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_openUTF8(napi_env env, napi_callback_info)
{
    const char *uSting = "\x41\xc3\x85\x5A\x20\x41\x52\x69\x6E\x67";
    UErrorCode status = U_ZERO_ERROR;
    UText *ut = utext_openUTF8(NULL, uSting, -1, &status);
    utext_close(ut);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_openUTF8_close(napi_env env, napi_callback_info)
{
    UChar testStr[] = {0x20, 0x41, 0x20, 0x42, 0x20, 0x43, 0x20, 0x44, 0x0};
    UErrorCode status = U_ZERO_ERROR;
    UText *ut = utext_openUChars(NULL, testStr, -1, &status);
    utext_close(ut);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_clone(napi_env env, napi_callback_info)
{
    UChar testStr[] = {0x20, 0x41, 0x20, 0x42, 0x20, 0x43, 0x20, 0x44, 0x0};
    UErrorCode status = U_ZERO_ERROR;
    UText *uta = utext_openUChars(NULL, testStr, -1, &status);
    bool flagA = U_FAILURE(status);
    UText *utb = utext_clone(NULL, uta, false, false, &status);
    bool flagB = U_FAILURE(status);
    utext_close(uta);
    utext_close(utb);
    
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_equals(napi_env env, napi_callback_info)
{
    UErrorCode status = U_ZERO_ERROR;
    const UChar *charS = u"aßカ🚲";
    UText *utOne = utext_openUChars(NULL, charS, -1, &status);
    UText *utTwo = utext_openUChars(NULL, charS, 5, &status);
    bool flagA = U_FAILURE(status);
    bool flagB = !utext_equals(utOne, utTwo);
    utext_close(utOne);
    utext_close(utTwo);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_nativeLength(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    UErrorCode status = U_ZERO_ERROR;
    int64_t len;
    const int32_t stringLen = 3;
    UText *uta = utext_openUChars(NULL, uString, -1, &status);
    bool flagA = U_FAILURE(status);
    len = utext_nativeLength(uta);
    bool flagB = (len != stringLen);
    utext_close(uta);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_char32At(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    UErrorCode status = U_ZERO_ERROR;
    UText *uta = utext_openUChars(NULL, uString, -1, &status);
    bool flagA = U_FAILURE(status);
    UChar32 charC = utext_char32At(uta, 0);
    bool flagB = (charC != uString[0]);
    utext_close(uta);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_current32(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    UErrorCode status = U_ZERO_ERROR;
    UText *uta = utext_openUChars(NULL, uString, -1, &status);
    bool flagA = U_FAILURE(status);
    UChar32 testChar = utext_current32(uta);
    bool flagB = (testChar != uString[0]);
    utext_close(uta);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_next32(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    UErrorCode status = U_ZERO_ERROR;
    UText *uta = utext_openUChars(NULL, uString, -1, &status);
    bool flagA = U_FAILURE(status);
    UChar32 nextC = utext_next32(uta);
    bool flagB = (nextC != uString[0]);
    utext_close(uta);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_previous32(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    UErrorCode status = U_ZERO_ERROR;
    UText *uta = utext_openUChars(NULL, uString, -1, &status);
    bool flagA = U_FAILURE(status);
    UChar32 previousC = utext_next32(uta);
    previousC = utext_previous32(uta);
    bool flagB = (previousC != uString[0]);
    utext_close(uta);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_next32From(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    UErrorCode status = U_ZERO_ERROR;
    UText *uta = utext_openUChars(NULL, uString, -1, &status);
    bool flagA = U_FAILURE(status);
    UChar32 nextFromC = utext_next32From(uta, 1);
    bool flagB = (nextFromC != uString[1]);
    utext_close(uta);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_previous32From(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    UErrorCode status = U_ZERO_ERROR;
    UText *uta = utext_openUChars(NULL, uString, -1, &status);
    bool flagA = U_FAILURE(status);
    UChar32 previousC = utext_previous32From(uta, 2);
    bool flagB = (previousC != uString[1]);
    utext_close(uta);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_getNativeIndex(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    UErrorCode status = U_ZERO_ERROR;
    const int32_t compare = 1;
    UText *uta = utext_openUChars(NULL, uString, -1, &status);
    bool flagA = U_FAILURE(status);
    UChar32 previousC = utext_previous32From(uta, 2);
    int64_t getNativeIndexI = utext_getNativeIndex(uta);
    bool flagB = (getNativeIndexI != compare);
    utext_close(uta);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_setNativeIndex_moveIndex32(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    UErrorCode status = U_ZERO_ERROR;
    const int32_t compare = 1;
    UText *uta = utext_openUChars(NULL, uString, -1, &status);
    bool flagA = U_FAILURE(status);
    utext_setNativeIndex(uta, 0);
    UBool moveIndexB = utext_moveIndex32(uta, 1);
    int64_t getNativeIndexI = utext_getNativeIndex(uta);
    bool flagB = (moveIndexB != true || getNativeIndexI != compare);
    utext_close(uta);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_getPreviousNativeIndex(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    const int32_t compareZero = 0;
    UErrorCode status = U_ZERO_ERROR;
    UText *uta = utext_openUChars(NULL, uString, -1, &status);
    bool flagA = U_FAILURE(status);
    UBool moveIndexB = utext_moveIndex32(uta, 1);
    int64_t getPreviousNativeIndexI = utext_getPreviousNativeIndex(uta);
    bool flagB = (getPreviousNativeIndexI != compareZero);
    utext_close(uta);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUtext_extract(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    UErrorCode status = U_ZERO_ERROR;
    UText *uta;
    UChar groupBuf[20];
    uta = utext_openUChars(NULL, uString, -1, &status);
    bool flagA = U_FAILURE(status);
    utext_extract(uta, 0 /*start index */, 0 + 1 /*limit index*/, groupBuf, sizeof(groupBuf), &status);
    UBool moveIndexB = utext_moveIndex32(uta, 1);
    int64_t getPreviousNativeIndexI = utext_getPreviousNativeIndex(uta);
    bool flagB = U_FAILURE(status);
    utext_close(uta);
    bool flag = (flagA || flagB);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strlen(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 3;
    int32_t len = u_strlen(uString);
    bool flag = (len != stringLen);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_countChar32(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 3;
    int32_t len = u_countChar32(uString, -1);
    bool flag = (len != stringLen);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strHasMoreChar32Than(napi_env env, napi_callback_info)
{
    UChar uString[] = {0x41, 0x42, 0x43, 0};
    UBool ThanB = u_strHasMoreChar32Than(uString, -1, 1);
    bool flag = (ThanB != true);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strcat(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0, 0, 0, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0};
    const int32_t stringLen = 5;
    u_strcat(uStringOne, uStringTwo);
    int32_t len = u_strlen(uStringOne);
    bool flag = (len != stringLen);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strncat(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0, 0, 0, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0};
    const int32_t catLen = 2;
    const int32_t stringLen = 5;
    u_strncat(uStringOne, uStringTwo, catLen);
    int32_t len = u_strlen(uStringOne);
    bool flag = (len != stringLen);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strstr(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x44, 0x44, 0};
    UChar *resultA = u_strstr(uStringOne, uStringTwo);
    bool flag = (resultA != NULL);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strFindFirst(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x44, 0x44, 0};
    UChar *resultA = u_strFindFirst(uStringOne, -1, uStringTwo, 2);
    bool flag = (resultA != NULL);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strchr(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo = 0x44;
    UChar *resultA = u_strchr(uStringOne, uStringTwo);
    bool flag = (resultA != NULL);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strchr32(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo = 0x44;
    UChar *resultA = u_strchr32(uStringOne, uStringTwo);
    bool flag = (resultA != NULL);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strrstr(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x44, 0x44, 0};
    UChar *resultA = u_strrstr(uStringOne, uStringTwo);
    bool flag = (resultA != NULL);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strFindLast(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x44, 0x44, 0};
    UChar *resultA = u_strFindLast(uStringOne, -1, uStringTwo, 2);
    bool flag = (resultA != NULL);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strrchr(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar test = 0x44;
    UChar *resultA = u_strrchr(uStringOne, test);
    bool flag = false;
    if (resultA == NULL) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strrchr32(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar32 test = 0x44;
    UChar *resultA = u_strrchr32(uStringOne, test);
    bool flag = false;
    if (resultA == NULL) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strpbrk(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar test[] = {0x44, 0};
    UChar *resultA = u_strpbrk(uStringOne, test);
    bool flag = false;
    if (resultA == NULL) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strcspn(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar test[] = {0x44, 0};
    const int32_t stringLen = 3;
    int32_t resultA = u_strcspn(uStringOne, test);
    bool flag = false;
    if (resultA == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strspn(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar test[] = {0x44, 0};
    const int32_t stringLen = 0;
    int32_t resultA = u_strspn(uStringOne, test);
    bool flag = false;
    if (resultA == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strtok_r(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar del[] = {0x42, 0};
    UChar *state;
    const UChar compare = 0x43;
    UChar *resultA = u_strtok_r(uStringOne, del, &state);
    resultA = u_strtok_r(NULL, del, &state);
    bool flag = false;
    if (*resultA == compare) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strcmp(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 0;
    int32_t test = u_strcmp(uStringOne, uStringTwo);
    bool flag = false;
    if (test == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strcmpCodePointOrder(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 0;
    int32_t test = u_strcmpCodePointOrder(uStringOne, uStringTwo);
    bool flag = false;
    if (test == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strCompare(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 0;
    int32_t test = u_strCompare(uStringOne, 2, uStringTwo, 2, false);
    bool flag = false;
    if (test == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strCaseCompare(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    UErrorCode status = U_ZERO_ERROR;
    const int32_t stringLen = 0;
    int32_t test = u_strCaseCompare(uStringOne, 2, uStringTwo, 2, U_FOLD_CASE_DEFAULT, &status);
    bool flag = false;
    if (test == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strncmp(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 0;
    int32_t test = u_strncmp(uStringOne, uStringTwo, 2);
    bool flag = false;
    if (test == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strncmpCodePointOrder(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 0;
    int32_t test = u_strncmpCodePointOrder(uStringOne, uStringTwo, 2);
    bool flag = false;
    if (test == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strcasecmp(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 0;
    int32_t test = u_strcasecmp(uStringOne, uStringTwo, U_FOLD_CASE_DEFAULT);
    bool flag = false;
    if (test == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strncasecmp(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 0;
    int32_t test = u_strncasecmp(uStringOne, uStringTwo, 2, U_FOLD_CASE_DEFAULT);
    bool flag = false;
    if (test == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_memcasecmp(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 0;
    int32_t test = u_memcasecmp(uStringOne, uStringTwo, 2, U_FOLD_CASE_DEFAULT);
    bool flag = false;
    if (test == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strcpy(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0};
    const int32_t stringLen = 2;
    u_strcpy(uStringOne, uStringTwo);
    bool flag = false;
    if (u_strlen(uStringOne) == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strncpy(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0};
    const int32_t stringLen = 2;
    const int32_t compareLen = 3;
    u_strncpy(uStringOne, uStringTwo, stringLen);
    bool flag = false;
    if (u_strlen(uStringOne) == compareLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_memcpy(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0};
    const int32_t stringLen = 2;
    const int32_t compareLen = 3;
    u_memcpy(uStringOne, uStringTwo, stringLen);
    bool flag = false;
    if (u_strlen(uStringOne) == compareLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_memmove(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0};
    const int32_t stringLen = 2;
    const int32_t compareLen = 3;
    u_memmove(uStringOne, uStringTwo, stringLen);
    bool flag = false;
    if (u_strlen(uStringOne) == compareLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_memset(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar testChar = 0x41;
    const int32_t stringLen = 2;
    u_memset(uStringOne, testChar, stringLen);
    bool flag = false;
    if (uStringOne[0] == testChar) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_memcmp(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 0;
    int32_t test = u_memcmp(uStringOne, uStringTwo, 2);
    bool flag = false;
    if (test == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_memcmpCodePointOrder(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const int32_t stringLen = 0;
    int32_t test = u_memcmpCodePointOrder(uStringOne, uStringTwo, 2);
    bool flag = false;
    if (test == stringLen) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_memchr(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar testChar = 0x44;
    UChar *resultA = u_memchr(uStringOne, testChar, 3);
    bool flag = false;
    if (resultA == NULL) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_memchr32(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar32 testChar = 0x44;
    UChar *resultA = u_memchr32(uStringOne, testChar, 3);
    bool flag = false;
    if (resultA == NULL) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_memrchr(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar testChar = 0x44;
    UChar *resultA = u_memrchr(uStringOne, testChar, 3);
    bool flag = false;
    if (resultA == NULL) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_memrchr32(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar32 testChar = 0x44;
    UChar *resultA = u_memrchr32(uStringOne, testChar, 3);
    bool flag = false;
    if (resultA == NULL) {
        flag = true;
    }
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strToUpper(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x61, 0x42, 0x43, 0};
    const char *local = "en";
    const int32_t uStringSize = 3;
    UErrorCode status = U_ZERO_ERROR;
    u_strToUpper(uStringOne, uStringSize, uStringTwo, uStringSize, local, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strToLower(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const char *local = "en";
    const int32_t uStringSize = 3;
    UErrorCode status = U_ZERO_ERROR;
    u_strToLower(uStringOne, uStringSize, uStringTwo, uStringSize, local, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strToTitle(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x41, 0x42, 0x43, 0};
    const char *local = "en";
    const int32_t uStringSize = 3;
    UErrorCode status = U_ZERO_ERROR;
    u_strToTitle(uStringOne, uStringSize, uStringTwo, uStringSize, NULL, local, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strFoldCase(napi_env env, napi_callback_info)
{
    UChar uStringOne[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x61, 0x42, 0x43, 0};
    const char *local = "en";
    const int32_t uStringSize = 3;
    UErrorCode status = U_ZERO_ERROR;
    u_strFoldCase(uStringOne, uStringSize, uStringTwo, uStringSize, U_FOLD_CASE_DEFAULT, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strToUTF8(napi_env env, napi_callback_info)
{
    char dst[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x61, 0};
    UErrorCode status = U_ZERO_ERROR;
    int32_t dstLength;
    const int32_t dstSize = 3;
    const int32_t uStringTwoSize = 1;
    u_strToUTF8(dst, dstSize, &dstLength, uStringTwo, uStringTwoSize, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strFromUTF8(napi_env env, napi_callback_info)
{
    char dst[] = {0x41, 0};
    UChar uStringTwo[] = {0x61, 0x41, 0};
    UErrorCode status = U_ZERO_ERROR;
    int32_t dstLength;
    const int32_t dstSize = 2;
    const int32_t uStringTwoSize = 1;
    u_strFromUTF8(uStringTwo, dstSize, &dstLength, dst, uStringTwoSize, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strToUTF8WithSub(napi_env env, napi_callback_info)
{
    char dst[] = {0x41, 0x42, 0x43, 0};
    UChar uStringTwo[] = {0x61, 0};
    UChar subChar = 0x40;
    UErrorCode status = U_ZERO_ERROR;
    int32_t dstLength;
    int32_t subCount;
    const int32_t dstSize = 3;
    const int32_t uStringTwoSize = 1;
    u_strToUTF8WithSub(dst, dstSize, &dstLength, uStringTwo, uStringTwoSize, subChar, &subCount, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strFromUTF8WithSub(napi_env env, napi_callback_info)
{
    char dst[] = {0x41, 0};
    UChar uStringTwo[] = {0x61, 0x41, 0};
    UChar subChar = 0x40;
    UErrorCode status = U_ZERO_ERROR;
    int32_t dstLength;
    int32_t subCount;
    const int32_t dstSize = 2;
    const int32_t uStringTwoSize = 1;
    u_strFromUTF8WithSub(uStringTwo, dstSize, &dstLength, dst, uStringTwoSize, subChar, &subCount, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strFromUTF8Lenient(napi_env env, napi_callback_info)
{
    char dst[] = {0x41, 0};
    UChar uStringTwo[] = {0x61, 0x41, 0};
    UErrorCode status = U_ZERO_ERROR;
    int32_t dstLength;
    const int32_t dstSize = 2;
    const int32_t uStringTwoSize = 1;
    u_strFromUTF8Lenient(uStringTwo, dstSize, &dstLength, dst, uStringTwoSize, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strToUTF32(napi_env env, napi_callback_info)
{
    UChar32 dst[] = {0x61, 0x41, 0};
    UChar uStringTwo[] = {0x61, 0};
    UErrorCode status = U_ZERO_ERROR;
    int32_t dstLength;
    const int32_t dstSize = 2;
    const int32_t uStringTwoSize = 1;
    u_strToUTF32(dst, dstSize, &dstLength, uStringTwo, uStringTwoSize, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strFromUTF32(napi_env env, napi_callback_info)
{
    UChar dst[] = {0x61, 0x41, 0};
    UChar32 uStringTwo[] = {0x61, 0};
    UErrorCode status = U_ZERO_ERROR;
    int32_t dstLength;
    const int32_t dstSize = 2;
    const int32_t uStringTwoSize = 1;
    u_strFromUTF32(dst, dstSize, &dstLength, uStringTwo, uStringTwoSize, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strToUTF32WithSub(napi_env env, napi_callback_info)
{
    UChar32 dst[] = {0x61, 0x41, 0};
    UChar uStringTwo[] = {0x61, 0};
    UErrorCode status = U_ZERO_ERROR;
    int32_t dstLength;
    UChar subChar = 0x40;
    int32_t subCount;
    const int32_t dstSize = 2;
    const int32_t uStringTwoSize = 1;
    u_strToUTF32WithSub(dst, dstSize, &dstLength, uStringTwo, uStringTwoSize, subChar, &subCount, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_strFromUTF32WithSub(napi_env env, napi_callback_info)
{
    UChar dst[] = {0x61, 0x41, 0};
    UChar32 uStringTwo[] = {0x61, 0};
    UErrorCode status = U_ZERO_ERROR;
    int32_t dstLength;
    UChar subChar = 0x40;
    int32_t subCount;
    const int32_t dstSize = 2;
    const int32_t uStringTwoSize = 1;
    u_strFromUTF32WithSub(dst, dstSize, &dstLength, uStringTwo, uStringTwoSize, subChar, &subCount, &status);
    bool flag = U_FAILURE(status);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testU_errorName(napi_env env, napi_callback_info)
{
    const char *resultA = u_errorName(U_ZERO_ERROR);
    bool flag = false;
    if (resultA != nullptr) {
        flag = true;
    }
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
        {"testutext_openUTF8", nullptr, testUtext_openUTF8, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_openUTF8_close", nullptr, testUtext_openUTF8_close, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_clone", nullptr, testUtext_clone, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_equals", nullptr, testUtext_equals, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_nativeLength", nullptr, testUtext_nativeLength, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_char32At", nullptr, testUtext_char32At, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_current32", nullptr, testUtext_current32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_next32", nullptr, testUtext_next32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_previous32", nullptr, testUtext_previous32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_next32From", nullptr, testUtext_next32From, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_previous32From", nullptr, testUtext_previous32From, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_getNativeIndex", nullptr, testUtext_getNativeIndex, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_setNativeIndex_moveIndex32", nullptr, testUtext_setNativeIndex_moveIndex32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_getPreviousNativeIndex", nullptr, testUtext_getPreviousNativeIndex, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutext_extract", nullptr, testUtext_extract, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strlen", nullptr, testU_strlen, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_countChar32", nullptr, testU_countChar32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strHasMoreChar32Than", nullptr, testU_strHasMoreChar32Than, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strcat", nullptr, testU_strcat, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strncat", nullptr, testU_strncat, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strstr", nullptr, testU_strstr, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strFindFirst", nullptr, testU_strFindFirst, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strchr", nullptr, testU_strchr, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strchr32", nullptr, testU_strchr32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strrstr", nullptr, testU_strrstr, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strFindLast", nullptr, testU_strFindLast, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strrchr", nullptr, testU_strrchr, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strrchr32", nullptr, testU_strrchr32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strpbrk", nullptr, testU_strpbrk, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strcspn", nullptr, testU_strcspn, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strspn", nullptr, testU_strspn, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strtok_r", nullptr, testU_strtok_r, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strcmp", nullptr, testU_strcmp, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strcmpCodePointOrder", nullptr, testU_strcmpCodePointOrder, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strCompare", nullptr, testU_strCompare, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strCaseCompare", nullptr, testU_strCaseCompare, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strncmp", nullptr, testU_strncmp, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strncmpCodePointOrder", nullptr, testU_strncmpCodePointOrder, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strcasecmp", nullptr, testU_strcasecmp, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strncasecmp", nullptr, testU_strncasecmp, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_memcasecmp", nullptr, testU_memcasecmp, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strcpy", nullptr, testU_strcpy, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strncpy", nullptr, testU_strncpy, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_memcpy", nullptr, testU_memcpy, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_memmove", nullptr, testU_memmove, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_memset", nullptr, testU_memset, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_memcmp", nullptr, testU_memcmp, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_memcmpCodePointOrder", nullptr, testU_memcmpCodePointOrder, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_memchr", nullptr, testU_memchr, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_memchr32", nullptr, testU_memchr32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_memrchr", nullptr, testU_memrchr, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_memrchr32", nullptr, testU_memrchr32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strToUpper", nullptr, testU_strToUpper, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strToLower", nullptr, testU_strToLower, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strToTitle", nullptr, testU_strToTitle, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strFoldCase", nullptr, testU_strFoldCase, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strToUTF8", nullptr, testU_strToUTF8, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strFromUTF8", nullptr, testU_strFromUTF8, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strToUTF8WithSub", nullptr, testU_strToUTF8WithSub, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strFromUTF8WithSub", nullptr, testU_strFromUTF8WithSub, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strFromUTF8Lenient", nullptr, testU_strFromUTF8Lenient, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strToUTF32", nullptr, testU_strToUTF32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strFromUTF32", nullptr, testU_strFromUTF32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strToUTF32WithSub", nullptr, testU_strToUTF32WithSub, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_strFromUTF32WithSub", nullptr, testU_strFromUTF32WithSub, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_errorName", nullptr, testU_errorName, nullptr,
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
