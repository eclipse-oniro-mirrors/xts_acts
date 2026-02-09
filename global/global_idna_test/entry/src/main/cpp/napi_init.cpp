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
#include "hilog/log.h"
#include "unicode/ubrk.h"
#include "unicode/ustring.h"
#include "unicode/uversion.h"
#include "unicode/uldnames.h"
#include "unicode/udisplaycontext.h"
#include "unicode/uchar.h"
#include "unicode/ulocdata.h"
#include "unicode/utf.h"
#include "unicode/utf8.h"
#include "unicode/utf16.h"
#include "unicode/ucpmap.h"
#include "unicode/uchar.h"
#include "i18n/timezone.h"
#include "i18n/errorcode.h"



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

static napi_value testUbrk_setUText_0100(napi_env env, napi_callback_info info)
{
    UChar s1[] = {0x41, 0x42, 0x20, 1};
    UText *ut = nullptr;
    UBreakIterator *bb = nullptr;
    int nber;
    const char *test = "zh_CN";
    UErrorCode icu_status = U_ZERO_ERROR;
    bb = ubrk_open(UBRK_WORD, test, NULL, 0, &icu_status);
    ut = utext_openUChars(ut, s1, -1, &icu_status);
    ubrk_setUText(bb, ut, &icu_status);
    nber = ubrk_next(bb);
    bool flag = (nber == 2);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    ubrk_close(bb);
    utext_close(ut);
    return result;
}

static napi_value testUbrk_setUText_0200(napi_env env, napi_callback_info info)
{
    UChar s1[] = {0x41, 0x42, 0x43, 0x44, 0x45, 0};
    UText *ut = nullptr;
    UBreakIterator *bb = nullptr;
    int nber;
    const char *test = "zh_CN";
    UErrorCode icu_status = U_ZERO_ERROR;
    bb = ubrk_open(UBRK_WORD, test, NULL, 0, &icu_status);
    ut = utext_openUChars(ut, s1, -1, &icu_status);
    ubrk_setUText(bb, ut, &icu_status);
    nber = ubrk_next(bb);
    bool flag = (nber == 5);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    ubrk_close(bb);
    utext_close(ut);
    return result;
}

static napi_value testUbrk_setUText_0300(napi_env env, napi_callback_info info)
{
    UChar s1[] = u"He's from";
    UText *ut = nullptr;
    UBreakIterator *bb = nullptr;
    int nber;
    const char *test = "zh_CN";
    UErrorCode icu_status = U_ZERO_ERROR;
    bb = ubrk_open(UBRK_WORD, test, NULL, 0, &icu_status);
    ut = utext_openUChars(ut, s1, -1, &icu_status);
    ubrk_setUText(bb, ut, &icu_status);
    nber = ubrk_next(bb);
    bool flag = (nber == 4);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    ubrk_close(bb);
    utext_close(ut);
    return result;
}

static napi_value testUbrk_setUText_0400(napi_env env, napi_callback_info info)
{
    UChar s1[] = u"Couldn't open";
    UText *ut = nullptr;
    UBreakIterator *bb = nullptr;
    int nber;
    const char *test = "zh_CN";
    UErrorCode icu_status = U_ZERO_ERROR;
    bb = ubrk_open(UBRK_WORD, test, NULL, 0, &icu_status);
    ut = utext_openUChars(ut, s1, -1, &icu_status);
    ubrk_setUText(bb, ut, &icu_status);
    nber = ubrk_next(bb);
    bool flag = (nber == 8);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    ubrk_close(bb);
    utext_close(ut);
    return result;
}

static napi_value testUbrk_setUText_0500(napi_env env, napi_callback_info info)
{
    UChar s1[] = u"Cloned Iterator failed";
    UText *ut = nullptr;
    UBreakIterator *bb = nullptr;
    int nber;
    const char *test = "zh_CN";
    UErrorCode icu_status = U_ZERO_ERROR;
    bb = ubrk_open(UBRK_WORD, test, NULL, 0, &icu_status);
    ut = utext_openUChars(ut, s1, -1, &icu_status);
    ubrk_setUText(bb, ut, &icu_status);
    nber = ubrk_next(bb);
    bool flag = (nber == 6);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    ubrk_close(bb);
    utext_close(ut);
    return result;
}

static napi_value testUbrk_setUText_0600(napi_env env, napi_callback_info info)
{
    UChar s1[] = u"";
    UText *ut = nullptr;
    UBreakIterator *bb = nullptr;
    int nber;
    const char *test = "zh_CN";
    UErrorCode icu_status = U_ZERO_ERROR;
    bb = ubrk_open(UBRK_WORD, test, NULL, 0, &icu_status);
    ut = utext_openUChars(ut, s1, -1, &icu_status);
    ubrk_setUText(bb, ut, &icu_status);
    nber = ubrk_next(bb);
    bool flag = (nber == -1);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    ubrk_close(bb);
    utext_close(ut);
    return result;
}

static napi_value testUbrk_setUText_0700(napi_env env, napi_callback_info info)
{
    UChar s1[] = u"马到成功";
    UText *ut = nullptr;
    UBreakIterator *bb = nullptr;
    int nber;
    const char *test = "zh_CN";
    UErrorCode icu_status = U_ZERO_ERROR;
    bb = ubrk_open(UBRK_WORD, test, NULL, 0, &icu_status);
    ut = utext_openUChars(ut, s1, -1, &icu_status);
    ubrk_setUText(bb, ut, &icu_status);
    nber = ubrk_next(bb);
    bool flag = (nber == 4);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    ubrk_close(bb);
    utext_close(ut);
    return result;
}

static napi_value testUbrk_setUText_0800(napi_env env, napi_callback_info info)
{
    UChar s1[] = u"不知道我的国家";
    UText *ut = nullptr;
    UBreakIterator *bb = nullptr;
    int nber;
    const char *test = "zh_CN";
    UErrorCode icu_status = U_ZERO_ERROR;
    bb = ubrk_open(UBRK_WORD, test, NULL, 0, &icu_status);
    ut = utext_openUChars(ut, s1, -1, &icu_status);
    ubrk_setUText(bb, ut, &icu_status);
    nber = ubrk_next(bb);
    bool flag = (nber == 3);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    ubrk_close(bb);
    utext_close(ut);
    return result;
}

static napi_value testUbrk_setUText_0900(napi_env env, napi_callback_info info)
{
    UChar s1[] = u"我的国家";
    UText *ut = nullptr;
    UBreakIterator *bb = nullptr;
    int nber;
    const char *test = "zh_CN";
    UErrorCode icu_status = U_ZERO_ERROR;
    bb = ubrk_open(UBRK_WORD, test, NULL, 0, &icu_status);
    ut = utext_openUChars(ut, s1, -1, &icu_status);
    ubrk_setUText(bb, ut, &icu_status);
    nber = ubrk_next(bb);
    bool flag = (nber == 2);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    ubrk_close(bb);
    utext_close(ut);
    return result;
}

static napi_value testUbrk_setUText_1000(napi_env env, napi_callback_info info)
{
    UChar s1[] = u"我我我我我";
    UText *ut = nullptr;
    UBreakIterator *bb = nullptr;
    int nber;
    const char *test = "zh_CN";
    UErrorCode icu_status = U_ZERO_ERROR;
    bb = ubrk_open(UBRK_WORD, test, NULL, 0, &icu_status);
    ut = utext_openUChars(ut, s1, -1, &icu_status);
    ubrk_setUText(bb, ut, &icu_status);
    nber = ubrk_next(bb);
    bool flag = (nber == 1);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    ubrk_close(bb);
    utext_close(ut);
    return result;
}

