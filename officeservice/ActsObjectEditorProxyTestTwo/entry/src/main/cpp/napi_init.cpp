/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#define LOG_TAG "ContentEmbed_TEST"

#include <cstdio>
#include <cstring>
#include <cstdint>

#include <napi/native_api.h>
#include <ContentEmbedKit/content_embed/content_embed_common.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_proxy.h>
#include "hilog/log.h"
#include "ObjectEditor.h"

static napi_value TestProxyGetFormatFromInfo_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *infoObj = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&infoObj);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatFromInfo_Normal create code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetContentEmbedInfo("", infoObj);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatFromInfo_Normal create content embed info ret: %{public}d", code);
    if (code != CE_ERR_OK || infoObj == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Format *format = nullptr;
    code = OH_ContentEmbed_GetFormatFromInfo(infoObj, 0, &format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatFromInfo_Normal code: %{public}d", code);
    if (code == CE_ERR_OK && format != nullptr) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedFormatByOEidAndLocale_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_Normal create code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (format == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000046";
    code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale(oeid, "", format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_Normal code: %{public}d", code);
    if (code == CE_ERR_OK && format != nullptr) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedFormatByOEidAndLocale_Abnormal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_Abnormal create code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (format == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char oeid[] = "TTT209FF-BBBB-DDDD-CAAA-000000000046";
    code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale(oeid, "", format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_Abnormal code: %{public}d", code);
    if (code == CE_ERR_SYSTEM_ABNORMAL) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetIconFromFormat_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetIconFromFormat_Normal create code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (format == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000046";
    code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale(oeid, "", format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetIconFromFormat_Normal code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_PixelmapNative *icon = nullptr;
    code = OH_ContentEmbed_GetIconFromFormat(format, &icon);
    OH_LOG_INFO(LOG_APP, "TestProxyGetIconFromFormat_Normal code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedInfo_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *infoObj = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&infoObj);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_Normal create code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetContentEmbedInfo("", infoObj);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_Normal get code: %{public}d", code);
    if (code == CE_ERR_OK || code == CE_ERR_SYSTEM_ABNORMAL) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFileNameExtensionsFromFormat_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFileNameExtensionsFromFormat_Normal create code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (format == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000046";
    code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale(oeid, "", format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFileNameExtensionsFromFormat_Normal code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    unsigned int count = 0;
    char** extensions = OH_ContentEmbed_GetFileNameExtensionsFromFormat(format, &count);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFileNameExtensionsFromFormat_Normal count: %{public}d", count);
    if (extensions != nullptr) {
        napi_create_int32(env, CE_ERR_OK, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentRead_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000046";
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(oeid, &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestDocumentRead_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    if (oeDocument == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint8_t buffer[] = "";
    size_t readSize = 0;
    errCode = OH_ContentEmbed_Document_Read(buffer, 0, oeDocument, 0, &readSize);
    OH_LOG_INFO(LOG_APP, "TestDocumentRead_Normal failed code: %{public}d", readSize);
    if (errCode == CE_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetStream_Empty(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000046";
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(oeid, &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetStream_Empty document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    errCode = OH_ContentEmbed_Document_GetRootStorage(oeDocument, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetStream_Empty get root storage code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    errCode = OH_ContentEmbed_Storage_GetStream(rootStorage, "", &stream);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetStream_Empty get stream code: %{public}d", errCode);
    if (errCode != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value TestDocumentDeleteEntry_Empty(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000046";
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(oeid, &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetStream_Empty document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    errCode = OH_ContentEmbed_Document_GetRootStorage(oeDocument, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestDocumentDeleteEntry_Empty get root storage code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, "");
    OH_LOG_INFO(LOG_APP, "TestDocumentDeleteEntry_Empty delete entry code: %{public}d", errCode);
    if (errCode != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value TestDocumentGetOEid_Empty(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000046";
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(oeid, &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetOEid_Empty document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    errCode = OH_ContentEmbed_Document_GetRootStorage(oeDocument, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetOEid_Empty get root storage code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Storage_GetOEid(rootStorage, "", 0);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetOEid_Empty get oeid code: %{public}d", errCode);
    if (errCode != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, errCode, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"TestProxyGetFormatFromInfo_Normal", nullptr,
            TestProxyGetFormatFromInfo_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedFormatByOEidAndLocale_Normal", nullptr,
            TestProxyGetContentEmbedFormatByOEidAndLocale_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedFormatByOEidAndLocale_Abnormal", nullptr,
            TestProxyGetContentEmbedFormatByOEidAndLocale_Abnormal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetIconFromFormat_Normal", nullptr,
            TestProxyGetIconFromFormat_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_Normal", nullptr,
            TestProxyGetContentEmbedInfo_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFileNameExtensionsFromFormat_Normal", nullptr,
            TestProxyGetFileNameExtensionsFromFormat_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentRead_Normal", nullptr,
            TestDocumentRead_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetStream_Empty", nullptr,
            TestDocumentGetStream_Empty,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentDeleteEntry_Empty", nullptr,
            TestDocumentDeleteEntry_Empty,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetOEid_Empty", nullptr,
            TestDocumentGetOEid_Empty,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initObjectServiceConnect", nullptr,
            initObjectServiceConnect,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyStartWork_Error", nullptr,
            TestProxyStartWork_Error,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStartWorkLimit", nullptr,
            TestStartWorkLimit,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module napiModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&napiModule);
}
