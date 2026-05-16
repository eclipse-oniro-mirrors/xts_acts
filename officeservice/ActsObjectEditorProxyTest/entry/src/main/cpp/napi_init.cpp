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

static napi_value TestProxyCreateContentEmbedInfo_NullInfo(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyCreateContentEmbedInfo_NullInfo failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyCreateContentEmbedInfo_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *embedInfo = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyCreateContentEmbedInfo_Normal code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || (code == CE_ERR_OK && embedInfo != nullptr)) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyDestroyContentEmbedInfo_NullInfo(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyContentEmbedInfo(nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyContentEmbedInfo_NullInfo failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyDestroyContentEmbedInfo_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *embedInfo = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyContentEmbedInfo_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (embedInfo == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_DestroyContentEmbedInfo(embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyContentEmbedInfo_Normal destroy code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedInfo_NullLocaleNullInfo(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetContentEmbedInfo(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_NullLocaleNullInfo failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedInfo_NullInfo(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetContentEmbedInfo("zh-CN", nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_NullInfo failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedInfo_EmptyLocal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *embedInfo = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_EmptyLocal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetContentEmbedInfo("", embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_EmptyLocal failed code: %{public}d", code);
    if (code == CE_PERMISSION_DENIED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedInfo_LocaleInvalid(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *embedInfo = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetContentEmbedInfo("TestProxyGetContentEmbedInfo_LocaleInvalid", embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid failed code: %{public}d", code);
    if (code == CE_PERMISSION_DENIED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedInfo_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *embedInfo = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetContentEmbedInfo("zh-CN", embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_Normal failed code: %{public}d", code);
    if (code == CE_PERMISSION_DENIED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFormatCountFromInfo_NullInfoNullCount(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetFormatCountFromInfo(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatCountFromInfo_NullInfoNullCount failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFormatCountFromInfo_NullCount(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *embedInfo = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatCountFromInfo_NullCount create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetFormatCountFromInfo(embedInfo, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatCountFromInfo_NullCount failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFormatCountFromInfo_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *embedInfo = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatCountFromInfo_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    unsigned int count = 0;
    code = OH_ContentEmbed_GetFormatCountFromInfo(embedInfo, &count);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatCountFromInfo_Normal get count code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFormatFromInfo_NullInfoNullFormat(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetFormatFromInfo(nullptr, 0, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatFromInfo_NullInfoNullFormat failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFormatFromInfo_NullInfo(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetFormatFromInfo(nullptr, 0, &format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatFromInfo_NullInfo failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFormatFromInfo_NullFormat(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *infoObj = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&infoObj);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatFromInfo_NullFormat create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetFormatFromInfo(infoObj, 0, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatFromInfo_NullFormat code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFormatFromInfo_IndexOutOfRange(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *infoObj = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&infoObj);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatFromInfo_IndexOutOfRange create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    ContentEmbed_Format *format = nullptr;
    code = OH_ContentEmbed_GetFormatFromInfo(infoObj, UINT32_MAX, &format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatFromInfo_IndexOutOfRange code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFormatCountFromInfo_NullInfo(napi_env env, napi_callback_info info)
{
    uint32_t count = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetFormatCountFromInfo(nullptr, &count);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatCountFromInfo_NullInfo code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyCreateContentEmbedFormat_NullFormat(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyCreateContentEmbedFormat_NullFormat failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyCreateContentEmbedFormat_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyCreateContentEmbedFormat_Normal code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || (code == CE_ERR_OK && format != nullptr)) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyDestroyContentEmbedFormat_NullFormat(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyContentEmbedFormat(nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyContentEmbedFormat_NullFormat failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyDestroyContentEmbedFormat_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyContentEmbedFormat_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (format == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_DestroyContentEmbedFormat(format);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyContentEmbedFormat_Normal destroy code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEidNullLocaleNullFormat(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale(nullptr, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEidNullLocaleNullFormat failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEid(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEid create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale(nullptr, "zh-CN", format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEid code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedFormatByOEidAndLocale_NullFormat(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale("test.oeid",
        "zh-CN", nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_NullFormat code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedFormatByOEidAndLocale_NullLocale(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_NullLocale create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale("test.oeid", nullptr, format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_NullLocale code: %{public}d", code);
    if (code == CE_PERMISSION_DENIED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyOEid(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyOEid create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale("", "zh-CN", format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyOEid code: %{public}d", code);
    if (code == CE_PERMISSION_DENIED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyLocale(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyLocale create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale("OEID", "", format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyLocale code: %{public}d", code);
    if (code == CE_PERMISSION_DENIED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetOEidFromFormat_NullFormatNullOEid(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetOEidFromFormat(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetOEidFromFormat_NullFormatNullOEid failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetOEidFromFormat_NullOEid(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetOEidFromFormat_NullOEid create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetOEidFromFormat(format, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetOEidFromFormat_NullOEid code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetOEidFromFormat_NullFormat(napi_env env, napi_callback_info info)
{
    char oeid[MAX_OEID_LENGTH] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetOEidFromFormat(nullptr, oeid);
    OH_LOG_INFO(LOG_APP, "TestProxyGetOEidFromFormat_NullFormat code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetOEidFromFormat_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetOEidFromFormat_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (format == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    char oeid[MAX_OEID_LENGTH] = {0};
    code = OH_ContentEmbed_GetOEidFromFormat(format, oeid);
    OH_LOG_INFO(LOG_APP, "TestProxyGetOEidFromFormat_Normal get oeid code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetNameAndDescriptionFromFormat_NullFormatNullNameNullDescription(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetNameAndDescriptionFromFormat(nullptr, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestProxyGetNameAndDescriptionFromFormat_NullFormatNullNameNullDescription failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetNameAndDescriptionFromFormat_NullName(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetNameAndDescriptionFromFormat_NullName create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    char description[MAX_DESCRIPTION_LENGTH] = {0};
    code = OH_ContentEmbed_GetNameAndDescriptionFromFormat(format, nullptr, description);
    OH_LOG_INFO(LOG_APP, "TestProxyGetNameAndDescriptionFromFormat_NullName code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetNameAndDescriptionFromFormat_NullFormat(napi_env env, napi_callback_info info)
{
    char name[MAX_NAME_LENGTH] = {0};
    char description[MAX_DESCRIPTION_LENGTH] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetNameAndDescriptionFromFormat(nullptr, name, description);
    OH_LOG_INFO(LOG_APP, "TestProxyGetNameAndDescriptionFromFormat_NullFormat code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetNameAndDescriptionFromFormat_NullDescription(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetNameAndDescriptionFromFormat_NullDescription create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    char name[MAX_NAME_LENGTH] = {0};
    code = OH_ContentEmbed_GetNameAndDescriptionFromFormat(format, name, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetNameAndDescriptionFromFormat_NullDescription code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetNameAndDescriptionFromFormat_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetNameAndDescriptionFromFormat_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (format == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    char name[MAX_NAME_LENGTH] = {0};
    char description[MAX_DESCRIPTION_LENGTH] = {0};
    code = OH_ContentEmbed_GetNameAndDescriptionFromFormat(format, name, description);
    OH_LOG_INFO(LOG_APP, "TestProxyGetNameAndDescriptionFromFormat_Normal get code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetIconFromFormat_NullFormatNullIcon(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetIconFromFormat(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetIconFromFormat_NullFormatNullIcon failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetIconFromFormat_NullIcon(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetIconFromFormat_NullIcon create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_GetIconFromFormat(format, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetIconFromFormat_NullIcon code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetIconFromFormat_NullFormat(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *icon = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetIconFromFormat(nullptr, &icon);
    OH_LOG_INFO(LOG_APP, "TestProxyGetIconFromFormat_NullFormat code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetIconFromFormat_EmptyFormat(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetIconFromFormat_EmptyFormat create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (format == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_PixelmapNative *icon = nullptr;
    code = OH_ContentEmbed_GetIconFromFormat(format, &icon);
    OH_LOG_INFO(LOG_APP, "TestProxyGetIconFromFormat_Normal get icon code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFileNameExtensionsFromFormat_NullFormatNullCount(napi_env env,
    napi_callback_info info)
{
    char **result = OH_ContentEmbed_GetFileNameExtensionsFromFormat(nullptr, nullptr);
    if (result != nullptr) {
        napi_value napiResult;
        napi_create_int32(env, -1, &napiResult);
        OH_LOG_INFO(LOG_APP, "TestProxyGetFileNameExtensionsFromFormat_NullFormatNullCount failed");
        return napiResult;
    }
    napi_value napiResult;
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &napiResult);
    return napiResult;
}

static napi_value TestProxyGetFileNameExtensionsFromFormat_NullFormat(napi_env env,
    napi_callback_info info)
{
    unsigned int count = 0;
    char **result = OH_ContentEmbed_GetFileNameExtensionsFromFormat(nullptr, &count);
    if (result != nullptr) {
        napi_value napiResult;
        napi_create_int32(env, -1, &napiResult);
        OH_LOG_INFO(LOG_APP, "TestProxyGetFileNameExtensionsFromFormat_NullFormat failed");
        return napiResult;
    }
    napi_value napiResult;
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &napiResult);
    return napiResult;
}

static napi_value TestProxyGetFileNameExtensionsFromFormat_NullCount(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFileNameExtensionsFromFormat_NullCount create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    char **result = OH_ContentEmbed_GetFileNameExtensionsFromFormat(format, nullptr);
    if (result != nullptr) {
        napi_value napiResult;
        napi_create_int32(env, -1, &napiResult);
        OH_LOG_INFO(LOG_APP, "TestProxyGetFileNameExtensionsFromFormat_NullCount failed");
        return napiResult;
    }
    napi_value napiResult;
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &napiResult);
    return napiResult;
}

static napi_value TestProxyGetFileNameExtensionsFromFormat_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFileNameExtensionsFromFormat_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (format == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    unsigned int count = 0;
    char **extensions = OH_ContentEmbed_GetFileNameExtensionsFromFormat(format, &count);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFileNameExtensionsFromFormat_Normal count: %{public}d", count);
    if (count >= 0) {
        napi_value result;
        napi_create_int32(env, CE_ERR_OK, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static void OnUpdateCallback(ContentEmbed_ExtensionProxy *proxy)
{
    OH_LOG_INFO(LOG_APP, "OnUpdateCallback called");
}

static void OnErrorCallback(ContentEmbed_ExtensionProxy *proxy, ContentEmbed_ErrorCode errorCode)
{
    OH_LOG_INFO(LOG_APP, "OnErrorCallback called with code: %{public}d", errorCode);
}

static void OnEditingFinishedCallback(ContentEmbed_ExtensionProxy *proxy, bool dataModified)
{
    OH_LOG_INFO(LOG_APP, "OnEditingFinishedCallback called");
}

static void OnExtensionStoppedCallback(ContentEmbed_ExtensionProxy *proxy)
{
    OH_LOG_INFO(LOG_APP, "OnExtensionStoppedCallback called");
}

static napi_value TestProxyCreateExtensionProxy_NullDocumentNullProxyNullContext(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateExtensionProxy(nullptr, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestProxyCreateExtensionProxy_NullDocumentNullProxyNullContext failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyCreateExtensionProxy_NullDocument(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateExtensionProxy(nullptr, &proxy, context);
    OH_LOG_INFO(LOG_APP,
        "TestProxyCreateExtensionProxy_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyCreateExtensionProxy_NullProxy(napi_env env,
    napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyCreateExtensionProxy_NullProxy create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    code = OH_ContentEmbed_CreateExtensionProxy(document, nullptr, context);
    OH_LOG_INFO(LOG_APP,
        "TestProxyCreateExtensionProxy_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyCreateExtensionProxy_NullContext(napi_env env,
    napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyCreateExtensionProxy_NullContext create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestProxyCreateExtensionProxy_NullContext failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyCreateExtensionProxy_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyCreateExtensionProxy_NullProxy create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, context);
    OH_LOG_INFO(LOG_APP, "TestProxyCreateExtensionProxy_Normal code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyDestroyExtensionProxy_NullProxy(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyExtensionProxy(nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyExtensionProxy_NullProxy failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyDestroyExtensionProxy_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyExtensionProxy_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, context);
    if (proxy == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyExtensionProxy_Normal failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnUpdateFunc_NullProxyNullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnUpdateFunc_NullProxyNullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnUpdateFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionProxy *proxy = reinterpret_cast<ContentEmbed_ExtensionProxy *>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(proxy, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnUpdateFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnUpdateFunc_NullProxy(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(nullptr, OnUpdateCallback);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnUpdateFunc_NullProxy failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnUpdateFunc_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnUpdateFunc_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, context);
    if (proxy == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(proxy, OnUpdateCallback);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnUpdateFunc_Normal code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnErrorFunc_NullProxyNullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnErrorFunc_NullProxyNullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnErrorFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionProxy *proxy = reinterpret_cast<ContentEmbed_ExtensionProxy *>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(proxy, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnErrorFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnErrorFunc_NullProxy(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(nullptr, OnErrorCallback);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnErrorFunc_NullProxy failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnErrorFunc_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnErrorFunc_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, context);
    if (proxy == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(proxy, OnErrorCallback);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnErrorFunc_Normal code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnEditingFinishedFunc_NullProxyNullCallback(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestProxyRegisterOnEditingFinishedFunc_NullProxyNullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnEditingFinishedFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionProxy *proxy = reinterpret_cast<ContentEmbed_ExtensionProxy *>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(proxy, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnEditingFinishedFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnEditingFinishedFunc_NullProxy(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(nullptr,
        OnEditingFinishedCallback);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnEditingFinishedFunc_NullProxy failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnEditingFinishedFunc_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnEditingFinishedFunc_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, context);
    if (proxy == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(proxy, OnEditingFinishedCallback);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnEditingFinishedFunc_Normal code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnExtensionStoppedFunc_NullProxyNullCallback(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestProxyRegisterOnExtensionStoppedFunc_NullProxyNullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnExtensionStoppedFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionProxy *proxy = reinterpret_cast<ContentEmbed_ExtensionProxy *>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(proxy, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnExtensionStoppedFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnExtensionStoppedFunc_NullProxy(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(nullptr,
        OnExtensionStoppedCallback);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnExtensionStoppedFunc_NullProxy failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyRegisterOnExtensionStoppedFunc_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnExtensionStoppedFunc_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, context);
    if (proxy == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(proxy, OnExtensionStoppedCallback);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnExtensionStoppedFunc_Normal code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyStartWork_NullProxy(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_StartWork(nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_NullProxy failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyStartWork_ProxyCallbackUnregister(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyRegisterOnExtensionStoppedFunc_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, context);
    if (proxy == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Proxy_StartWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_ProxyCallbackUnregister failed code: %{public}d", code);
    if (code == CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyStartWork_ConnectFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_ConnectFailed create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, context);
    if (proxy == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(proxy, OnUpdateCallback);
    code = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(proxy, OnErrorCallback);
    code = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(proxy, OnExtensionStoppedCallback);
    code = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(proxy, OnEditingFinishedCallback);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_ConnectFailed code: %{public}d", code);
    code = OH_ContentEmbed_Proxy_StartWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_ConnectFailed code: %{public}d", code);
    if (code == CE_PERMISSION_DENIED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyStopWork_NullProxy(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_StopWork(nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyStopWork_NullProxy failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyStopWork_DisConnectFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_ConnectFailed create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, context);
    if (proxy == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Proxy_StopWork(proxy);
    if (code == CE_ERR_SYSTEM_ABNORMAL) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetSnapshot_NullProxyNullSnapshot(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetSnapshot(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_NullProxyNullSnapshot failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetSnapshot_NullSnapshot(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionProxy *proxy = reinterpret_cast<ContentEmbed_ExtensionProxy *>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetSnapshot(proxy, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_NullSnapshot code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetSnapshot_NullProxy(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *snapshot = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetSnapshot(nullptr, &snapshot);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_NullProxy code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyDoEdit_NullProxy(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_DoEdit(nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyDoEdit_NullProxy failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetEditStatus_NullProxyNullIsEditingNullIsModified(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetEditStatus(nullptr, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestProxyGetEditStatus_NullProxyNullIsEditingNullIsModified failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetEditStatus_NullIsEditing(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionProxy *proxy = reinterpret_cast<ContentEmbed_ExtensionProxy *>(env);
    bool isModified = false;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetEditStatus(proxy, nullptr, &isModified);
    OH_LOG_INFO(LOG_APP, "TestProxyGetEditStatus_NullIsEditing code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetEditStatus_NullIsModified(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionProxy *proxy = reinterpret_cast<ContentEmbed_ExtensionProxy *>(env);
    bool isEditing = false;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetEditStatus(proxy, &isEditing, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetEditStatus_NullIsModified code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetEditStatus_NullProxy(napi_env env, napi_callback_info info)
{
    bool isEditing = false;
    bool isModified = false;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetEditStatus(nullptr, &isEditing, &isModified);
    OH_LOG_INFO(LOG_APP, "TestProxyGetEditStatus_NullProxy code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetCapability_NullProxyNullBitmask(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetCapability(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetCapability_NullProxyNullBitmask failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetCapability_NullBitmask(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionProxy *proxy = reinterpret_cast<ContentEmbed_ExtensionProxy *>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetCapability(proxy, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetCapability_NullBitmask code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetCapability_NullProxy(napi_env env, napi_callback_info info)
{
    unsigned int bitmask = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetCapability(nullptr, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestProxyGetCapability_NullProxy code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value TestProxyGetDocument_NullProxyNullDocument(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetDocument(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetDocument_NullProxyNullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetDocument_NullDocument(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyGetDocument_NullDocument create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, context);
    if (proxy == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Proxy_GetDocument(proxy, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetDocument_NullDocument code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetDocument_NullProxy(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetDocument(nullptr, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyGetDocument_NullProxy code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetDocument_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyGetDocument_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    void* context = reinterpret_cast<void*>(env);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    code = OH_ContentEmbed_CreateExtensionProxy(document, &proxy, context);
    if (proxy == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Proxy_GetDocument(proxy, &document);
    OH_LOG_INFO(LOG_APP, "TestProxyGetDocument_Normal code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"TestProxyCreateContentEmbedInfo_NullInfo", nullptr,
            TestProxyCreateContentEmbedInfo_NullInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyCreateContentEmbedInfo_Normal", nullptr,
            TestProxyCreateContentEmbedInfo_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDestroyContentEmbedInfo_NullInfo", nullptr,
            TestProxyDestroyContentEmbedInfo_NullInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDestroyContentEmbedInfo_Normal", nullptr,
            TestProxyDestroyContentEmbedInfo_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_NullLocaleNullInfo", nullptr,
            TestProxyGetContentEmbedInfo_NullLocaleNullInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_NullInfo", nullptr,
            TestProxyGetContentEmbedInfo_NullInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_EmptyLocal", nullptr,
            TestProxyGetContentEmbedInfo_EmptyLocal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_LocaleInvalid", nullptr,
            TestProxyGetContentEmbedInfo_LocaleInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_Normal", nullptr,
            TestProxyGetContentEmbedInfo_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFormatCountFromInfo_NullInfoNullCount", nullptr,
            TestProxyGetFormatCountFromInfo_NullInfoNullCount,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFormatCountFromInfo_NullCount", nullptr,
            TestProxyGetFormatCountFromInfo_NullCount,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFormatCountFromInfo_Normal", nullptr,
            TestProxyGetFormatCountFromInfo_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFormatFromInfo_NullInfoNullFormat", nullptr,
            TestProxyGetFormatFromInfo_NullInfoNullFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFormatFromInfo_NullInfo", nullptr,
            TestProxyGetFormatFromInfo_NullInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFormatFromInfo_NullFormat", nullptr,
            TestProxyGetFormatFromInfo_NullFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFormatFromInfo_IndexOutOfRange", nullptr,
            TestProxyGetFormatFromInfo_IndexOutOfRange,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFormatCountFromInfo_NullInfo", nullptr,
            TestProxyGetFormatCountFromInfo_NullInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyCreateContentEmbedFormat_NullFormat", nullptr,
            TestProxyCreateContentEmbedFormat_NullFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyCreateContentEmbedFormat_Normal", nullptr,
            TestProxyCreateContentEmbedFormat_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDestroyContentEmbedFormat_NullFormat", nullptr,
            TestProxyDestroyContentEmbedFormat_NullFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDestroyContentEmbedFormat_Normal", nullptr,
            TestProxyDestroyContentEmbedFormat_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEidNullLocaleNullFormat", nullptr,
            TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEidNullLocaleNullFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEid", nullptr,
            TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedFormatByOEidAndLocale_NullFormat", nullptr,
            TestProxyGetContentEmbedFormatByOEidAndLocale_NullFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedFormatByOEidAndLocale_NullLocale", nullptr,
            TestProxyGetContentEmbedFormatByOEidAndLocale_NullLocale,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyOEid", nullptr,
            TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyOEid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyLocale", nullptr,
            TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyLocale,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetOEidFromFormat_NullFormatNullOEid", nullptr,
            TestProxyGetOEidFromFormat_NullFormatNullOEid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetOEidFromFormat_NullOEid", nullptr,
            TestProxyGetOEidFromFormat_NullOEid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetOEidFromFormat_NullFormat", nullptr,
            TestProxyGetOEidFromFormat_NullFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetOEidFromFormat_Normal", nullptr,
            TestProxyGetOEidFromFormat_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetNameAndDescriptionFromFormat_NullFormatNullNameNullDescription", nullptr,
            TestProxyGetNameAndDescriptionFromFormat_NullFormatNullNameNullDescription,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetNameAndDescriptionFromFormat_NullName", nullptr,
            TestProxyGetNameAndDescriptionFromFormat_NullName,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetNameAndDescriptionFromFormat_NullFormat", nullptr,
            TestProxyGetNameAndDescriptionFromFormat_NullFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetNameAndDescriptionFromFormat_NullDescription", nullptr,
            TestProxyGetNameAndDescriptionFromFormat_NullDescription,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetNameAndDescriptionFromFormat_Normal", nullptr,
            TestProxyGetNameAndDescriptionFromFormat_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetIconFromFormat_NullFormatNullIcon", nullptr,
            TestProxyGetIconFromFormat_NullFormatNullIcon,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetIconFromFormat_NullIcon", nullptr,
            TestProxyGetIconFromFormat_NullIcon,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetIconFromFormat_NullFormat", nullptr,
            TestProxyGetIconFromFormat_NullFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetIconFromFormat_EmptyFormat", nullptr,
            TestProxyGetIconFromFormat_EmptyFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFileNameExtensionsFromFormat_NullFormat", nullptr,
            TestProxyGetFileNameExtensionsFromFormat_NullFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFileNameExtensionsFromFormat_NullFormatNullCount", nullptr,
            TestProxyGetFileNameExtensionsFromFormat_NullFormatNullCount,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFileNameExtensionsFromFormat_NullCount", nullptr,
            TestProxyGetFileNameExtensionsFromFormat_NullCount,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFileNameExtensionsFromFormat_Normal", nullptr,
            TestProxyGetFileNameExtensionsFromFormat_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyCreateExtensionProxy_NullDocumentNullProxyNullContext", nullptr,
            TestProxyCreateExtensionProxy_NullDocumentNullProxyNullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyCreateExtensionProxy_NullDocument", nullptr,
            TestProxyCreateExtensionProxy_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyCreateExtensionProxy_NullProxy", nullptr,
            TestProxyCreateExtensionProxy_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyCreateExtensionProxy_NullContext", nullptr,
            TestProxyCreateExtensionProxy_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyCreateExtensionProxy_Normal", nullptr,
            TestProxyCreateExtensionProxy_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDestroyExtensionProxy_NullProxy", nullptr,
            TestProxyDestroyExtensionProxy_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDestroyExtensionProxy_Normal", nullptr,
            TestProxyDestroyExtensionProxy_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnUpdateFunc_NullProxyNullCallback", nullptr,
            TestProxyRegisterOnUpdateFunc_NullProxyNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnUpdateFunc_NullCallback", nullptr,
            TestProxyRegisterOnUpdateFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnUpdateFunc_NullProxy", nullptr,
            TestProxyRegisterOnUpdateFunc_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnUpdateFunc_Normal", nullptr,
            TestProxyRegisterOnUpdateFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnErrorFunc_NullProxyNullCallback", nullptr,
            TestProxyRegisterOnErrorFunc_NullProxyNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnErrorFunc_NullCallback", nullptr,
            TestProxyRegisterOnErrorFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnErrorFunc_NullProxy", nullptr,
            TestProxyRegisterOnErrorFunc_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnErrorFunc_Normal", nullptr,
            TestProxyRegisterOnErrorFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnEditingFinishedFunc_NullProxyNullCallback", nullptr,
            TestProxyRegisterOnEditingFinishedFunc_NullProxyNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnEditingFinishedFunc_NullCallback", nullptr,
            TestProxyRegisterOnEditingFinishedFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnEditingFinishedFunc_NullProxy", nullptr,
            TestProxyRegisterOnEditingFinishedFunc_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnEditingFinishedFunc_Normal", nullptr,
            TestProxyRegisterOnEditingFinishedFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnExtensionStoppedFunc_NullProxyNullCallback", nullptr,
            TestProxyRegisterOnExtensionStoppedFunc_NullProxyNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnExtensionStoppedFunc_NullCallback", nullptr,
            TestProxyRegisterOnExtensionStoppedFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnExtensionStoppedFunc_NullProxy", nullptr,
            TestProxyRegisterOnExtensionStoppedFunc_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyRegisterOnExtensionStoppedFunc_Normal", nullptr,
            TestProxyRegisterOnExtensionStoppedFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyStartWork_NullProxy", nullptr,
            TestProxyStartWork_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyStartWork_ProxyCallbackUnregister", nullptr,
            TestProxyStartWork_ProxyCallbackUnregister,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyStartWork_ConnectFailed", nullptr,
            TestProxyStartWork_ConnectFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyStopWork_NullProxy", nullptr,
            TestProxyStopWork_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyStopWork_DisConnectFailed", nullptr,
            TestProxyStopWork_DisConnectFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetSnapshot_NullProxyNullSnapshot", nullptr,
            TestProxyGetSnapshot_NullProxyNullSnapshot,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetSnapshot_NullSnapshot", nullptr,
            TestProxyGetSnapshot_NullSnapshot,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetSnapshot_NullProxy", nullptr,
            TestProxyGetSnapshot_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDoEdit_NullProxy", nullptr,
            TestProxyDoEdit_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetEditStatus_NullProxyNullIsEditingNullIsModified", nullptr,
            TestProxyGetEditStatus_NullProxyNullIsEditingNullIsModified,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetEditStatus_NullIsEditing", nullptr,
            TestProxyGetEditStatus_NullIsEditing,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetEditStatus_NullIsModified", nullptr,
            TestProxyGetEditStatus_NullIsModified,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetEditStatus_NullProxy", nullptr,
            TestProxyGetEditStatus_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetCapability_NullProxyNullBitmask", nullptr,
            TestProxyGetCapability_NullProxyNullBitmask,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetCapability_NullBitmask", nullptr,
            TestProxyGetCapability_NullBitmask,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetCapability_NullProxy", nullptr,
            TestProxyGetCapability_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetDocument_NullProxyNullDocument", nullptr,
            TestProxyGetDocument_NullProxyNullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetDocument_NullProxy", nullptr,
            TestProxyGetDocument_NullProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetDocument_NullDocument", nullptr,
            TestProxyGetDocument_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetDocument_Normal", nullptr,
            TestProxyGetDocument_Normal,
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
