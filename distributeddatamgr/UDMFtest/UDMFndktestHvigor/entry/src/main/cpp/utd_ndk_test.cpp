/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "database/udmf/udmf.h"
#include "database/udmf/udmf_err_code.h"
#include <bits/alltypes.h>
#include <iostream>
#include <string>
#include "database/udmf/udmf_meta.h"
#include "database/udmf/uds.h"
#include "database/udmf/utd.h"
#define LOG_TAG "UDMFUtdTest"
#define PARAM_0 0
#define PARAM_1 1

const char *REFERENCE_URL =
    "https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/"
    "apis/js-apis-data-uniformTypeDescriptor.md#uniformdatatype";

static napi_value OH_Utd_Create_0001(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ENTITY);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.entity") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0002(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OBJECT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.object") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0003(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_COMPOSITE_OBJECT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.composite-object") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0004(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_TEXT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.text") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0005(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.plain-text") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0006(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_HTML);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.html") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0007(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_HYPERLINK);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.hyperlink")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0008(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_XML);
    const char*  result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.xml") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0009(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SOURCE_CODE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.source-code") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0010(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0011(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SHELL_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.shell-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0012(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_CSH_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.csh-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0013(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PERL_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.perl-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0014(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PHP_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.php-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0015(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PYTHON_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.python-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0017(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_RUBY_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.ruby-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0018(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_TYPE_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.type-script") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0019(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_JAVA_SCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.java-script")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0020(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_C_HEADER);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.c-header")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0021(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_C_SOURCE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.c-source") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0022(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_C_PLUS_PLUS_HEADER);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.c-plus-plus-header") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0023(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_C_PLUS_PLUS_SOURCE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.c-plus-plus-source")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0024(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_JAVA_SOURCE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.java-source") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0025(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_EBOOK);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.ebook")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0026(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_EPUB);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.epub")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0027(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AZW);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.amazon.azw")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0030(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AZW3);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.amazon.azw3")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0031(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_KFX);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.amazon.kfx") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0032(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MOBI);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.amazon.mobi")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0033(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MEDIA);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.media") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0034(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.image")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0035(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_JPEG);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.jpeg") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0036(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PNG);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.png") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0037(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_RAW_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.raw-image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0038(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_TIFF);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.tiff") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0039(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_BMP);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.bmp") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0040(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ICO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.ico") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0041(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PHOTOSHOP_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.photoshop-image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0042(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AI_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.illustrator.ai-image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0043(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WORD_DOC);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.word.doc") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0044(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_EXCEL);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.excel.xls") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0045(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.powerpoint.ppt") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0046(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PDF);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.pdf") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0047(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_POSTSCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.postscript") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0048(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ENCAPSULATED_POSTSCRIPT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.encapsulated-postscript") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0049(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_VIDEO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.video") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0050(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AVI);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.avi") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0051(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MPEG);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.mpeg") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0052(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MPEG4);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.mpeg-4") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0053(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_VIDEO_3GPP);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.3gpp")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0055(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_VIDEO_3GPP2);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.3gpp2") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0056(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WM);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wm") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0057(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WMV);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wmv") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0058(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WMP);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wmp") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0059(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AUDIO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.audio") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0060(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AAC);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.aac") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0061(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AIFF);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.aiff") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0062(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ALAC);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.alac") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0063(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_FLAC);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.flac") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0064(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MP3);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.mp3") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0065(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OGG);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.ogg") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0066(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PCM);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.pcm") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0067(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WMA);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wma") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0068(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WAVEFORM_AUDIO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.waveform-audio") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0069(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WMX);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wmx") == PARAM_0,  &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0070(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WVX);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wvx") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0071(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WINDOWS_MEDIA_WAX);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.windows-media-wax") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0072(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_GENERAL_FILE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.file") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0073(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_DIRECTORY);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.directory") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0074(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_FOLDER);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.folder") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0075(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SYMLINK);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.symlink") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0076(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.archive")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0077(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_BZ2_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.bz2-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0078(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_DISK_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.disk-image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0079(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_TAR_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.tar-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0080(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ZIP_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.zip-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0081(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_JAVA_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.sun.java-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0082(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_GNU_TAR_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.gnu.gnu-tar-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0083(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_GNU_ZIP_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.gnu.gnu-zip-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0084(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_GNU_ZIP_TAR_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.gnu.gnu-zip-tar-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0085(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_CALENDAR);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.calendar") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0086(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_CONTACT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.contact") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0087(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_DATABASE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.database") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0089(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MESSAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.message") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0090(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_VCARD);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.vcard") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0091(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_NAVIGATION);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.navigation") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0092(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_LOCATION);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.location") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0093(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENHARMONY_FORM);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "openharmony.form") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0094(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENHARMONY_APP_ITEM);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "openharmony.app-item") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0095(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENHARMONY_PIXEL_MAP);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "openharmony.pixel-map") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0096(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENHARMONY_ATOMIC_SERVICE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "openharmony.atomic-service") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0097(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENHARMONY_PACKAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "openharmony.package") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0098(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENHARMONY_HAP);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "openharmony.hap") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0099(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SMIL);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.real.smil") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0100(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_MARKDOWN);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.markdown") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0101(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_FAX);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.fax") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0102(napi_env env, napi_callback_info info)
{
    auto ut = OH_Utd_Create(UDMF_META_JFX_FAX);
    const char* result =  OH_Utd_GetTypeId(ut);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.j2.jfx-fax") == PARAM_0, &returnCode);
    OH_Utd_Destroy(ut);
    return returnCode;
}
static napi_value OH_Utd_Create_0103(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_EFX_FAX);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.js.efx-fax") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0104(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_XBITMAP_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.xbitmap-image")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0105(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_TGA_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.truevision.tga-image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0106(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SGI_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.sgi.sgi-image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0107(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENEXR_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.ilm.openexr-image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0108(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_FLASHPIX_IMAGE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.kodak.flashpix.image") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0109(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_REALMEDIA);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.real.realmedia") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0110(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AU_AUDIO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.au-audio") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0111(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_AIFC_AUDIO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.aifc-audio") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0112(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SD2_AUDIO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.digidesign.sd2-audio") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0113(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_REALAUDIO);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.real.realaudio") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0114(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENXML);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.openxmlformats.openxml") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0115(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_WORDPROCESSINGML_DOCUMENT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.openxmlformats.wordprocessingml.document") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0116(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SPREADSHEETML_SHEET);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.openxmlformats.spreadsheetml.sheet") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0117(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PRESENTATIONML_PRESENTATION);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.openxmlformats.presentationml.presentation") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0118(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENDOCUMENT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.oasis.opendocument") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0119(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENDOCUMENT_TEXT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.oasis.opendocument.text") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0120(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENDOCUMENT_SPREADSHEET);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.oasis.opendocument.spreadsheet")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0121(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENDOCUMENT_PRESENTATION);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.oasis.opendocument.presentation") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0122(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENDOCUMENT_GRAPHICS);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.oasis.opendocument.graphics") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0123(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENDOCUMENT_FORMULA);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "org.oasis.opendocument.formula") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_0124(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_STUFFIT_ARCHIVE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.allume.stuffit-archive") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0125(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_VCS);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.vcs") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0126(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_ICS);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.ics") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0127(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_EXECUTABLE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.executable") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0128(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PORTABLE_EXECUTABLE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.microsoft.portable-executable") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0129(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_SUN_JAVA_CLASS);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.sun.java-class") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0130(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_FONT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.font") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0131(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_TRUETYPE_FONT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.truetype-font") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0132(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_TRUETYPE_COLLECTION_FONT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.truetype-collection-font") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0133(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENTYPE_FONT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "general.opentype-font")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0134(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_POSTSCRIPT_FONT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.postscript-font")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0135(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_POSTSCRIPT_PFB_FONT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.postscript-pfb-font")== PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0136(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_POSTSCRIPT_PFA_FONT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "com.adobe.postscript-pfa-font") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0137(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENHARMONY_HDOC);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "openharmony.hdoc") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0138(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENHARMONY_HINOTE);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "openharmony.hinote") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0139(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENHARMONY_STYLED_STRING);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "openharmony.styled-string") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_0140(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_OPENHARMONY_WANT);
    const char* result =  OH_Utd_GetTypeId(utd);
    napi_value returnCode;
    napi_create_int32(env, strcmp(result, "openharmony.want") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Create_Test0100(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = OH_Utd_Create("general.plain-text");
    const char* result = OH_Utd_GetTypeId(utd);
    unsigned int count = 0;
    auto belongingToTypes = OH_Utd_GetBelongingToTypes(utd, &count);
    const char* belongingToType(belongingToTypes[0]);
    const char* resultDescription = OH_Utd_GetDescription(utd);
    napi_value returnCode;
    napi_create_int32(env, (strcmp(result, "general.plain-text") == PARAM_0) &&
      (strcmp(belongingToType, UDMF_META_TEXT) == PARAM_0) && (1 == count)
       && (strcmp(resultDescription, "Text of unspecified encoding, with no markup.")
       == PARAM_0), &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_Create_Test0200(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = OH_Utd_Create(nullptr);
    napi_value returnCode;
    napi_create_int32(env, utd == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_Create_Test0300(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = OH_Utd_Create("");
    napi_value returnCode;
    napi_create_int32(env, utd == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetTypeId0100(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    const char* actualTypeId(OH_Utd_GetTypeId(utd));
    napi_value returnCode;
    napi_create_int32(env, strcmp(actualTypeId, UDMF_META_PLAIN_TEXT) == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_GetTypeId0200(napi_env env, napi_callback_info info)
{
    OH_Utd* utdNullptr = nullptr;
    const char* typeIdNullptr = OH_Utd_GetTypeId(utdNullptr);
    napi_value returnCode;
    napi_create_int32(env, typeIdNullptr == nullptr, &returnCode);
    return returnCode;
}
static napi_value OH_Utd_GetDescription0100(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    const char* description(OH_Utd_GetDescription(utd));
    napi_value returnCode;
    napi_create_int32(env, strcmp(description, "Text of unspecified encoding, with no markup.")
     == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_GetDescription0200(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = nullptr;
    const char* descriptionNullptr = OH_Utd_GetDescription(utd);
    napi_value returnCode;
    napi_create_int32(env, descriptionNullptr == nullptr, &returnCode);
    return returnCode;
}


static napi_value OH_Utd_GetReferenceUrl_001(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    const char* url(OH_Utd_GetReferenceUrl(utd));
    napi_value returnCode;
    napi_create_int32(env, strcmp(url, REFERENCE_URL) == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_GetReferenceUrl_002(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = nullptr;
    const char* urlNullptr = OH_Utd_GetReferenceUrl(utd);
    napi_value returnCode;
    napi_create_int32(env, urlNullptr == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetIconFile_001(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    const char* iconFile(OH_Utd_GetIconFile(utd));
    napi_value returnCode;
    napi_create_int32(env, strcmp(iconFile, "sys.media.ohos_ic_normal_white_grid_txt") == PARAM_0, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_GetIconFile_002(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = nullptr;
    const char* iconFileNullptr = OH_Utd_GetIconFile(utd);
    napi_value returnCode;
    napi_create_int32(env, iconFileNullptr == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetBelongingToTypes_001(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    unsigned int count = 0;
    auto belongingToTypes = OH_Utd_GetBelongingToTypes(utd, &count);
    const char* belongingToType(belongingToTypes[0]);
    napi_value returnCode;
    napi_create_int32(env, strcmp(belongingToType, UDMF_META_TEXT) == PARAM_0 && (1 == count), &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_GetBelongingToTypes_002(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = nullptr;
    unsigned int count = 0;
    auto belongingToTypeNullptr = OH_Utd_GetBelongingToTypes(utd, &count);
    napi_value returnCode;
    napi_create_int32(env, belongingToTypeNullptr == nullptr, &returnCode);
    return returnCode;
}
static napi_value OH_Utd_GetFilenameExtensions_001(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    unsigned int count = 0;
    auto filenameExtensions = OH_Utd_GetFilenameExtensions(utd, &count);
    const char* filenameExtension(filenameExtensions[0]);
    napi_value returnCode;
    int num = 2;
    napi_create_int32(env, strcmp(filenameExtension, ".txt") == PARAM_0 && (num == count), &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_GetFilenameExtensions_002(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = nullptr;
    unsigned int count = 0;
    auto filenameExtensionsNullptr = OH_Utd_GetFilenameExtensions(utd, &count);
    napi_value returnCode;
    napi_create_int32(env, filenameExtensionsNullptr == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetFilenameExtensions_003(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = nullptr;
    unsigned int* countNullptr = nullptr;
    auto filenameExtensionsNullptr = OH_Utd_GetFilenameExtensions(utd, countNullptr);
    napi_value returnCode;
    napi_create_int32(env, filenameExtensionsNullptr == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetMimeTypes_001(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    unsigned int count = 0;
    auto mimeTypes = OH_Utd_GetMimeTypes(utd, &count);
    const char* mimeType(mimeTypes[0]);
    napi_value returnCode;
    napi_create_int32(env, strcmp(mimeType, "text/plain") == PARAM_0 && (1 == count), &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}
static napi_value OH_Utd_GetMimeTypes_002(napi_env env, napi_callback_info info)
{
    OH_Utd* utdNullptr = nullptr;
    unsigned int count = 0;
    auto mimeTypeNullptr = OH_Utd_GetMimeTypes(utdNullptr, &count);
    napi_value returnCode;
    napi_create_int32(env, mimeTypeNullptr == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetMimeTypes_003(napi_env env, napi_callback_info info)
{
    OH_Utd*  utd  = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    unsigned int* countNullptr = nullptr;
    auto mimeTypeNullptr = OH_Utd_GetMimeTypes(utd, countNullptr);
    napi_value returnCode;
    napi_create_int32(env, mimeTypeNullptr == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetTypesByFilenameExtension_001(napi_env env, napi_callback_info info)
{
    unsigned int count = 0;
    auto typeIds = OH_Utd_GetTypesByFilenameExtension(".txt", &count);
    const char* typeId(typeIds[0]);
    napi_value returnCode;
    napi_create_int32(env, strcmp(typeId, UDMF_META_PLAIN_TEXT) == PARAM_0 && (1 == count), &returnCode);
    OH_Utd_DestroyStringList(typeIds, count);
    return returnCode;
}

static napi_value OH_Utd_GetTypesByFilenameExtension_002(napi_env env, napi_callback_info info)
{
    const char* extensionNullptr = nullptr;
    unsigned int count = 0;
    auto typeIdsNullptr = OH_Utd_GetTypesByFilenameExtension(extensionNullptr, &count);
    napi_value returnCode;
    napi_create_int32(env, typeIdsNullptr == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetTypesByFilenameExtension_003(napi_env env, napi_callback_info info)
{
    unsigned int* countNullptr = nullptr;
    const char** typeIds = OH_Utd_GetTypesByFilenameExtension(".txt", countNullptr);
    napi_value returnCode;
    napi_create_int32(env, typeIds == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetTypesByMimeType_001(napi_env env, napi_callback_info info)
{
    unsigned int count = 0;
    auto typeIds = OH_Utd_GetTypesByMimeType("text/plain", &count);
    const char* typeId(typeIds[0]);
    napi_value returnCode;
    napi_create_int32(env, strcmp(typeId, UDMF_META_PLAIN_TEXT) == PARAM_0 && (1 == count), &returnCode);
    OH_Utd_DestroyStringList(typeIds, count);
    return returnCode;
}

static napi_value OH_Utd_GetTypesByMimeType_002(napi_env env, napi_callback_info info)
{
    const char* extensionNullptr = nullptr;
    unsigned int count = 0;
    auto typeIdsNullptr = OH_Utd_GetTypesByMimeType(extensionNullptr, &count);
    napi_value returnCode;
    napi_create_int32(env, typeIdsNullptr == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_GetTypesByMimeType_003(napi_env env, napi_callback_info info)
{
    unsigned int* countNullptr = nullptr;
    auto typeIdsNullptr = OH_Utd_GetTypesByMimeType("text/plain", countNullptr);
    napi_value returnCode;
    napi_create_int32(env, typeIdsNullptr == nullptr, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_BelongsTo_001(napi_env env, napi_callback_info info)
{
    int errcode = 0;
    auto result = OH_Utd_BelongsTo("general.plain-text", "general.text");
    if (result == true) {
        errcode = 1;
    }
    napi_value returnCode;
    napi_create_int32(env, errcode, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_BelongsTo_002(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_BelongsTo(UDMF_META_PLAIN_TEXT, UDMF_META_HTML);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_BelongsTo_003(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_BelongsTo(UDMF_META_PLAIN_TEXT, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_BelongsTo_004(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_BelongsTo(nullptr, UDMF_META_PLAIN_TEXT);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_BelongsTo_005(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_BelongsTo(UDMF_META_PLAIN_TEXT, UDMF_META_PLAIN_TEXT);
    napi_value returnCode;
    napi_create_int32(env, result == true, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsLower_001(napi_env env, napi_callback_info info)
{
    int errcode = 0;
    bool result = OH_Utd_IsLower(UDMF_META_PLAIN_TEXT, UDMF_META_TEXT);
    if (result) {
        errcode = 1;
    }
    napi_value returnCode;
    napi_create_int32(env, errcode, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsLower_002(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsLower(UDMF_META_PLAIN_TEXT, UDMF_META_HTML);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsLower_003(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsLower(UDMF_META_PLAIN_TEXT, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}
static napi_value OH_Utd_IsLower_004(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsLower(nullptr, UDMF_META_PLAIN_TEXT);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsLower_005(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsLower(UDMF_META_PLAIN_TEXT, UDMF_META_PLAIN_TEXT);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}
static napi_value OH_Utd_IsLower_006(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsLower(nullptr, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}
static napi_value OH_Utd_Equals_001(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    auto utd2 = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    bool result = OH_Utd_Equals(utd, utd2);
    napi_value returnCode;
    napi_create_int32(env, result == true, &returnCode);
    OH_Utd_Destroy(utd2);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Equals_002(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    bool result = OH_Utd_Equals(utd, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Equals_003(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    bool result = OH_Utd_Equals(nullptr, utd);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Equals_004(napi_env env, napi_callback_info info)
{
    auto utd = OH_Utd_Create(UDMF_META_PLAIN_TEXT);
    bool result = OH_Utd_Equals(utd, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    OH_Utd_Destroy(utd);
    return returnCode;
}

static napi_value OH_Utd_Equals_005(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_Equals(nullptr, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsHigher_001(napi_env env, napi_callback_info info)
{
    int errcode = 0;
    bool result = OH_Utd_IsHigher(UDMF_META_TEXT, UDMF_META_PLAIN_TEXT);
    if (result == true) {
        errcode = 1;
    }
    napi_value returnCode;
    napi_create_int32(env, errcode, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsHigher_002(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsHigher(UDMF_META_PLAIN_TEXT, UDMF_META_HTML);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsHigher_003(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsHigher(UDMF_META_PLAIN_TEXT, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}
static napi_value OH_Utd_IsHigher_004(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsHigher(nullptr, UDMF_META_PLAIN_TEXT);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}

static napi_value OH_Utd_IsHigher_005(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsHigher(UDMF_META_PLAIN_TEXT, UDMF_META_PLAIN_TEXT);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}
static napi_value OH_Utd_IsHigher_006(napi_env env, napi_callback_info info)
{
    bool result = OH_Utd_IsHigher(nullptr, nullptr);
    napi_value returnCode;
    napi_create_int32(env, result == false, &returnCode);
    return returnCode;
}
EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Utd_Create_0001", nullptr, OH_Utd_Create_0001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0002", nullptr, OH_Utd_Create_0002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0003", nullptr, OH_Utd_Create_0003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0004", nullptr, OH_Utd_Create_0004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0005", nullptr, OH_Utd_Create_0005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0006", nullptr, OH_Utd_Create_0006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0007", nullptr, OH_Utd_Create_0007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0008", nullptr, OH_Utd_Create_0008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0009", nullptr, OH_Utd_Create_0009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0010", nullptr, OH_Utd_Create_0010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0011", nullptr, OH_Utd_Create_0011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0012", nullptr, OH_Utd_Create_0012, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0013", nullptr, OH_Utd_Create_0013, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0014", nullptr, OH_Utd_Create_0014, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0015", nullptr, OH_Utd_Create_0015, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0017", nullptr, OH_Utd_Create_0017, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0018", nullptr, OH_Utd_Create_0018, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0019", nullptr, OH_Utd_Create_0019, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0020", nullptr, OH_Utd_Create_0020, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0021", nullptr, OH_Utd_Create_0021, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0022", nullptr, OH_Utd_Create_0022, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0023", nullptr, OH_Utd_Create_0023, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0024", nullptr, OH_Utd_Create_0024, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0025", nullptr, OH_Utd_Create_0025, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0026", nullptr, OH_Utd_Create_0026, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0027", nullptr, OH_Utd_Create_0027, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0030", nullptr, OH_Utd_Create_0030, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0031", nullptr, OH_Utd_Create_0031, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0032", nullptr, OH_Utd_Create_0032, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0033", nullptr, OH_Utd_Create_0033, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0034", nullptr, OH_Utd_Create_0034, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0035", nullptr, OH_Utd_Create_0035, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0036", nullptr, OH_Utd_Create_0036, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0037", nullptr, OH_Utd_Create_0037, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0038", nullptr, OH_Utd_Create_0038, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0039", nullptr, OH_Utd_Create_0039, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0040", nullptr, OH_Utd_Create_0040, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0041", nullptr, OH_Utd_Create_0041, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0042", nullptr, OH_Utd_Create_0042, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0043", nullptr, OH_Utd_Create_0043, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0044", nullptr, OH_Utd_Create_0044, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0045", nullptr, OH_Utd_Create_0045, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0046", nullptr, OH_Utd_Create_0046, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0047", nullptr, OH_Utd_Create_0047, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0048", nullptr, OH_Utd_Create_0048, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0049", nullptr, OH_Utd_Create_0049, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0050", nullptr, OH_Utd_Create_0050, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0051", nullptr, OH_Utd_Create_0051, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0052", nullptr, OH_Utd_Create_0052, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0053", nullptr, OH_Utd_Create_0053, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0055", nullptr, OH_Utd_Create_0055, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0056", nullptr, OH_Utd_Create_0056, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0057", nullptr, OH_Utd_Create_0057, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0058", nullptr, OH_Utd_Create_0058, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0059", nullptr, OH_Utd_Create_0059, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0060", nullptr, OH_Utd_Create_0060, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0061", nullptr, OH_Utd_Create_0061, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0062", nullptr, OH_Utd_Create_0062, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0063", nullptr, OH_Utd_Create_0063, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0064", nullptr, OH_Utd_Create_0064, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0065", nullptr, OH_Utd_Create_0065, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0066", nullptr, OH_Utd_Create_0066, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0067", nullptr, OH_Utd_Create_0067, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0068", nullptr, OH_Utd_Create_0068, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0069", nullptr, OH_Utd_Create_0069, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0070", nullptr, OH_Utd_Create_0070, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0071", nullptr, OH_Utd_Create_0071, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0072", nullptr, OH_Utd_Create_0072, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0073", nullptr, OH_Utd_Create_0073, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0074", nullptr, OH_Utd_Create_0074, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0075", nullptr, OH_Utd_Create_0075, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0076", nullptr, OH_Utd_Create_0076, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0077", nullptr, OH_Utd_Create_0077, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0078", nullptr, OH_Utd_Create_0078, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0079", nullptr, OH_Utd_Create_0079, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0080", nullptr, OH_Utd_Create_0080, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0081", nullptr, OH_Utd_Create_0081, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0082", nullptr, OH_Utd_Create_0082, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0083", nullptr, OH_Utd_Create_0083, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0084", nullptr, OH_Utd_Create_0084, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0085", nullptr, OH_Utd_Create_0085, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0086", nullptr, OH_Utd_Create_0086, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0087", nullptr, OH_Utd_Create_0087, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0089", nullptr, OH_Utd_Create_0089, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0090", nullptr, OH_Utd_Create_0090, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0091", nullptr, OH_Utd_Create_0091, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0092", nullptr, OH_Utd_Create_0092, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0093", nullptr, OH_Utd_Create_0093, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0094", nullptr, OH_Utd_Create_0094, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0095", nullptr, OH_Utd_Create_0095, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0096", nullptr, OH_Utd_Create_0096, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0097", nullptr, OH_Utd_Create_0097, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0098", nullptr, OH_Utd_Create_0098, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0099", nullptr, OH_Utd_Create_0099, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0100", nullptr, OH_Utd_Create_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0101", nullptr, OH_Utd_Create_0101, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0102", nullptr, OH_Utd_Create_0102, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0103", nullptr, OH_Utd_Create_0103, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0104", nullptr, OH_Utd_Create_0104, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0105", nullptr, OH_Utd_Create_0105, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0106", nullptr, OH_Utd_Create_0106, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0107", nullptr, OH_Utd_Create_0107, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0108", nullptr, OH_Utd_Create_0108, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0109", nullptr, OH_Utd_Create_0109, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0110", nullptr, OH_Utd_Create_0110, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0111", nullptr, OH_Utd_Create_0111, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0112", nullptr, OH_Utd_Create_0112, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0113", nullptr, OH_Utd_Create_0113, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0114", nullptr, OH_Utd_Create_0114, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0115", nullptr, OH_Utd_Create_0115, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0116", nullptr, OH_Utd_Create_0116, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0117", nullptr, OH_Utd_Create_0117, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0118", nullptr, OH_Utd_Create_0118, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0119", nullptr, OH_Utd_Create_0119, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0120", nullptr, OH_Utd_Create_0120, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0121", nullptr, OH_Utd_Create_0121, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0122", nullptr, OH_Utd_Create_0122, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0123", nullptr, OH_Utd_Create_0123, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0125", nullptr, OH_Utd_Create_0125, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0124", nullptr, OH_Utd_Create_0124, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0126", nullptr, OH_Utd_Create_0126, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0127", nullptr, OH_Utd_Create_0127, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0128", nullptr, OH_Utd_Create_0128, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0129", nullptr, OH_Utd_Create_0129, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0130", nullptr, OH_Utd_Create_0130, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0131", nullptr, OH_Utd_Create_0131, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0132", nullptr, OH_Utd_Create_0132, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0133", nullptr, OH_Utd_Create_0133, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0134", nullptr, OH_Utd_Create_0134, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0135", nullptr, OH_Utd_Create_0135, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0136", nullptr, OH_Utd_Create_0136, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0137", nullptr, OH_Utd_Create_0137, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0138", nullptr, OH_Utd_Create_0138, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0139", nullptr, OH_Utd_Create_0139, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_0140", nullptr, OH_Utd_Create_0140, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_Test0100", nullptr, OH_Utd_Create_Test0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_Test0200", nullptr, OH_Utd_Create_Test0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Create_Test0300", nullptr, OH_Utd_Create_Test0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_GetTypeId0100", nullptr, OH_Utd_GetTypeId0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_GetTypeId0200", nullptr, OH_Utd_GetTypeId0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_GetDescription0100", nullptr, OH_Utd_GetDescription0100, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Utd_GetDescription0200", nullptr, OH_Utd_GetDescription0200, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Utd_GetReferenceUrl_001", nullptr, OH_Utd_GetReferenceUrl_001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Utd_GetReferenceUrl_002", nullptr, OH_Utd_GetReferenceUrl_002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Utd_GetIconFile_001", nullptr, OH_Utd_GetIconFile_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_GetIconFile_002", nullptr, OH_Utd_GetIconFile_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_GetBelongingToTypes_001", nullptr, OH_Utd_GetBelongingToTypes_001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Utd_GetBelongingToTypes_002", nullptr, OH_Utd_GetBelongingToTypes_002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"OH_Utd_GetFilenameExtensions_001", nullptr, OH_Utd_GetFilenameExtensions_001, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"OH_Utd_GetFilenameExtensions_002", nullptr, OH_Utd_GetFilenameExtensions_002, nullptr, nullptr,
           nullptr, napi_default, nullptr},
        {"OH_Utd_GetFilenameExtensions_003", nullptr, OH_Utd_GetFilenameExtensions_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Utd_GetMimeTypes_001", nullptr, OH_Utd_GetMimeTypes_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_GetMimeTypes_002", nullptr, OH_Utd_GetMimeTypes_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_GetMimeTypes_003", nullptr, OH_Utd_GetMimeTypes_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_GetTypesByFilenameExtension_001", nullptr, OH_Utd_GetTypesByFilenameExtension_001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_GetTypesByFilenameExtension_002", nullptr, OH_Utd_GetTypesByFilenameExtension_002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_GetTypesByFilenameExtension_003", nullptr, OH_Utd_GetTypesByFilenameExtension_003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_GetTypesByMimeType_001", nullptr, OH_Utd_GetTypesByMimeType_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Utd_GetTypesByMimeType_002", nullptr, OH_Utd_GetTypesByMimeType_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Utd_GetTypesByMimeType_003", nullptr, OH_Utd_GetTypesByMimeType_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Utd_BelongsTo_001", nullptr, OH_Utd_BelongsTo_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_BelongsTo_002", nullptr, OH_Utd_BelongsTo_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_BelongsTo_003", nullptr, OH_Utd_BelongsTo_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_BelongsTo_004", nullptr, OH_Utd_BelongsTo_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_BelongsTo_005", nullptr, OH_Utd_BelongsTo_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsLower_001", nullptr, OH_Utd_IsLower_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsLower_002", nullptr, OH_Utd_IsLower_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsLower_003", nullptr, OH_Utd_IsLower_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsLower_004", nullptr, OH_Utd_IsLower_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsLower_005", nullptr, OH_Utd_IsLower_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsLower_006", nullptr, OH_Utd_IsLower_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Equals_001", nullptr, OH_Utd_Equals_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Equals_002", nullptr, OH_Utd_Equals_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Equals_003", nullptr, OH_Utd_Equals_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Equals_004", nullptr, OH_Utd_Equals_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_Equals_005", nullptr, OH_Utd_Equals_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsHigher_001", nullptr, OH_Utd_IsHigher_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsHigher_002", nullptr, OH_Utd_IsHigher_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsHigher_003", nullptr, OH_Utd_IsHigher_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsHigher_004", nullptr, OH_Utd_IsHigher_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsHigher_005", nullptr, OH_Utd_IsHigher_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Utd_IsHigher_006", nullptr, OH_Utd_IsHigher_006, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "UtdNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};
extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
