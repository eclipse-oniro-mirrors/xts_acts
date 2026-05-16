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

#ifndef OBJECT_EDITOR_H
#define OBJECT_EDITOR_H

#include <ContentEmbedKit/content_embed/content_embed_common.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_extension.h>
#include <ContentEmbedKit/content_embed/content_embed_proxy.h>
#include <napi/native_api.h>

napi_value initObjectServiceConnect(napi_env env, napi_callback_info info);
napi_value TestExtensionGetContent_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionGetEmbedContent_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionGetExtensionInstance_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionRegisterOnCreateFunc_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionRegisterOnDestroyFunc_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionRegisterOnObjectAttachFunc_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionUnRegisterOnObjectAttachFunc_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionRegisterOnObjectDetachFunc_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionUnRegisterOnObjectDetachFunc_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionRegisterOnWriteToDataStreamFunc_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionRegisterOnGetSnapshotFunc_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionRegisterOnDoEditFunc_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionRegisterOnGetEditStatusFunc_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionRegisterOnGetCapabilityFunc_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionGetContentEmbedDocument_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionCallbackToOnUpdate_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionCallbackToOnError_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionCallbackToOnEditingFinished_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionCallbackToOnExtensionStopped_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionSetSnapshot_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionContextStartSelfUIAbility_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal(napi_env env, napi_callback_info info);
napi_value TestExtensionContextTerminateAbility_Normal(napi_env env, napi_callback_info info);
napi_value TestProxyGetSnapshot_NotSupported(napi_env env, napi_callback_info info);
napi_value TestProxyGetSnapshot_ExtensionError(napi_env env, napi_callback_info info);
napi_value TestProxyGetSnapshot_Normal(napi_env env, napi_callback_info info);
napi_value TestProxyStartWork_Error(napi_env env, napi_callback_info info);
napi_value TestProxyStartWork_Normal(napi_env env, napi_callback_info info);
napi_value TestProxyStopWork_Normal(napi_env env, napi_callback_info info);
napi_value TestProxyDoEdit_NotSupported(napi_env env, napi_callback_info info);
napi_value TestProxyDoEdit_ExtensionError(napi_env env, napi_callback_info info);
napi_value TestProxyDoEdit_Normal(napi_env env, napi_callback_info info);
napi_value TestProxyGetEditStatus_ExtensionError(napi_env env, napi_callback_info info);
napi_value TestProxyGetEditStatus_Normal(napi_env env, napi_callback_info info);
napi_value TestProxyGetCapability_ExtensionError(napi_env env, napi_callback_info info);
napi_value TestProxyGetCapability_Normal(napi_env env, napi_callback_info info);
napi_value TestProxyMultiExtension_Normal(napi_env env, napi_callback_info info);
napi_value TestStartWorkLimit(napi_env env, napi_callback_info info);

constexpr int32_t BUF_SIZE = 64;
extern const char* testExtensionGetContextNormal;
extern const char* testExtensionGetEmbedContextNormal;
extern const char* testExtensionGetExtensionInstanceNormal;
extern const char* testExtensionRegisterOnCreateFuncNormal;
extern const char* testExtensionRegisterOnDestroyFuncNormal;
extern const char* testExtensionRegisterOnObjectAttachFuncNormal;
extern const char* testExtensionUnRegisterOnObjectAttachFuncNormal;
extern const char* testExtensionRegisterOnObjectDetachFuncNormal;
extern const char* testExtensionUnRegisterOnObjectDetachFuncNormal;
extern const char* testExtensionRegisterOnWriteToDataStreamFuncNormal;
extern const char* testExtensionRegisterOnGetSnapshotFuncNormal;
extern const char* testExtensionRegisterOnDoEditFuncNormal;
extern const char* testExtensionRegisterOnGetEditStatusFuncNormal;
extern const char* testExtensionRegisterOnGetCapabilityFuncNormal;
extern const char* testExtensionGetContentEmbedDocumentNormal;
extern const char* testExtensionCallbackToOnUpdateNormal;
extern const char* testExtensionCallbackToOnErrorNormal;
extern const char* testExtensionCallbackToOnEditingFinishedNormal;
extern const char* testExtensionCallbackToOnExtensionStoppedNormal;
extern const char* testExtensionSetSnapshotNormal;
extern const char* testExtensionContextStartSelfUIAbilityNormal;
extern const char* testExtensionContextStartSelfUIAbilityWithStartOptionsNormal;
extern const char* testExtensionContextTerminateAbilityNormal;
#endif