static napi_value testUbrk_clone_0100(napi_env env, napi_callback_info info)
{
    const UChar text[] = u"He's form Africa.Mr. Livingston, I presume? Yeah";
    UBreakIterator *someUterators[2];
    UBreakIterator *brk;
    UErrorCode status = U_ZERO_ERROR;
    int32_t pos;
    const char *test = "en_US";
    someUterators[0] = ubrk_open(UBRK_WORD, test, text, u_strlen(text), &status);
    brk = ubrk_clone(someUterators[0], &status);
    pos = ubrk_next(brk);
    bool flag = (pos == 4);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUbrk_clone_0200(napi_env env, napi_callback_info info)
{
    const UChar text[] = u"He's form Africa.Mr. Livingston, I presume? Yeah";
    UBreakIterator *someUterators[2];
    UBreakIterator *brk;
    UBreakIterator *brk2;
    UBreakIterator *brk3;
    UErrorCode status = U_ZERO_ERROR;
    int32_t pos;
    int32_t pos2;
    int32_t pos3;
    const char *test = "en_US";
    someUterators[0] = ubrk_open(UBRK_WORD, test, text, u_strlen(text), &status);
    brk = ubrk_clone(someUterators[0], &status);
    pos = ubrk_next(brk);
    brk2 = ubrk_clone(brk, &status);
    pos2 = ubrk_current(brk2);
    brk3 = ubrk_clone(brk2, &status);
    pos3 = ubrk_next(brk3);
    bool flagA = (pos == 4);
    bool flagB = (pos2 == 4);
    bool flagC = (pos3 == 5);
    bool flag = (flagA & flagB & flagC);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}

static napi_value testUbrk_clone_0300(napi_env env, napi_callback_info info)
{
    const UChar text[] = u"";
    UBreakIterator *someUterators[2];
    UBreakIterator *brk;
    UErrorCode status = U_ZERO_ERROR;
    int32_t pos;
    const char *test = "en_US";
    someUterators[0] = ubrk_open(UBRK_WORD, test, text, u_strlen(text), &status);
    brk = ubrk_clone(someUterators[0], &status);
    pos = ubrk_next(brk);
    bool flag = (pos == -1);
    napi_value result = nullptr;
    napi_get_boolean(env, flag, &result);
    return result;
}


static napi_value testU_getUnicodeVersion(napi_env env, napi_callback_info info)
{
    UVersionInfo uniVersion = {0, 0, 0, 0};
    u_getUnicodeVersion(uniVersion);
    bool flag = (uniVersion[0] != 0);
    napi_value result;
    napi_status status = napi_get_boolean(env, flag, &result);
    if (status != napi_ok) {
        return nullptr;
    }
    return result;
}

static napi_value testU_charAge(napi_env env, napi_callback_info info)
{
    UVersionInfo uniVersion = {7, 2, 0, 0};
    UChar32 ch = 0;
    u_charAge(ch, uniVersion);
    bool flag = (ch == 0);
    napi_value result;
    napi_status status = napi_get_boolean(env, flag, &result);
    if (status != napi_ok) {
        return nullptr;
    }
    return result;
}

static napi_value testuldn_localeDisplayName(napi_env env, napi_callback_info info)
{
    UErrorCode status = U_ZERO_ERROR;
    const int32_t kMaxResultSize = 150;
    UChar result[150];
    ULocaleDisplayNames *ldn = uldn_open("de_DE", ULDN_STANDARD_NAMES, &status);
    int32_t len = uldn_localeDisplayName(ldn, "de_DE", result, kMaxResultSize, &status);
    uldn_close(ldn);
    bool flag = (len > 7);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testUldn_getLocale(napi_env env, napi_callback_info info)
{
    UErrorCode status = U_ZERO_ERROR;
    ULocaleDisplayNames *ldn = uldn_open(NULL, ULDN_STANDARD_NAMES, &status);
    const char* locale = uldn_getLocale(ldn);
    uldn_close(ldn);
    bool flag = (locale != nullptr);
    napi_value result;
    napi_status nStatus = napi_get_boolean(env, flag, &result);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return result;
}

static napi_value testUldn_getDialectHandling(napi_env env, napi_callback_info info)
{
    UErrorCode status = U_ZERO_ERROR;
    ULocaleDisplayNames *ldn = uldn_open(NULL, ULDN_STANDARD_NAMES, &status);
    UDialectHandling uDialectHandling = uldn_getDialectHandling(ldn);
    uldn_close(ldn);
    bool flag = (uDialectHandling == UDialectHandling::ULDN_STANDARD_NAMES);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testuldn_languageDisplayName(napi_env env, napi_callback_info info)
{
    UErrorCode status = U_ZERO_ERROR;
    const int32_t kMaxResultSize = 150;
    UChar result[150];
    ULocaleDisplayNames *ldn = uldn_open("de_DE", ULDN_STANDARD_NAMES, &status);
    uldn_languageDisplayName(ldn, "en", result, kMaxResultSize, &status);
    uldn_close(ldn);
    bool flag = U_SUCCESS(status);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testuldn_scriptDisplayName(napi_env env, napi_callback_info info)
{
    UErrorCode status = U_ZERO_ERROR;
    const int32_t kMaxResultSize = 150;
    UChar result[150];
    ULocaleDisplayNames *ldn = uldn_open("de_DE", ULDN_STANDARD_NAMES, &status);
    uldn_scriptDisplayName(ldn, "Hant", result, kMaxResultSize, &status);
    uldn_close(ldn);
    bool flag = U_SUCCESS(status);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testuldn_scriptaCodeDisplayName(napi_env env, napi_callback_info info)
{
    UErrorCode status = U_ZERO_ERROR;
    const int32_t kMaxResultSize = 150;
    UChar result[150];
    ULocaleDisplayNames *ldn = uldn_open("de_DE", ULDN_STANDARD_NAMES, &status);
    uldn_scriptCodeDisplayName(ldn, USCRIPT_TRADITIONAL_HAN, result, kMaxResultSize, &status);
    uldn_close(ldn);
    bool flag = U_SUCCESS(status);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testuldn_regionDisplayName(napi_env env, napi_callback_info info)
{
    UErrorCode status = U_ZERO_ERROR;
    const int32_t kMaxResultSize = 150;
    UChar result[150];
    ULocaleDisplayNames *ldn = uldn_open("de_DE", ULDN_STANDARD_NAMES, &status);
    uldn_regionDisplayName(ldn, "US", result, kMaxResultSize, &status);
    uldn_close(ldn);
    bool flag = U_SUCCESS(status);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testuldn_variantDisplayName(napi_env env, napi_callback_info info)
{
    UErrorCode status = U_ZERO_ERROR;
    const int32_t kMaxResultSize = 150;
    UChar result[150];
    ULocaleDisplayNames *ldn = uldn_open("de_DE", ULDN_STANDARD_NAMES, &status);
    uldn_variantDisplayName(ldn, "PRE_EURO", result, kMaxResultSize, &status);
    uldn_close(ldn);
    bool flag = U_SUCCESS(status);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testuldn_keyDisplayName(napi_env env, napi_callback_info info)
{
    UErrorCode status = U_ZERO_ERROR;
    const int32_t kMaxResultSize = 150;
    UChar result[150];
    ULocaleDisplayNames *ldn = uldn_open("de_DE", ULDN_STANDARD_NAMES, &status);
    uldn_keyDisplayName(ldn, "calendar", result, kMaxResultSize, &status);
    uldn_close(ldn);
    bool flag = U_SUCCESS(status);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testuldn_keyValueDisplayName(napi_env env, napi_callback_info info)
{
    UErrorCode status = U_ZERO_ERROR;
    const int32_t kMaxResultSize = 150;
    UChar result[150];
    ULocaleDisplayNames *ldn = uldn_open("de_DE", ULDN_STANDARD_NAMES, &status);
    uldn_keyValueDisplayName(ldn, "calendar", "gregorian", result, kMaxResultSize, &status);
    uldn_close(ldn);
    bool flag = U_SUCCESS(status);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testuldn_openForContext(napi_env env, napi_callback_info info)
{
    typedef struct {
        const char* displayLocale;
        UDisplayContext dialectHandling;
        UDisplayContext capitalization;
        UDisplayContext displayLength;
        const char* localeToBeNamed;
        const UChar* result;
    } LocNameDispContextItem;
    static char en[] = "en";
    static UChar daFor_en[] = {0x65, 0x6E, 0x67, 0x65, 0x6c, 0x73, 0x6B, 0};
    LocNameDispContextItem item {
        "da",
        UDISPCTX_STANDARD_NAMES,
        UDISPCTX_CAPITALIZATION_FOR_MIDDLE_OF_SENTENCE,
        UDISPCTX_LENGTH_FULL,
        en,
        daFor_en};
    UDisplayContext contexts[3] = {item.dialectHandling, item.capitalization, item.displayLength};
    UErrorCode status = U_ZERO_ERROR;
    const int32_t kMaxResultSize = 150;
    UChar result[150];
    ULocaleDisplayNames *ldn = uldn_openForContext(item.displayLocale, contexts, 3,  &status);
    uldn_getContext(ldn, UDISPCTX_TYPE_DIALECT_HANDLING, &status);
    uldn_close(ldn);
    bool flag = U_SUCCESS(status);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testulocdata_getCLDRVersion(napi_env env, napi_callback_info info)
{
    UErrorCode status = U_ZERO_ERROR;
    UVersionInfo uniVersion ;
    ulocdata_getCLDRVersion(uniVersion, &status);
    bool flag = (uniVersion[0] != 0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU_IS_UNICODE_NONCHAR(napi_env env, napi_callback_info info)
{
    int32_t c0 = 0xfdd0;
    bool flag = U_IS_UNICODE_NONCHAR(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU_IS_UNICODE_CHAR(napi_env env, napi_callback_info info)
{
    int32_t c0 = 0xd700;
    bool flag = U_IS_UNICODE_CHAR(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU_IS_BMP(napi_env env, napi_callback_info info)
{
    int32_t c0 = 0xfdd0;
    bool flag = U_IS_BMP(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU_IS_SUPPLEMENTARY(napi_env env, napi_callback_info info)
{
    int32_t c0 = 0x10005;
    bool flag = U_IS_SUPPLEMENTARY(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU_IS_LEAD(napi_env env, napi_callback_info info)
{
    int32_t c0 = 0x0000d966;
    bool flag = U_IS_LEAD(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU_IS_TRAIL(napi_env env, napi_callback_info info)
{
    int32_t c0 = 0xdc00;
    bool flag = U_IS_TRAIL(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU_IS_SURROGATE(napi_env env, napi_callback_info info)
{
    int32_t c0 = 0xd800;
    bool flag = U_IS_SURROGATE(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU_IS_SURROGATE_LEAD(napi_env env, napi_callback_info info)
{
    int32_t c0 = 0x0df;
    bool flag = U_IS_SURROGATE_LEAD(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU_IS_SURROGATE_TRAIL(napi_env env, napi_callback_info info)
{
    int32_t c0 = 0xfdd0;
    bool flag = U_IS_SURROGATE_TRAIL(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_IS_SINGLE(napi_env env, napi_callback_info info)
{
    int16_t c0 = 0xd830;
    bool flag = U16_IS_SINGLE(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_IS_LEAD(napi_env env, napi_callback_info info)
{
    UChar32 c0 = 0xd900;
    bool flag = U16_IS_LEAD(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}
static napi_value testU16_IS_TRAIL(napi_env env, napi_callback_info info)
{
    UChar32 c0 = 0xdd00;
    bool flag = U16_IS_TRAIL(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}
static napi_value testU16_IS_SURROGATE(napi_env env, napi_callback_info info)
{
    int32_t c0 = 0x0000d966;
    bool flag = U16_IS_SURROGATE(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_IS_SURROGATE_LEAD(napi_env env, napi_callback_info info)
{
    UChar32 c0 = 0xd830;
    bool flag = U16_IS_SURROGATE_LEAD(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_IS_SURROGATE_TRAIL(napi_env env, napi_callback_info info)
{
    UChar32 c0 = 0x401;
    bool flag = U16_IS_SURROGATE_TRAIL(c0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_LEAD(napi_env env, napi_callback_info info)
{
    UChar32 lead = 0xd800;
    UChar32 c = U16_LEAD(lead);
    bool flag = c == 0xd7f6;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_TRAIL(napi_env env, napi_callback_info info)
{
    int16_t c0 = 0xd830;
    UChar32 c = U16_TRAIL(c0);
    bool flag = c == 0xdc30;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_LENGTH(napi_env env, napi_callback_info info)
{
    UChar32 lead = 0xd800;
    bool flag = U16_LENGTH(lead) == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_GET_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar32 output;
    const UChar input[] = {
        0xdc00, 0x20ac, 0xd841, 0x61, 0xd841, 0xdc02, 0xd842,
        0xdc06, 0, 0xd842, 0xd7ff, 0xdc41, 0xe000, 0xd800
    };
    uint32_t offset = 8;
    U16_GET_UNSAFE(input, offset, output);
    bool flag = output == 0;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_GET(napi_env env, napi_callback_info info)
{
    UChar32 output;
    UChar input[] = {
        0xdc00, 0x20ac, 0xd841, 0x61, 0xd841, 0xdc02, 0xd842,
        0xdc06, 0, 0xd842, 0xd7ff, 0xdc41, 0xe000, 0xd800
    };
    uint16_t offset = 3;
    uint32_t length = 14;
    U16_GET(input, 0, offset, length, output);
    bool flag = output == 0x61;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_GET_OR_FFFD(napi_env env, napi_callback_info info)
{
    UChar32 output;
    UChar input[] = {
        0xdc00, 0x20ac, 0xd841, 0x61, 0xd841, 0xdc02, 0xd842,
        0xdc06, 0, 0xd842, 0xd7ff, 0xdc41, 0xe000, 0xd800
    };
    uint16_t offset = 3;
    uint32_t length = 14;
    U16_GET_OR_FFFD(input, 0, offset, length, output);
    bool flag = output == 0x61;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_NEXT_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar32 output;
    UChar input[] = {
        0xdc00, 0x20ac, 0xd841, 0x61, 0xd841, 0xdc02, 0xd842,
        0xdc06, 0, 0xd842, 0xd7ff, 0xdc41, 0xe000, 0xd800
    };
    uint16_t offset = 1;
    U16_NEXT_UNSAFE(input, offset, output);
    bool flag = output == 0x20ac;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_NEXT(napi_env env, napi_callback_info info)
{
    UChar32 output;
    UChar input[] = {
        0xdc00, 0x20ac, 0xd841, 0x61, 0xd841, 0xdc02, 0xd842,
        0xdc06, 0, 0xd842, 0xd7ff, 0xdc41, 0xe000, 0xd800
    };
    uint16_t offset = 2;
    uint32_t length = 14;
    U16_NEXT(input, offset, length, output);
    bool flag = output == 0xd841;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_NEXT_OR_FFFD(napi_env env, napi_callback_info info)
{
    UChar32 output;
    UChar input[] = {
        0xdc00, 0x20ac, 0xd841, 0x61, 0xd841, 0xdc02, 0xd842,
        0xdc06, 0, 0xd842, 0xd7ff, 0xdc41, 0xe000, 0xd800
    };
    uint16_t i = 1;
    uint32_t length = 14;
    U16_NEXT_OR_FFFD(input, i, length, output);
    bool flag = output == 0x20ac;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_APPEND_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar32 output = 0x003d;
    UChar input[] = {
        0xdc00, 0x20ac, 0xd841, 0x61, 0xd841, 0xdc02, 0xd842,
        0xdc06, 0, 0xd842, 0xd7ff, 0xdc41, 0xe000, 0xd800
    };
    uint16_t i = 1;
    U16_APPEND_UNSAFE(input, i, output);
    bool flag = input[1] == 0x3d;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testu_versionFromString(napi_env env, napi_callback_info info)
{
    UVersionInfo newIcu;
    char   ver[40] = "72.1";
    u_versionFromString(newIcu, ver);
    bool flag = newIcu[0] == 72;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testu_versionToString(napi_env env, napi_callback_info info)
{
    UVersionInfo newIcu = {72, 1, 0, 0};
    char   str[200] = "";
    u_versionToString(newIcu, str);
    std::string newStr(str);
    bool flag = (newStr.compare("72.1") == 0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testu_getVersion(napi_env env, napi_callback_info info)
{
    UVersionInfo icuVersion;
    u_getVersion(icuVersion);
    bool flag = icuVersion[0] != 0;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testu_versionFromUString(napi_env env, napi_callback_info info)
{
    UVersionInfo icuVersion = {};
    const UChar str[] = u"72.1";
    u_versionFromUString(icuVersion, str);
    bool flag = icuVersion[0] == 72;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}
uint32_t MapValueFilter(const void* context, uint32_t value)
{
    return value + 1;
}

static napi_value testUCPMapValueFilter(napi_env env, napi_callback_info info)
{
    uint32_t value = 233;
    UCPMapValueFilter* filter = &MapValueFilter;
    bool flag = filter(nullptr, value) == 234;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_APPEND(napi_env env, napi_callback_info info)
{
    UBool isError;
    UChar buffer[100];
    UChar32 c = 0xdbff;
    int32_t i = 1;
    uint32_t length = 100;
    U16_APPEND(buffer, i, length, c, isError);
    bool flag = isError;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_FWD_1_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar32 output;
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t offunsafe = 0;
    U16_FWD_1_UNSAFE(input, offunsafe);
    bool flag = offunsafe == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_FWD_1(napi_env env, napi_callback_info info)
{
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t offUnsafe = 0;
    uint32_t length = 12;
    U16_FWD_1(input, offUnsafe, length);
    bool flag = offUnsafe == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_FWD_N_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t offUnsafe = 0;
    uint16_t n = 2;
    U16_FWD_N_UNSAFE(input, offUnsafe, n);
    bool flag = input[0] == 0x0061;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_FWD_N(napi_env env, napi_callback_info info)
{
    const UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t offUnsafe = 0;
    uint16_t n = 2;
    uint32_t length = 14;
    U16_FWD_N(input, offUnsafe, length, n);
    bool flag = input[0] == 0x0061;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_SET_CP_START_UNSAFE(napi_env env, napi_callback_info info)
{
    const UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t i = 2;
    U16_SET_CP_START_UNSAFE(input, i);
    bool flag = i == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_SET_CP_START(napi_env env, napi_callback_info info)
{
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t i = 2;
    uint16_t start = 0;
    U16_SET_CP_START(input, start, i);
    bool flag = i == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}


static napi_value testU16_PREV_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar32 output;
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t i = 2;
    uint16_t start = 0;
    U16_PREV_UNSAFE(input, i, output);
    bool flag = output == 0xd800;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}


static napi_value testU16_PREV(napi_env env, napi_callback_info info)
{
    UChar32 output;
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t i = 2;
    uint16_t start = 0;
    U16_PREV(input, start, i, output);
    bool flag = output == 0xd800;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_PREV_OR_FFFD(napi_env env, napi_callback_info info)
{
    UChar32 output;
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t i = 2;
    uint16_t start = 0;
    U16_PREV_OR_FFFD(input, start, i, output);
    bool flag = output == 0xfffd;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_BACK_1_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t i = 2;
    U16_BACK_1_UNSAFE(input, i);
    bool flag = i == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_BACK_1(napi_env env, napi_callback_info info)
{
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t i = 2;
    uint16_t start = 0;
    U16_BACK_1(input, start, i);
    bool flag = i == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_BACK_N_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t i = 2;
    uint16_t n = 2;
    U16_BACK_N_UNSAFE(input, i, n);
    bool flag = (i == 0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_BACK_N(napi_env env, napi_callback_info info)
{
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t i = 2;
    uint16_t start = 0;
    uint16_t n = 2;
    U16_BACK_N(input, start, i, n);
    bool flag = (i == 0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_SET_CP_LIMIT_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t i = 2;
    U16_SET_CP_LIMIT_UNSAFE(input, i);
    bool flag = i == 3;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU16_SET_CP_LIMIT(napi_env env, napi_callback_info info)
{
    UChar input[] = {
        0x0061, 0xd800, 0xdc00, 0xdbff, 0xdfff, 0x0062,
        0xd841, 0xd7ff, 0xd841, 0xdc41, 0xdc00, 0x0000
    };
    uint16_t i = 2;
    uint16_t start = 0;
    uint32_t length = 12;
    U16_SET_CP_LIMIT(input, start, i, length);
    bool flag = i > 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_IS_SINGLE(napi_env env, napi_callback_info info)
{
    uint32_t c = 0x7a;
    bool flag = U8_IS_SINGLE(c);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_IS_LEAD(napi_env env, napi_callback_info info)
{
    uint32_t c = 0xc2;
    bool flag = U8_IS_LEAD(c);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_IS_TRAIL(napi_env env, napi_callback_info info)
{
    uint32_t c = 0x80;
    bool flag = U8_IS_TRAIL(c);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_LENGTH(napi_env env, napi_callback_info info)
{
    uint32_t c = 0x80;
    bool flag = U8_LENGTH(c) == 2;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_GET_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar32 output;
    uint8_t input[] = {
        0x61, 0x7f, 0xe4, 0xba, 0x8c, 0xF0, 0x90,
        0x90, 0x81, 0xc0, 0x65, 0x31, 0x9a, 0xc9
    };
    uint32_t offset = 0;
    U8_GET_UNSAFE(input, offset, output);
    bool flag = output == 0x61;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_GET(napi_env env, napi_callback_info info)
{
    UChar32 output;
    uint8_t input[] = {
        0x61, 0x7f, 0xe4, 0xba, 0x8c, 0xF0, 0x90,
        0x90, 0x81, 0xc0, 0x65, 0x31, 0, 0xc9
    };
    uint32_t offset = 11;
    uint32_t length = 14;
    U8_GET(input, 0, offset, length, output);
    bool flag = output == 0x31;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_GET_OR_FFFD(napi_env env, napi_callback_info info)
{
    UChar32 output;
    uint8_t input[] = {
        0x61, 0x7f, 0xe4, 0xba, 0x8c, 0xfe, 0x90,
        0x90, 0x81, 0xc0, 0x65, 0x31, 0x9a, 0xc9
    };
    uint32_t offset = 5;
    uint32_t length = 14;
    U8_GET_OR_FFFD(input, 0, offset, length, output);
    bool flag = output == 0xfffd;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_NEXT_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar32 output;
    uint8_t input[] = {
        0x61, 0x7f, 0xe4, 0xba, 0x8c, 0xF0, 0x90,
        0x90, 0x81, 0xc0, 0x65, 0x31, 0x9a, 0xc9
    };
    uint32_t offset = 0;
    U8_NEXT_UNSAFE(input, offset, output);
    bool flag = output == 0x61;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_NEXT(napi_env env, napi_callback_info info)
{
    UChar32 output;
    uint8_t input[] = {
        0x61, 0x7f, 0xe4, 0xba, 0x8c, 0xF0, 0x90,
        0x90, 0x81, 0xc0, 0x65, 0x31, 0x9a, 0xc9
    };
    uint32_t offset = 12;
    uint32_t length = 14;
    U8_NEXT(input, offset, length, output);
    bool flag = output < 0;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_NEXT_OR_FFFD(napi_env env, napi_callback_info info)
{
    UChar32 output;
    uint8_t input[] = {
        0x61, 0x7f, 0xe4, 0xba, 0x8c, 0xF0, 0x90,
        0x90, 0x81, 0xc0, 0x65, 0x31, 0x9a, 0xc9
    };
    uint32_t offset = 13;
    uint32_t length = 14;
    U8_NEXT_OR_FFFD(input, offset, length, output);
    bool flag = output == 0xfffd;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_APPEND_UNSAFE(napi_env env, napi_callback_info info)
{
    UChar32 c = 0x7f;
    uint8_t input[] = {
        0x61, 0x7f, 0xe4, 0xba, 0x8c, 0xF0, 0x90,
        0x90, 0x81, 0xc0, 0x65, 0x31, 0x9a, 0xc9
    };
    uint32_t offset = 2;
    U8_APPEND_UNSAFE(input, offset, c);
    bool flag = input[2] == 0x7f;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_APPEND(napi_env env, napi_callback_info info)
{
    UBool isError;
    uint8_t buffer[100];
    UChar32 appChar = 0x7f;
    uint32_t length = 0;
    uint32_t lengths = 100;
    U8_APPEND(buffer, length, lengths, appChar, isError);
    bool flag = buffer[0] != 0;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_FWD_1_UNSAFE(napi_env env, napi_callback_info info)
{
    uint8_t input[] = {
        0x61, 0x7f, 0xe4, 0xba, 0x8c, 0xF0, 0x90,
        0x90, 0x81, 0xc0, 0x65, 0x31, 0x9a, 0xc9
    };
    uint32_t offset = 2;
    U8_FWD_1_UNSAFE(input, offset);
    bool flag = offset == 5;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_FWD_1(napi_env env, napi_callback_info info)
{
    static const uint8_t input[] = {
        0x61,
        0xf0, 0x90, 0x90, 0x81,
        0xc0, 0x80,
        0xe2, 0x82, 0xac,
        0xc2, 0xa1,
        0xf4, 0x8f, 0xbf, 0xbf,
        0x00
    };
    uint32_t j = 0;
    U8_FWD_1(input, j, -1);
    bool flag = j == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_FWD_N_UNSAFE(napi_env env, napi_callback_info info)
{
    static const uint8_t input[] = {
        0x61,
        0xf0, 0x90, 0x90, 0x81,
        0xc0, 0x80,
        0xe2, 0x82, 0xac,
        0xc2, 0xa1,
        0xf4, 0x8f, 0xbf, 0xbf,
        0x00
    };
    uint32_t i = 1;
    uint32_t offset2 = 0;
    U8_FWD_N_UNSAFE(input, offset2, i);
    bool flag = i == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_FWD_N(napi_env env, napi_callback_info info)
{
    static const uint8_t input[] = {
        0x61,
        0xf0, 0x90, 0x90, 0x81,
        0xc0, 0x80,
        0xe2, 0x82, 0xac,
        0xc2, 0xa1,
        0xf4, 0x8f, 0xbf, 0xbf,
        0x00
    };
    int32_t cpIndex = 2;
    int32_t k = 0;
    U8_FWD_N(input, k, -1, cpIndex);
    bool flag = k > 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_SET_CP_START_UNSAFE(napi_env env, napi_callback_info info)
{
    static const uint8_t input[] = {
        0x61,
        0xf0, 0x90, 0x90, 0x81,
        0xc0, 0x80,
        0xe2, 0x82, 0xac,
        0xc2, 0xa1,
        0xf4, 0x8f, 0xbf, 0xbf,
        0x00
    };
    int32_t cpIndex = 2;
    U8_SET_CP_START_UNSAFE(input, cpIndex);
    bool flag = cpIndex == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_SET_CP_START(napi_env env, napi_callback_info info)
{
    static const uint8_t input[] = {
        0x61,
        0xf0, 0x90, 0x90, 0x81,
        0xc0, 0x80,
        0xe2, 0x82, 0xac,
        0xc2, 0xa1,
        0xf4, 0x8f, 0xbf, 0xbf,
        0x00
    };
    int32_t cpIndex = 2;
    U8_SET_CP_START(input, 0, cpIndex);
    bool flag = cpIndex == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_TRUNCATE_IF_INCOMPLETE(napi_env env, napi_callback_info info)
{
    const char* s = "\xED\xA0";
    int32_t adjusted = static_cast<int32_t>(strlen(s));
    U8_TRUNCATE_IF_INCOMPLETE(s, 0, adjusted);
    bool flag = adjusted > 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_PREV_UNSAFE(napi_env env, napi_callback_info info)
{
    static const uint8_t input[] = {
        0xc3, 0x9f,
        0xed, 0x9f, 0xbf
    };
    UChar32 cu;
    uint32_t j = 4;
    U8_PREV_UNSAFE(input, j, cu);
    bool flag = cu > 0;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_PREV(napi_env env, napi_callback_info info)
{
    static const uint8_t input[] = {
        0xc3, 0x9f,
        0xed, 0x9f, 0xbf,
        0xed, 0xa0, 0x81,
        0xed, 0xbf, 0xbe,
        0xee, 0x80, 0x80,
        0xf0, 0x97, 0xbf, 0xbe
    };
    UChar32 cu;
    int32_t setOffset = 18;
    U8_PREV(input, 0, setOffset, cu);
    bool flag = (cu > 0);
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_PREV_OR_FFFD(napi_env env, napi_callback_info info)
{
    static const uint8_t input[] = {
        0xc3, 0x9f,
        0xed, 0x9f, 0xbf,
        0xed, 0xa0, 0x81,
        0xed, 0xbf, 0xbe,
        0xee, 0x80, 0x80,
        0xf0, 0x97, 0xbf, 0xbe
    };
    UChar32 cu;
    int32_t setOffset = sizeof(input) - 1;
    U8_PREV_OR_FFFD(input, 0, setOffset, cu);
    bool flag = cu == 0xfffd;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}


static napi_value testU8_BACK_1_UNSAFE(napi_env env, napi_callback_info info)
{
    static const uint8_t s[] = {
        0x61,
        0xF0, 0x90, 0x90, 0x81,
        0xff,
        0x62,
        0xc0,
        0x80,
        0x7f,
        0x8f,
        0xc0,
        0x63,
        0x81,
        0x90,
        0x90,
        0xF0,
        0x00
    };
    uint32_t offSafe = sizeof(s);
    U8_BACK_1_UNSAFE(s, offSafe);
    bool flag = offSafe > 0;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_BACK_1(napi_env env, napi_callback_info info)
{
    static const uint8_t s[] = {
        0x61,
        0xF0, 0x90, 0x90, 0x81,
        0xff,
        0x62,
        0xc0,
        0x80,
        0x7f,
        0x8f,
        0xc0,
        0x63,
        0x81,
        0x90,
        0x90,
        0xF0,
        0x00
    };
    uint32_t offSafe = sizeof(s);
    U8_BACK_1(s, 0, offSafe);
    bool flag = offSafe > 0;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_BACK_N_UNSAFE(napi_env env, napi_callback_info info)
{
    static const uint8_t s[] = {
        0x61,
        0xF0, 0x90, 0x90, 0x81,
        0xff,
        0x62,
        0xc0,
        0x80,
        0x7f,
        0x8f,
        0xc0,
        0x63,
        0x81,
        0x90,
        0x90,
        0xF0,
        0x00
    };
    uint32_t offSafe = sizeof(s);
    U8_BACK_N_UNSAFE(s, offSafe, 1);
    bool flag = offSafe > 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_BACK_N(napi_env env, napi_callback_info info)
{
    static const uint8_t s[] = {
        0x61,
        0xF0, 0x90, 0x90, 0x81,
        0xff,
        0x62,
        0xc0,
        0x80,
        0x7f,
        0x8f,
        0xc0,
        0x63,
        0x81,
        0x90,
        0x90,
        0xF0,
        0x00
    };
    uint32_t offSafe = sizeof(s);
    static const uint16_t mValue[] = {0, 1, 2, 4, 1, 2, 1, 5};
    U8_BACK_N(s, 0, offSafe, mValue[1]);
    bool flag = s[1] == 0xF0;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_SET_CP_LIMIT_UNSAFE(napi_env env, napi_callback_info info)
{
    static const uint8_t s[] = {
        0x61, 0xe4, 0xba, 0x8c, 0x7f, 0xfe, 0x62, 0xc5, 0x7f, 0x61, 0x80, 0x80, 0xe0, 0x00
    };
    int32_t setOffSet = 1;
    U8_SET_CP_LIMIT_UNSAFE(s, setOffSet);
    bool flag = s[1] == 0xe4;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testU8_SET_CP_LIMIT(napi_env env, napi_callback_info info)
{
    static const uint8_t s[] = {
        0x61, 0xe4, 0xba, 0x8c, 0x7f, 0xfe, 0x62, 0xc5, 0x7f, 0x61, 0x80, 0x80, 0xe0, 0x00
    };
    int32_t setOffSet = 1;
    U8_SET_CP_LIMIT(s, 0, setOffSet, static_cast<int32_t>(sizeof(s)));
    bool flag = s[1] == 0xe4;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}


static napi_value testutf8_back1SafeBody(napi_env env, napi_callback_info info)
{
    static const uint8_t input[] = {
        0x61,
        0xf0, 0x90, 0x90, 0x81,
        0xc0, 0x80,
        0xe2, 0x82, 0xac,
        0xc2, 0xa1,
        0xf4, 0x8f, 0xbf, 0xbf,
        0x00
    };
    int32_t cpIndex = 2;
    uint8_t result = utf8_back1SafeBody(input, 0, cpIndex);
    bool flag = result == 1;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}


static napi_value testutf8_prevCharSafeBody(napi_env env, napi_callback_info info)
{
    static const uint8_t input[] = {
        0xc3, 0x9f,
        0xed, 0x9f, 0xbf,
        0xed, 0xa0, 0x81,
        0xed, 0xbf, 0xbe,
        0xee, 0x80, 0x80,
        0xf0, 0x97, 0xbf, 0xbe
    };
    UChar32 c;
    int32_t setOffset = sizeof(input) - 1;
    UChar32 result = utf8_prevCharSafeBody(input, 0, &(setOffset), c, -3);
    bool flag = result == 0xfffd;
    napi_value nValue;
    napi_status nStatus = napi_get_boolean(env, flag, &nValue);
    if (nStatus != napi_ok) {
        return nullptr;
    }
    return nValue;
}

static napi_value testOH_i18n_GetTimeZoneRules_0100(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    bool ec = (errCode == I18n_ErrorCode::SUCCESS);
    bool ds = (rules.initial.dstSavings == 0);
    bool ro = (rules.initial.rawOffset == 29143000);
    bool numAR = (rules.numAnnualRules == 0);
    bool numTAR = (rules.numTimeArrayRules == 2);
    TimeArrayTimeZoneRule rule = rules.timeArrayRules[0];
    std::string ruleName = rule.name;
    bool rname = (ruleName == "Asia/Shanghai(STD)");
    bool ros = (rule.rawOffset == 28800000);
    bool ads = (rule.dstSavings == 0);
    bool numST = (rule.numStartTimes == 15);
    bool numRT = (rule.timeRuleType == TimeRuleType::UTC_TIME);
    bool flag = (ec && ds && ro && numAR && numTAR && rname && ros && ads && numST && numRT);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetTimeZoneRules_0200(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("aaa", &rules);
    bool flag = (errCode == 8900001);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRules_0300(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeArrayTimeZoneRule rule = rules.timeArrayRules[0];
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetFirstStartFromTimeArrayTimeZoneRule(&rule, &query);
    bool flag = (errCode == I18n_ErrorCode::SUCCESS && query.result == -2177481943000);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRules_0400(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeArrayTimeZoneRule rule = rules.timeArrayRules[0];
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetFinalStartFromTimeArrayTimeZoneRule(&rule, &query);
    bool flag = (errCode == I18n_ErrorCode::SUCCESS && query.result == 684867600000);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetNextStartFromTimeArrayTimeZoneRules_0500(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeArrayTimeZoneRule rule = rules.timeArrayRules[0];
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetNextStartFromTimeArrayTimeZoneRule(&rule, &query);
    bool flag = (errCode == I18n_ErrorCode::SUCCESS && query.result == 527014800000);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRules_0600(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeArrayTimeZoneRule rule = rules.timeArrayRules[0];
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetPrevStartFromTimeArrayTimeZoneRule(&rule, &query);
    bool flag = (errCode == I18n_ErrorCode::SUCCESS && query.result == -650019600000);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetStartTimeAt_0700(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeArrayTimeZoneRule rule = rules.timeArrayRules[0];
    double result;
    errCode = OH_i18n_GetStartTimeAt(&rule, 0, &result);
    bool flag = (errCode == I18n_ErrorCode::SUCCESS && result == -2177481943000);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetTimeZoneRules_0800(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("America/Santiago", &rules);
    bool ec = (errCode == I18n_ErrorCode::SUCCESS);
    bool ds = (rules.initial.dstSavings == 0);
    bool ro = (rules.initial.rawOffset == -16965000);
    bool numAR = (rules.numAnnualRules == 2);
    bool numTAR = (rules.numTimeArrayRules == 5);
    AnnualTimeZoneRule rule = rules.annualRules[0];
    std::string ruleName = rule.name;
    bool rname = (ruleName == "(STD)");
    bool sYear = (rule.startYear == 2024);
    bool eYear = (rule.endYear == MAX_YEAR_IN_ANNUAL_TIMEZONE_RULE);
    bool ros = (rule.rawOffset == -14400000);
    bool ads = (rule.dstSavings == 0);
    bool dmonth = (rule.dateTimeRule.month == 3);
    bool dayOfMonth = (rule.dateTimeRule.dayOfMonth == 2);
    bool dayOfWeek = (rule.dateTimeRule.dayOfWeek == 1);
    bool weekInMonth = (rule.dateTimeRule.weekInMonth == 0);
    bool millisInDay = (rule.dateTimeRule.millisInDay == 10800000);
    bool dateRuleType = (rule.dateTimeRule.dateRuleType == DateRuleType::DOW_GEQ_DOM);
    bool timeRuleType = (rule.dateTimeRule.timeRuleType == TimeRuleType::UTC_TIME);
    bool flag = (ec && ds && ro && numAR && numTAR && rname && sYear && eYear && ros && ads && dmonth && dayOfMonth &&
                 dayOfWeek && weekInMonth && millisInDay && dateRuleType && timeRuleType);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetFirstStartFromAnnualTimeZoneRules_0900(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("America/Santiago", &rules);
    AnnualTimeZoneRule rule = rules.annualRules[0];
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetFirstStartFromAnnualTimeZoneRule(&rule, &query);
    bool flag = (errCode == I18n_ErrorCode::SUCCESS && query.result == 1712458800000);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetFinalStartFromAnnualTimeZoneRules_1000(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("America/Santiago", &rules);
    AnnualTimeZoneRule rule = rules.annualRules[0];
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetFinalStartFromAnnualTimeZoneRule(&rule, &query);
    bool flag = (errCode == I18n_ErrorCode::ERROR_INVALID_PARAMETER);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetNextStartFromAnnualTimeZoneRules_1100(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("America/Santiago", &rules);
    AnnualTimeZoneRule rule = rules.annualRules[0];
    TimeZoneRuleQuery query;
    const int64_t baseTime = 1712458800000;
    query.base = baseTime;
    query.inclusive = false;
    errCode = OH_i18n_GetNextStartFromAnnualTimeZoneRule(&rule, &query);
    bool flag = (errCode == I18n_ErrorCode::SUCCESS && query.result == 1743908400000);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetPrevStartFromAnnualTimeZoneRules_1200(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("America/Santiago", &rules);
    AnnualTimeZoneRule rule = rules.annualRules[0];
    TimeZoneRuleQuery query;
    const int64_t baseTime = 1743908400000;
    query.base = baseTime;
    query.inclusive = false;
    errCode = OH_i18n_GetPrevStartFromAnnualTimeZoneRule(&rule, &query);
    bool flag = (errCode == I18n_ErrorCode::SUCCESS && query.result == 1712458800000);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetStartInYear_1300(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("America/Santiago", &rules);
    AnnualTimeZoneRule rule = rules.annualRules[0];
    TimeZoneRuleQuery query;
    const int32_t year = 2024;
    errCode = OH_i18n_GetStartInYear(&rule, year, &query);
    bool flag = (errCode == I18n_ErrorCode::SUCCESS && query.result == 1712458800000);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetTimeZoneRules_1400(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("", &rules);
    bool flag = (errCode == I18n_ErrorCode::ERROR_INVALID_PARAMETER);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRule_1500(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetFirstStartFromTimeArrayTimeZoneRule(nullptr, &query);
    bool flag = (errCode == I18n_ErrorCode::ERROR_INVALID_PARAMETER);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetFirstStartFromAnnualTimeZoneRule_1600(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetFirstStartFromAnnualTimeZoneRule(nullptr, &query);
    bool flag = (errCode == I18n_ErrorCode::ERROR_INVALID_PARAMETER);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRule_1700(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetFinalStartFromTimeArrayTimeZoneRule(nullptr, &query);
    bool flag = (errCode == I18n_ErrorCode::ERROR_INVALID_PARAMETER);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetNextStartFromTimeArrayTimeZoneRule_1900(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetNextStartFromTimeArrayTimeZoneRule(nullptr, &query);
    bool flag = (errCode == I18n_ErrorCode::ERROR_INVALID_PARAMETER);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetNextStartFromAnnualTimeZoneRule_2000(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetNextStartFromAnnualTimeZoneRule(nullptr, &query);
    bool flag = (errCode == I18n_ErrorCode::ERROR_INVALID_PARAMETER);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRule_2100(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetPrevStartFromTimeArrayTimeZoneRule(nullptr, &query);
    bool flag = (errCode == I18n_ErrorCode::ERROR_INVALID_PARAMETER);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetPrevStartFromAnnualTimeZoneRule_2200(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetPrevStartFromAnnualTimeZoneRule(nullptr, &query);
    bool flag = (errCode == I18n_ErrorCode::ERROR_INVALID_PARAMETER);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetStartTimeAt_2300(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    double result;
    errCode = OH_i18n_GetStartTimeAt(nullptr, 0, &result);
    bool flag = (errCode == I18n_ErrorCode::ERROR_INVALID_PARAMETER);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetStartInYear_2400(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeZoneRuleQuery query;
    const int32_t year = 2024;
    errCode = OH_i18n_GetStartInYear(nullptr, year, &query);
    bool flag = (errCode == I18n_ErrorCode::ERROR_INVALID_PARAMETER);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}


static napi_value testOH_i18n_TimeZoneRuleQuery_2500(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeArrayTimeZoneRule rule = rules.timeArrayRules[0];
    TimeZoneRuleQuery query;
    query.prevRawOffset = 0;
    query.prevDSTSavings = 0;
    errCode = OH_i18n_GetFirstStartFromTimeArrayTimeZoneRule(&rule, &query);
    bool flag = (errCode == I18n_ErrorCode::SUCCESS);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testTimeArrayZoneRule_2600(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Asia/Shanghai", &rules);
    TimeArrayTimeZoneRule rule = rules.timeArrayRules[0];
    TimeZoneRuleQuery query;
    errCode = OH_i18n_GetFirstStartFromTimeArrayTimeZoneRule(&rule, &query);
    bool flag = (errCode == I18n_ErrorCode::SUCCESS && rule.numStartTimes > 0 &&
                 rule.startTimes != nullptr);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetTimeZoneRules_2700(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Africa/Cairo", &rules);
    bool ec = (errCode == I18n_ErrorCode::SUCCESS);
    AnnualTimeZoneRule rule = rules.annualRules[0];
    bool dateRuleType = (rule.dateTimeRule.dateRuleType == DateRuleType::DOW_LEQ_DOM);
    bool timeRuleType = (rule.dateTimeRule.timeRuleType == TimeRuleType::WALL_TIME);
    bool flag = (ec && dateRuleType && timeRuleType);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
}

static napi_value testOH_i18n_GetTimeZoneRules_2800(napi_env env, napi_callback_info info)
{
    TimeZoneRules rules;
    I18n_ErrorCode errCode = OH_i18n_GetTimeZoneRules("Australia/Adelaide", &rules);
    bool ec = (errCode == I18n_ErrorCode::SUCCESS);
    AnnualTimeZoneRule rule = rules.annualRules[0];
    bool timeRuleType = (rule.dateTimeRule.timeRuleType == TimeRuleType::STANDARD_TIME);
    bool flag = (ec && timeRuleType);
    napi_value nValue;
    napi_get_boolean(env, flag, &nValue);
    return nValue;
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
        {"testubrk_setUText_0100", nullptr, testUbrk_setUText_0100, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_setUText_0200", nullptr, testUbrk_setUText_0200, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_setUText_0300", nullptr, testUbrk_setUText_0300, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_setUText_0400", nullptr, testUbrk_setUText_0400, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_setUText_0500", nullptr, testUbrk_setUText_0500, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_setUText_0600", nullptr, testUbrk_setUText_0600, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_setUText_0700", nullptr, testUbrk_setUText_0700, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_setUText_0800", nullptr, testUbrk_setUText_0800, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_setUText_0900", nullptr, testUbrk_setUText_0900, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_setUText_1000", nullptr, testUbrk_setUText_1000, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_clone_0100", nullptr, testUbrk_clone_0100, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_clone_0200", nullptr, testUbrk_clone_0200, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testubrk_clone_0300", nullptr, testUbrk_clone_0300, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU_getUnicodeVersion", nullptr, testU_getUnicodeVersion, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU_charAge", nullptr, testU_charAge, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuldn_localeDisplayName", nullptr, testuldn_localeDisplayName, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testUldn_getLocale", nullptr, testUldn_getLocale, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testUldn_getDialectHandling", nullptr, testUldn_getDialectHandling, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuldn_languageDisplayName", nullptr, testuldn_languageDisplayName, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuldn_scriptDisplayName", nullptr, testuldn_scriptDisplayName, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuldn_scriptaCodeDisplayName", nullptr, testuldn_scriptaCodeDisplayName, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuldn_regionDisplayName", nullptr, testuldn_regionDisplayName, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuldn_variantDisplayName", nullptr, testuldn_variantDisplayName, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuldn_keyDisplayName", nullptr, testuldn_keyDisplayName, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuldn_keyValueDisplayName", nullptr, testuldn_keyValueDisplayName, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testuldn_openForContext", nullptr, testuldn_openForContext, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testulocdata_getCLDRVersion", nullptr, testulocdata_getCLDRVersion, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU_IS_UNICODE_NONCHAR", nullptr, testU_IS_UNICODE_NONCHAR, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU_IS_UNICODE_CHAR", nullptr, testU_IS_UNICODE_CHAR, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU_IS_BMP", nullptr, testU_IS_BMP, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU_IS_SUPPLEMENTARY", nullptr, testU_IS_SUPPLEMENTARY, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU_IS_LEAD", nullptr, testU_IS_LEAD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU_IS_TRAIL", nullptr, testU_IS_TRAIL, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU_IS_SURROGATE", nullptr, testU_IS_SURROGATE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU_IS_SURROGATE_LEAD", nullptr, testU_IS_SURROGATE_LEAD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU_IS_SURROGATE_TRAIL", nullptr, testU_IS_SURROGATE_TRAIL, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_IS_SINGLE", nullptr, testU16_IS_SINGLE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_IS_LEAD", nullptr, testU16_IS_LEAD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_IS_TRAIL", nullptr, testU16_IS_TRAIL, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_IS_SURROGATE", nullptr, testU16_IS_SURROGATE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_IS_SURROGATE_LEAD", nullptr, testU16_IS_SURROGATE_LEAD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_IS_SURROGATE_TRAIL", nullptr, testU16_IS_SURROGATE_TRAIL, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_LEAD", nullptr, testU16_LEAD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_TRAIL", nullptr, testU16_TRAIL, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_LENGTH", nullptr, testU16_LENGTH, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_GET_UNSAFE", nullptr, testU16_GET_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_GET", nullptr, testU16_GET, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_GET_OR_FFFD", nullptr, testU16_GET_OR_FFFD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_NEXT_UNSAFE", nullptr, testU16_NEXT_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_NEXT", nullptr, testU16_NEXT, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_NEXT_OR_FFFD", nullptr, testU16_NEXT_OR_FFFD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_APPEND_UNSAFE", nullptr, testU16_APPEND_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_versionFromString", nullptr, testu_versionFromString, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_versionToString", nullptr, testu_versionToString, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_getVersion", nullptr, testu_getVersion, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testu_versionFromUString", nullptr, testu_versionFromUString, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testUCPMapValueFilter", nullptr, testUCPMapValueFilter, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_APPEND", nullptr, testU16_APPEND, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_FWD_1_UNSAFE", nullptr, testU16_FWD_1_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_FWD_1", nullptr, testU16_FWD_1, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_FWD_N_UNSAFE", nullptr, testU16_FWD_N_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_FWD_N", nullptr, testU16_FWD_N, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_SET_CP_START_UNSAFE", nullptr, testU16_SET_CP_START_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_SET_CP_START", nullptr, testU16_SET_CP_START, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_PREV_UNSAFE", nullptr, testU16_PREV_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_PREV", nullptr, testU16_PREV, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_PREV_OR_FFFD", nullptr, testU16_PREV_OR_FFFD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_BACK_1_UNSAFE", nullptr, testU16_BACK_1_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_BACK_1", nullptr, testU16_BACK_1, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_BACK_N_UNSAFE", nullptr, testU16_BACK_N_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_BACK_N", nullptr, testU16_BACK_N, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_SET_CP_LIMIT_UNSAFE", nullptr, testU16_SET_CP_LIMIT_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU16_SET_CP_LIMIT", nullptr, testU16_SET_CP_LIMIT, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_IS_SINGLE", nullptr, testU8_IS_SINGLE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_IS_LEAD", nullptr, testU8_IS_LEAD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_IS_TRAIL", nullptr, testU8_IS_TRAIL, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_LENGTH", nullptr, testU8_LENGTH, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_GET_UNSAFE", nullptr, testU8_GET_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_GET", nullptr, testU8_GET, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_GET_OR_FFFD", nullptr, testU8_GET_OR_FFFD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_NEXT_UNSAFE", nullptr, testU8_NEXT_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_NEXT", nullptr, testU8_NEXT, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_NEXT_OR_FFFD", nullptr, testU8_NEXT_OR_FFFD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_APPEND_UNSAFE", nullptr, testU8_APPEND_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_APPEND", nullptr, testU8_APPEND, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_FWD_1_UNSAFE", nullptr, testU8_FWD_1_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_FWD_1", nullptr, testU8_FWD_1, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_FWD_N_UNSAFE", nullptr, testU8_FWD_N_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_FWD_N", nullptr, testU8_FWD_N, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_SET_CP_START_UNSAFE", nullptr, testU8_SET_CP_START_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_SET_CP_START", nullptr, testU8_SET_CP_START, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_TRUNCATE_IF_INCOMPLETE", nullptr, testU8_TRUNCATE_IF_INCOMPLETE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_PREV_UNSAFE", nullptr, testU8_PREV_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_PREV", nullptr, testU8_PREV, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_PREV_OR_FFFD", nullptr, testU8_PREV_OR_FFFD, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_BACK_1_UNSAFE", nullptr, testU8_BACK_1_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_BACK_1", nullptr, testU8_BACK_1, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_BACK_N_UNSAFE", nullptr, testU8_BACK_N_UNSAFE,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testU8_BACK_N", nullptr, testU8_BACK_N, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_SET_CP_LIMIT_UNSAFE", nullptr, testU8_SET_CP_LIMIT_UNSAFE, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testU8_SET_CP_LIMIT", nullptr, testU8_SET_CP_LIMIT, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutf8_back1SafeBody", nullptr, testutf8_back1SafeBody, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testutf8_prevCharSafeBody", nullptr, testutf8_prevCharSafeBody, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetTimeZoneRules_0100", nullptr, testOH_i18n_GetTimeZoneRules_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testOH_i18n_GetTimeZoneRules_0200", nullptr, testOH_i18n_GetTimeZoneRules_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRules_0300", nullptr,
         testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRules_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRules_0400", nullptr,
         testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRules_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetNextStartFromTimeArrayTimeZoneRules_0500", nullptr,
         testOH_i18n_GetNextStartFromTimeArrayTimeZoneRules_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRules_0600", nullptr,
         testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRules_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetStartTimeAt_0700", nullptr, testOH_i18n_GetStartTimeAt_0700, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testOH_i18n_GetTimeZoneRules_0800", nullptr, testOH_i18n_GetTimeZoneRules_0800, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testOH_i18n_GetFirstStartFromAnnualTimeZoneRules_0900", nullptr,
         testOH_i18n_GetFirstStartFromAnnualTimeZoneRules_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetFinalStartFromAnnualTimeZoneRules_1000", nullptr,
         testOH_i18n_GetFinalStartFromAnnualTimeZoneRules_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetNextStartFromAnnualTimeZoneRules_1100", nullptr,
         testOH_i18n_GetNextStartFromAnnualTimeZoneRules_1100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetPrevStartFromAnnualTimeZoneRules_1200", nullptr,
         testOH_i18n_GetPrevStartFromAnnualTimeZoneRules_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetStartInYear_1300", nullptr, testOH_i18n_GetStartInYear_1300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testOH_i18n_GetTimeZoneRules_1400", nullptr, testOH_i18n_GetTimeZoneRules_1400, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRule_1500", nullptr,
         testOH_i18n_GetFirstStartFromTimeArrayTimeZoneRule_1500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetFirstStartFromAnnualTimeZoneRule_1600", nullptr,
         testOH_i18n_GetFirstStartFromAnnualTimeZoneRule_1600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRule_1700", nullptr,
         testOH_i18n_GetFinalStartFromTimeArrayTimeZoneRule_1700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetNextStartFromTimeArrayTimeZoneRule_1900", nullptr,
         testOH_i18n_GetNextStartFromTimeArrayTimeZoneRule_1900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetNextStartFromAnnualTimeZoneRule_2000", nullptr,
         testOH_i18n_GetNextStartFromAnnualTimeZoneRule_2000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRule_2100", nullptr,
         testOH_i18n_GetPrevStartFromTimeArrayTimeZoneRule_2100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetPrevStartFromAnnualTimeZoneRule_2200", nullptr,
         testOH_i18n_GetPrevStartFromAnnualTimeZoneRule_2200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testOH_i18n_GetStartTimeAt_2300", nullptr, testOH_i18n_GetStartTimeAt_2300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testOH_i18n_GetStartInYear_2400", nullptr, testOH_i18n_GetStartInYear_2400, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testOH_i18n_TimeZoneRuleQuery_2500", nullptr, testOH_i18n_TimeZoneRuleQuery_2500, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testTimeArrayZoneRule_2600", nullptr, testTimeArrayZoneRule_2600, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testOH_i18n_GetTimeZoneRules_2700", nullptr, testOH_i18n_GetTimeZoneRules_2700, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testOH_i18n_GetTimeZoneRules_2800", nullptr, testOH_i18n_GetTimeZoneRules_2800, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
