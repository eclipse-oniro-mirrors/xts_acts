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

#include <napi/native_api.h>
#include <ContentEmbedKit/content_embed/content_embed_common.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_extension.h>
#include "hilog/log.h"

namespace {
constexpr int32_t BUF_SIZE = 1024;
constexpr int32_t errorCodes_SIZE = 8;

static napi_value TestExtensionRegisterOnCreateFunc_NullExtensionNullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnCreateFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc_NullExtensionNullCallback failed code: %{public}d",
        code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnCreateFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle extension = reinterpret_cast<ContentEmbed_ExtensionInstanceHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnCreateFunc(extension, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnDestroyFunc_NullExtensionNullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnDestroyFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc_NullExtensionNullCallback failed code: %{public}d",
        code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnDestroyFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle extension = reinterpret_cast<ContentEmbed_ExtensionInstanceHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnDestroyFunc(extension, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnObjectAttachFunc_NullExtensionNullCallback(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionRegisterOnObjectAttachFunc_NullExtensionNullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnObjectAttachFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle extension = reinterpret_cast<ContentEmbed_ExtensionInstanceHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc(extension, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectAttachFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionUnRegisterOnObjectAttachFunc_NullExtension(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_UnRegisterOnObjectAttachFunc(nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionUnRegisterOnObjectAttachFunc_NullExtension failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnObjectDetachFunc_NullExtensionNullCallback(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionRegisterOnObjectDetachFunc_NullExtensionNullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnObjectDetachFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle extension = reinterpret_cast<ContentEmbed_ExtensionInstanceHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc(extension, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectDetachFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionUnRegisterOnObjectDetachFunc_NullExtension(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_UnRegisterOnObjectDetachFunc(nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectDetachFunc_NullExtension failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnWriteToDataStreamFunc_NullObjectNullCallback(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionRegisterOnWriteToDataStreamFunc_NullObjectNullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnWriteToDataStreamFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = reinterpret_cast<ContentEmbed_ObjectHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc(object, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnWriteToDataStreamFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnGetSnapshotFunc_NullObjectNullCallback(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionRegisterOnGetSnapshotFunc_NullObjectNullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnGetSnapshotFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = reinterpret_cast<ContentEmbed_ObjectHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc(object, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionRegisterOnGetSnapshotFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnDoEditFunc_NullObjectNullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnDoEditFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionRegisterOnDoEditFunc_NullObjectNullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnDoEditFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = reinterpret_cast<ContentEmbed_ObjectHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnDoEditFunc(object, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDoEditFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnGetEditStatusFunc_NullObjectNullCallback(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionRegisterOnGetEditStatusFunc_NullObjectNullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnGetEditStatusFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = reinterpret_cast<ContentEmbed_ObjectHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc(object, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetEditStatusFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnGetCapabilityFunc_NullObjectNullCallback(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionRegisterOnGetCapabilityFunc_NullObjectNullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnGetCapabilityFunc_NullCallback(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = reinterpret_cast<ContentEmbed_ObjectHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc(object, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetCapabilityFunc_NullCallback failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionGetContentEmbedContext_NullExtension(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionContextHandle ceContext = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedContext(nullptr, &ceContext);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedContext_NullExtension failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionGetContentEmbedContext_NullContext(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedContext(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedContext_NullContext failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionGetContext_NullExtension(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle context = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContext(nullptr, &context);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContext_NullExtension failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionGetContext_NullContext(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContext(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContext_NullContext failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionGetExtensionInstance_NullExtension(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle ceInstance = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetExtensionInstance(nullptr, &ceInstance);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_NullExtension failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionGetExtensionInstance_NullInstance(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetExtensionInstance(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_NullInstance failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionGetContentEmbedDocument_NullObject(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document *ceDocument = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedDocument(nullptr, &ceDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument_NullObject failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionGetContentEmbedDocument_NullDocument(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = reinterpret_cast<ContentEmbed_ObjectHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedDocument(object, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionCallbackToOnUpdate_NullObject(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnUpdate(nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate_NullObject failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionCallbackToOnError_NullObject(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnError(nullptr, CE_ERR_OK);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError_NullObject failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionCallbackToOnEditingFinished_NullObject(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnEditingFinished(nullptr, false);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished_NullObject failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionCallbackToOnExtensionStopped_NullExtension(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnExtensionStopped(nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStopped_NullExtension failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionSetSnapshot_NullObject(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_SetSnapshot(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_NullObject failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionSetSnapshot_NullPixelMap(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = reinterpret_cast<ContentEmbed_ObjectHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_SetSnapshot(object, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_NullPixelMap failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionContextStartSelfUIAbility_NullContextNullWant(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_ContextStartSelfUIAbility(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionContextStartSelfUIAbility_NullContextNullWant failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionContextStartSelfUIAbility_NullWant(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionContextHandle context = reinterpret_cast<ContentEmbed_ExtensionContextHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_ContextStartSelfUIAbility(context, nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_NullWant failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionContextStartSelfUIAbilityWithStartOptions_NullContextNullWantNullOptions(
    napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_ContextStartSelfUIAbilityWithStartOptions(
        nullptr, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionContextStartSelfUIAbilityWithStartOptions_NullContextNullWantNullOptions code: %{public}d",
        code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionContextStartSelfUIAbilityWithStartOptions_NullWantNullOptions(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ExtensionContextHandle context = reinterpret_cast<ContentEmbed_ExtensionContextHandle>(env);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_ContextStartSelfUIAbilityWithStartOptions(
        context, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestExtensionContextStartSelfUIAbilityWithStartOptions_NullWantNullOptions code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionContextTerminateAbility_NullContext(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_ContextTerminateAbility(nullptr);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextTerminateAbility_NullContext failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"TestExtensionRegisterOnCreateFunc_NullExtensionNullCallback", nullptr,
            TestExtensionRegisterOnCreateFunc_NullExtensionNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnCreateFunc_NullCallback", nullptr,
            TestExtensionRegisterOnCreateFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnDestroyFunc_NullExtensionNullCallback", nullptr,
            TestExtensionRegisterOnDestroyFunc_NullExtensionNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnDestroyFunc_NullCallback", nullptr,
            TestExtensionRegisterOnDestroyFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnObjectAttachFunc_NullExtensionNullCallback", nullptr,
            TestExtensionRegisterOnObjectAttachFunc_NullExtensionNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnObjectAttachFunc_NullCallback", nullptr,
            TestExtensionRegisterOnObjectAttachFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionUnRegisterOnObjectAttachFunc_NullExtension", nullptr,
            TestExtensionUnRegisterOnObjectAttachFunc_NullExtension,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnObjectDetachFunc_NullExtensionNullCallback", nullptr,
            TestExtensionRegisterOnObjectDetachFunc_NullExtensionNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnObjectDetachFunc_NullCallback", nullptr,
            TestExtensionRegisterOnObjectDetachFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionUnRegisterOnObjectDetachFunc_NullExtension", nullptr,
            TestExtensionUnRegisterOnObjectDetachFunc_NullExtension,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnWriteToDataStreamFunc_NullObjectNullCallback", nullptr,
            TestExtensionRegisterOnWriteToDataStreamFunc_NullObjectNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnWriteToDataStreamFunc_NullCallback", nullptr,
            TestExtensionRegisterOnWriteToDataStreamFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnGetSnapshotFunc_NullObjectNullCallback", nullptr,
            TestExtensionRegisterOnGetSnapshotFunc_NullObjectNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnGetSnapshotFunc_NullCallback", nullptr,
            TestExtensionRegisterOnGetSnapshotFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnDoEditFunc_NullObjectNullCallback", nullptr,
            TestExtensionRegisterOnDoEditFunc_NullObjectNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnDoEditFunc_NullCallback", nullptr,
            TestExtensionRegisterOnDoEditFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnGetEditStatusFunc_NullObjectNullCallback", nullptr,
            TestExtensionRegisterOnGetEditStatusFunc_NullObjectNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnGetEditStatusFunc_NullCallback", nullptr,
            TestExtensionRegisterOnGetEditStatusFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnGetCapabilityFunc_NullObjectNullCallback", nullptr,
            TestExtensionRegisterOnGetCapabilityFunc_NullObjectNullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnGetCapabilityFunc_NullCallback", nullptr,
            TestExtensionRegisterOnGetCapabilityFunc_NullCallback,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetContentEmbedContext_NullExtension", nullptr,
            TestExtensionGetContentEmbedContext_NullExtension,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetContentEmbedContext_NullContext", nullptr,
            TestExtensionGetContentEmbedContext_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetContext_NullExtension", nullptr, TestExtensionGetContext_NullExtension,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetContext_NullContext", nullptr, TestExtensionGetContext_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetExtensionInstance_NullExtension", nullptr,
            TestExtensionGetExtensionInstance_NullExtension,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetExtensionInstance_NullInstance", nullptr,
            TestExtensionGetExtensionInstance_NullInstance,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetContentEmbedDocument_NullObject", nullptr,
            TestExtensionGetContentEmbedDocument_NullObject,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetContentEmbedDocument_NullDocument", nullptr,
            TestExtensionGetContentEmbedDocument_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnUpdate_NullObject", nullptr, TestExtensionCallbackToOnUpdate_NullObject,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnError_NullObject", nullptr, TestExtensionCallbackToOnError_NullObject,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnEditingFinished_NullObject", nullptr,
            TestExtensionCallbackToOnEditingFinished_NullObject,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnExtensionStopped_NullExtension", nullptr,
            TestExtensionCallbackToOnExtensionStopped_NullExtension,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionSetSnapshot_NullObject", nullptr,
            TestExtensionSetSnapshot_NullObject,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionSetSnapshot_NullPixelMap", nullptr, TestExtensionSetSnapshot_NullPixelMap,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionContextStartSelfUIAbility_NullContextNullWant", nullptr,
            TestExtensionContextStartSelfUIAbility_NullContextNullWant,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionContextStartSelfUIAbility_NullWant", nullptr,
            TestExtensionContextStartSelfUIAbility_NullWant,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionContextStartSelfUIAbilityWithStartOptions_NullContextNullWantNullOptions", nullptr,
            TestExtensionContextStartSelfUIAbilityWithStartOptions_NullContextNullWantNullOptions,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionContextStartSelfUIAbilityWithStartOptions_NullWantNullOptions", nullptr,
            TestExtensionContextStartSelfUIAbilityWithStartOptions_NullWantNullOptions,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionContextTerminateAbility_NullContext", nullptr,
            TestExtensionContextTerminateAbility_NullContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
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
} // namespace

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
