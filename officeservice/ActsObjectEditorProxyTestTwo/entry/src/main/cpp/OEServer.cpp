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

#include <algorithm>
#include <cstdint>
#include <cstring>
#include <fstream>
#include <string>
#include <AbilityKit/ability_runtime/context.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_extension.h>
#include <filemanagement/file_uri/oh_file_uri.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include "hilog/log.h"
#include "ObjectEditor.h"

static std::string normalOEid = "000209FF-BBBB-DDDD-CAAA-000000000046";
static std::string registerOEid = "000209FF-BBBB-DDDD-CAAA-000000000041";

static AbilityRuntime_ContextHandle g_context = nullptr;
static AbilityRuntime_ExtensionInstanceHandle g_abilityExtensionInstanceHandle = nullptr;
static ContentEmbed_ExtensionInstanceHandle g_instanceHandle = nullptr;
static ContentEmbed_ObjectHandle g_objectHandle = nullptr;
static constexpr int32_t OBJECT_SIZE = 1024;

static void NativeOnCreate(ContentEmbed_ExtensionInstanceHandle instance, AbilityBase_Want *want);
static void NativeOnDestroy(ContentEmbed_ExtensionInstanceHandle instance);
static void NativeOnDoEdit(ContentEmbed_ObjectHandle object);
static void NativeOnGetSnapShot(ContentEmbed_ObjectHandle object);
static void NativeOnGetCapability(ContentEmbed_ObjectHandle object, uint32_t *bitmask);
static void NativeOnGetEditStatusFunc(ContentEmbed_ObjectHandle object, bool *isEditing, bool *isModified);
static void NativeOnWriteToDataStream(ContentEmbed_ObjectHandle object);
static void RegisterOnObjectAttachFunc(ContentEmbed_ExtensionInstanceHandle instance,
    ContentEmbed_ObjectHandle object);
static void RegisterOnObjectDetachFunc(ContentEmbed_ExtensionInstanceHandle instance,
    ContentEmbed_ObjectHandle object);

static int32_t TestExtensionGetEmbedContext_Normal_Extension()
{
    ContentEmbed_ExtensionContextHandle ceContext;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedContext(g_instanceHandle,
        &ceContext);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContent_Normal code1: %{public}d", code);
    if (code == CE_ERR_NULL_POINTER && ceContext == nullptr) {
        return static_cast<int32_t>(code);
    }
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionGetContent_Normal_Extension()
{
    ContentEmbed_ExtensionContextHandle ceContext;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedContext(g_instanceHandle,
        &ceContext);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContent_Normal code1: %{public}d", code);
    if (code == CE_ERR_NULL_POINTER && ceContext == nullptr) {
        return static_cast<int32_t>(code);
    }
    AbilityRuntime_ContextHandle context = nullptr;
    code = OH_ContentEmbed_Extension_GetContext(ceContext, &context);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContent_Normal code2: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionGetExtensionInstance_Normal_Extension()
{
    ContentEmbed_ExtensionInstanceHandle instanceHandle = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetExtensionInstance(
        g_abilityExtensionInstanceHandle, &instanceHandle);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_NULL_POINTER && instanceHandle == nullptr) {
        return static_cast<int32_t>(code);
    }
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionRegisterOnCreateFunc_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnCreateFunc(
        g_instanceHandle, NativeOnCreate);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionRegisterOnDestroyFunc_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnDestroyFunc(
        g_instanceHandle, NativeOnDestroy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionRegisterOnObjectAttachFunc_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc(
        g_instanceHandle, RegisterOnObjectAttachFunc);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectAttachFunc_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionUnRegisterOnObjectAttachFunc_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_UnRegisterOnObjectAttachFunc(
        g_instanceHandle);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectAttachFunc_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc(
            g_instanceHandle, RegisterOnObjectAttachFunc);
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionRegisterOnObjectDetachFunc_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc(
        g_instanceHandle, RegisterOnObjectDetachFunc);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectDetachFunc_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionUnRegisterOnObjectDetachFunc_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_UnRegisterOnObjectDetachFunc(
        g_instanceHandle);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectDetachFunc_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc(
            g_instanceHandle, RegisterOnObjectDetachFunc);
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionRegisterOnWriteToDataStreamFunc_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc(
        g_objectHandle, NativeOnWriteToDataStream);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnWriteToDataStreamFunc_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionRegisterOnGetSnapshotFunc_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc(
        g_objectHandle, NativeOnGetSnapShot);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetSnapshotFunc_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionRegisterOnDoEditFunc_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnDoEditFunc(
        g_objectHandle, NativeOnDoEdit);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDoEditFunc_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionRegisterOnGetEditStatusFunc_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc(
        g_objectHandle, NativeOnGetEditStatusFunc);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetEditStatusFunc_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionRegisterOnGetCapabilityFunc_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc(
        g_objectHandle, NativeOnGetCapability);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetCapabilityFunc_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionGetContentEmbedDocument_Normal_Extension()
{
    ContentEmbed_Document* document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedDocument(
        g_objectHandle, &document);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_NULL_POINTER && document == nullptr) {
        return static_cast<int32_t>(code);
    }
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionCallbackToOnUpdate_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnUpdate(g_objectHandle);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionCallbackToOnUpdateWithError()
{
    unsigned char* buffer = new unsigned char[OBJECT_SIZE]();
    ContentEmbed_ObjectHandle object = reinterpret_cast<ContentEmbed_ObjectHandle>(buffer);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnUpdate(object);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdateWithError code: %{public}d", code);
    delete[] buffer;
    if (code == CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED || code == CE_ERR_CLIENT_CALLBACK_FAILED) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionCallbackToOnError_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnError(g_objectHandle, CE_ERR_OK);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionCallbackToOnErrorWithError()
{
    unsigned char* buffer = new unsigned char[OBJECT_SIZE]();
    ContentEmbed_ObjectHandle object = reinterpret_cast<ContentEmbed_ObjectHandle>(buffer);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnError(object, CE_ERR_OK);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnErrorWithError code: %{public}d", code);
    delete[] buffer;
    if (code == CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED || code == CE_ERR_CLIENT_CALLBACK_FAILED) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionCallbackToOnEditingFinished_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnEditingFinished(g_objectHandle, true);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        return static_cast<int32_t>(code);
    }
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionCallbackToOnEditingFinishedWithError()
{
    unsigned char* buffer = new unsigned char[OBJECT_SIZE]();
    ContentEmbed_ObjectHandle object = reinterpret_cast<ContentEmbed_ObjectHandle>(buffer);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnEditingFinished(object, true);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinishedWithError code: %{public}d", code);
    delete[] buffer;
    if (code == CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED || code == CE_ERR_CLIENT_CALLBACK_FAILED) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionCallbackToOnExtensionStopped_Normal_Extension()
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnExtensionStopped(g_instanceHandle);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStopped_Normal_Extension code: %{public}d", code);
    if (code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionCallbackToOnExtensionStoppedWithError()
{
    unsigned char* buffer = new unsigned char[OBJECT_SIZE]();
    ContentEmbed_ExtensionInstanceHandle object = reinterpret_cast<ContentEmbed_ExtensionInstanceHandle>(buffer);
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnExtensionStopped(object);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStoppedWithError code: %{public}d", code);
    delete[] buffer;
    if (code == CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED || code == CE_ERR_CLIENT_CALLBACK_FAILED) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionSetSnapshot_Normal_Extension()
{
    FILE *srcFile = fopen("/data/storage/el1/bundle/entry/resources/resfile/icon.png", "rb");
    if (srcFile == nullptr) {
        OH_LOG_ERROR(LOG_APP, "TestExtensionSetSnapshot_Normal_Extension srcFile is nullptr.");
        return -1;
    }
    int fd = fileno(srcFile);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal_Extension fileno fd: %{public}d.", fd);
    OH_ImageSourceNative *source = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &source);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal_Extension create source errCode: %{public}d.", errCode);
    if (errCode != IMAGE_SUCCESS) {
        return -1;
    }
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal_Extension create ops errCode: %{public}d.", errCode);
    if (errCode != IMAGE_SUCCESS) {
        return -1;
    }
    errCode = OH_DecodingOptions_SetDesiredDynamicRange(ops, IMAGE_DYNAMIC_RANGE_AUTO);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal_Extension set ops desired errCode: %{public}d.", errCode);
    OH_PixelmapNative *resPixMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(source, ops, &resPixMap);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal_Extension create pixelmap errCode: %{public}d.", errCode);
    OH_DecodingOptions_Release(ops);
    if (errCode != IMAGE_SUCCESS) {
        return -1;
    }
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_SetSnapshot(g_objectHandle, resPixMap);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal_Extension set snapshot errCode: %{public}d.", code);
    if (code == CE_ERR_OK || code == CE_ERR_IMAGE_PACKER_OPERATION_FAILED) {
        OH_ImageSourceNative_Release(source);
        return static_cast<int32_t>(code);
    }
    OH_ImageSourceNative_Release(source);
    return -1;
}

static int32_t TestExtensionContextStartSelfUIAbility_Normal_Extension()
{
    ContentEmbed_ExtensionContextHandle context;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedContext(g_instanceHandle, &context);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal_Extension context code: %{public}d", code);
    if (code != CE_ERR_OK) {
        return -1;
    }
    AbilityBase_Element element = {
        .bundleName = "com.example.objecteditor.test",
        .moduleName = "entry",
        .abilityName = "EntryAbility",
    };
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal_Extension want: %{public}p", want);
    code = OH_ContentEmbed_Extension_ContextStartSelfUIAbility(context, want);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal_Extension result: %{public}d", code);
    if (code == CE_ERR_SYSTEM_ABNORMAL || code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal_Extension()
{
    ContentEmbed_ExtensionContextHandle context;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedContext(g_instanceHandle, &context);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal_Extension context code: %{public}d", code);
    if (code != CE_ERR_OK) {
        return -1;
    }
    AbilityBase_Element element = {
        .bundleName = "com.example.objecteditor.test",
        .moduleName = "entry",
        .abilityName = "EntryAbility",
    };
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal_Extension want: %{public}p", want);
    AbilityRuntime_StartOptions* options = OH_AbilityRuntime_CreateStartOptions();
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal_Extension options: %{public}p", options);
    code = OH_ContentEmbed_Extension_ContextStartSelfUIAbilityWithStartOptions(context, want, options);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal_Extension result: %{public}d", code);
    if (code == CE_ERR_SYSTEM_ABNORMAL || code == CE_ERR_OK) {
        return static_cast<int32_t>(code);
    }
    return -1;
}

static int32_t TestExtensionContextTerminateAbility_Normal_Extension()
{
    ContentEmbed_ExtensionContextHandle ceContext;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedContext(g_instanceHandle,
        &ceContext);
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Extension_ContextTerminateAbility(ceContext);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextTerminateAbility_Normal_Extension ret: %{public}d",
        errCode);
    if (errCode == CE_ERR_OK || errCode == CE_ERR_SYSTEM_ABNORMAL) {
        return static_cast<int32_t>(errCode);
    }
    return -1;
}

static int32_t DocumentDataWriteToClient(ContentEmbed_Document* oeDocument, int32_t code)
{
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToClient code: %d start", code);
    ContentEmbed_Storage* rootStorage = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Document_GetRootStorage(oeDocument, &rootStorage);
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToClient OH_ContentEmbed_Document_GetRootStorage ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    const char* name = "server";
    errCode = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToClient OH_ContentEmbed_Storage_DeleteEntry ret: %{public}d",
        errCode);
    ContentEmbed_Stream* stream = nullptr;
    errCode = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToClient OH_ContentEmbed_Storage_CreateStream ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    std::string str = std::to_string(code);
    unsigned char message[BUF_SIZE] = {0};
    std::copy(str.begin(), str.end(), message);
    message[str.size()] = '\0';
    size_t num = 0;
    errCode = OH_ContentEmbed_Stream_Write(stream, message, str.size(), &num);
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToClient OH_ContentEmbed_Stream_Write ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    errCode = OH_ContentEmbed_Document_Flush(oeDocument);
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToClient OH_ContentEmbed_Document_Flush ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToClient message: %s end", str.c_str());
    return static_cast<int32_t>(errCode);
}

static int32_t DocumentDataReadFromClient(ContentEmbed_Document* oeDocument, char* message)
{
    OH_LOG_INFO(LOG_APP, "DocumentDataReadFromClient start");
    ContentEmbed_Storage* rootStorage = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Document_GetRootStorage(oeDocument, &rootStorage);
    OH_LOG_INFO(LOG_APP, "DocumentDataReadFromClient OH_ContentEmbed_Document_GetRootStorage ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    const char* name = "client";
    ContentEmbed_Stream* stream = nullptr;
    errCode = OH_ContentEmbed_Storage_GetStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "DocumentDataReadFromClient OH_ContentEmbed_Storage_GetStream ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    unsigned char *buffer = nullptr;
    size_t bytesRead = 0;
    errCode = OH_ContentEmbed_Stream_Read(stream, &buffer, BUF_SIZE, &bytesRead);
    OH_LOG_INFO(LOG_APP, "DocumentDataReadFromClient OH_ContentEmbed_Stream_Read ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    buffer[bytesRead] = '\0';
    std::copy(buffer, buffer + bytesRead + 1, message);
    delete[] buffer;
    OH_LOG_INFO(LOG_APP, "DocumentDataReadFromClient message: %s end", message);
    return static_cast<int32_t>(errCode);
}

static void NativeOnCreate(ContentEmbed_ExtensionInstanceHandle instance, AbilityBase_Want *want)
{
    OH_LOG_INFO(LOG_APP, "enter NativeOnCreate");
}

static void NativeOnDestroy(ContentEmbed_ExtensionInstanceHandle instance)
{
    OH_LOG_INFO(LOG_APP, "enter NativeOnDestroy");
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Extension_UnRegisterOnObjectAttachFunc(instance);
    OH_LOG_INFO(LOG_APP, "NativeOnDestroy OH_ContentEmbed_Extension_UnRegisterOnObjectAttachFunc ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return;
    }
    errCode = OH_ContentEmbed_Extension_UnRegisterOnObjectDetachFunc(instance);
    OH_LOG_INFO(LOG_APP, "NativeOnDestroy OH_ContentEmbed_Extension_UnRegisterOnObjectDetachFunc ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return;
    }
    ContentEmbed_ExtensionContextHandle context;
    errCode = OH_ContentEmbed_Extension_GetContentEmbedContext(g_instanceHandle, &context);
    OH_LOG_INFO(LOG_APP, "NativeOnDestroy OH_ContentEmbed_Extension_GetContentEmbedContext ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return;
    }
}

static void NativeOnDoEdit(ContentEmbed_ObjectHandle object)
{
    OH_LOG_INFO(LOG_APP, "enter NativeOnDoEdit");
}

static void NativeOnGetSnapShot(ContentEmbed_ObjectHandle object)
{
    OH_LOG_INFO(LOG_APP, "enter NativeOnGetSnapShot");
}

static int32_t HandleNormalOEidByMessage(std::string &message)
{
    int32_t result = -1;
    if (std::string(message) == std::string(testExtensionRegisterOnGetEditStatusFuncNormal)) {
        result = TestExtensionRegisterOnGetEditStatusFunc_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionRegisterOnGetCapabilityFuncNormal)) {
        result = TestExtensionRegisterOnGetCapabilityFunc_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionGetContentEmbedDocumentNormal)) {
        result = TestExtensionGetContentEmbedDocument_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionCallbackToOnUpdateNormal)) {
        result = TestExtensionCallbackToOnUpdate_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionCallbackToOnErrorNormal)) {
        result = TestExtensionCallbackToOnError_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionCallbackToOnEditingFinishedNormal)) {
        result = TestExtensionCallbackToOnEditingFinished_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionCallbackToOnExtensionStoppedNormal)) {
        result = TestExtensionCallbackToOnExtensionStopped_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionSetSnapshotNormal)) {
        result = TestExtensionSetSnapshot_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionContextStartSelfUIAbilityNormal)) {
        result = TestExtensionContextStartSelfUIAbility_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionContextStartSelfUIAbilityWithStartOptionsNormal)) {
        result = TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionContextTerminateAbilityNormal)) {
        result = TestExtensionContextTerminateAbility_Normal_Extension();
    }
    return result;
}

static int32_t HandleNormalOEid(ContentEmbed_ObjectHandle object, ContentEmbed_Document* oeDocument,
    uint32_t *bitmask)
{
    char message[BUF_SIZE] = {0};
    int32_t result = DocumentDataReadFromClient(oeDocument, message);
    OH_LOG_ERROR(LOG_APP, "HandleNormalOEid get message: %s", message);
    if (result != CE_ERR_OK) {
        *bitmask = static_cast<uint32_t>(-1);
        return result;
    }
    if (std::string(message) == std::string(testExtensionGetContextNormal)) {
        result = TestExtensionGetContent_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionGetEmbedContextNormal)) {
        result = TestExtensionGetEmbedContext_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionGetExtensionInstanceNormal)) {
        result = TestExtensionGetExtensionInstance_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionRegisterOnCreateFuncNormal)) {
        result = TestExtensionRegisterOnCreateFunc_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionRegisterOnDestroyFuncNormal)) {
        result = TestExtensionRegisterOnDestroyFunc_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionRegisterOnObjectAttachFuncNormal)) {
        result = TestExtensionRegisterOnObjectAttachFunc_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionUnRegisterOnObjectAttachFuncNormal)) {
        result = TestExtensionUnRegisterOnObjectAttachFunc_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionRegisterOnObjectDetachFuncNormal)) {
        result = TestExtensionRegisterOnObjectDetachFunc_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionUnRegisterOnObjectDetachFuncNormal)) {
        result = TestExtensionUnRegisterOnObjectDetachFunc_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionRegisterOnWriteToDataStreamFuncNormal)) {
        result = TestExtensionRegisterOnWriteToDataStreamFunc_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionRegisterOnGetSnapshotFuncNormal)) {
        result = TestExtensionRegisterOnGetSnapshotFunc_Normal_Extension();
    } else if (std::string(message) == std::string(testExtensionRegisterOnDoEditFuncNormal)) {
        result = TestExtensionRegisterOnDoEditFunc_Normal_Extension();
    } else {
        std::string msg(message);
        result = HandleNormalOEidByMessage(msg);
    }
    *bitmask = static_cast<uint32_t>(result);
    return result;
}

static void NativeOnGetCapability(ContentEmbed_ObjectHandle object, uint32_t *bitmask)
{
    OH_LOG_INFO(LOG_APP, "enter NativeOnGetCapability");
    if (!bitmask || !object) {
        OH_LOG_ERROR(LOG_APP, "bitmask is null");
        return;
    }
    ContentEmbed_Document* oeDocument = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Extension_GetContentEmbedDocument(object, &oeDocument);
    OH_LOG_ERROR(LOG_APP, "NativeOnGetCapability get document code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        *bitmask = static_cast<uint32_t>(-1);
        return;
    }
    char oeid[MAX_OEID_LENGTH] = {0};
    OH_ContentEmbed_Document_GetOEid(oeDocument, oeid);
    OH_LOG_ERROR(LOG_APP, "NativeOnGetCapability get oeid: %s", oeid);
    if (errCode != CE_ERR_OK) {
        *bitmask = static_cast<uint32_t>(-1);
        return;
    }
    if (std::string(oeid) == normalOEid) {
        HandleNormalOEid(object, oeDocument, bitmask);
    } else if (std::string(oeid) == registerOEid) {
        *bitmask = 0;
    } else {
        *bitmask = CE_CAPABILITY_SUPPORT_SNAPSHOT | CE_CAPABILITY_SUPPORT_DO_EDIT;
    }
    OH_LOG_INFO(LOG_APP, "NativeOnGetCapability bitmask: %{public}d", *bitmask);
}

static void NativeOnGetEditStatusFunc(ContentEmbed_ObjectHandle object, bool *isEditing, bool *isModified)
{
    OH_LOG_INFO(LOG_APP, "enter NativeOnGetEditStatusFunc");
    if (!isEditing || !isModified) {
        OH_LOG_ERROR(LOG_APP, "param is null");
        return;
    }
    *isEditing = true;
    *isModified = true;
}

static void NativeOnWriteToDataStream(ContentEmbed_ObjectHandle object)
{
    OH_LOG_INFO(LOG_APP, "enter NativeOnWriteToDataStream");
}

static void handleRegister(ContentEmbed_ObjectHandle object)
{
    ContentEmbed_Document* oeDocument = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Extension_GetContentEmbedDocument(object, &oeDocument);
    OH_LOG_ERROR(LOG_APP, "handleRegister get document code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return;
    }
    char oeid[MAX_OEID_LENGTH] = {0};
    errCode = OH_ContentEmbed_Document_GetOEid(oeDocument, oeid);
    OH_LOG_ERROR(LOG_APP, "handleRegister get oeid code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return;
    }
    if (std::string(oeid) == registerOEid) {
        g_objectHandle = object;
    }
    errCode = OH_ContentEmbed_Document_Flush(oeDocument);
    OH_LOG_ERROR(LOG_APP, "handleRegister flush document code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return;
    }
}

static void RegisterOnObjectAttachFunc(ContentEmbed_ExtensionInstanceHandle instance,
    ContentEmbed_ObjectHandle object)
{
    ContentEmbed_ErrorCode ret = CE_ERR_OK;
    ret = OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc(object, NativeOnWriteToDataStream);
    OH_LOG_INFO(LOG_APP, "RegisterOnObjectAttachFunc RegisterOnWriteToDataStreamFunc ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
    ret = OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc(object, NativeOnGetCapability);
    OH_LOG_INFO(LOG_APP, "RegisterOnObjectAttachFunc RegisterOnGetCapabilityFunc ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
    ret = OH_ContentEmbed_Extension_RegisterOnDoEditFunc(object, NativeOnDoEdit);
    OH_LOG_INFO(LOG_APP, "RegisterOnObjectAttachFunc RegisterOnDoEditFunc ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
    ret = OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc(object, NativeOnGetSnapShot);
    OH_LOG_INFO(LOG_APP, "RegisterOnObjectAttachFunc RegisterOnGetSnapshotFunc ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
    ret = OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc(object, NativeOnGetEditStatusFunc);
    OH_LOG_INFO(LOG_APP, "RegisterOnObjectAttachFunc RegisterOnGetEditStatusFunc ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
    handleRegister(object);
}

static void RegisterOnObjectDetachFunc(ContentEmbed_ExtensionInstanceHandle instance,
    ContentEmbed_ObjectHandle object)
{
    OH_LOG_INFO(LOG_APP, "enter RegisterOnObjectDetachFunc");
}

extern "C" void OH_AbilityRuntime_OnNativeExtensionCreate(AbilityRuntime_ExtensionInstance *instance,
    const char *abilityName)
{
    OH_LOG_INFO(LOG_APP, "enter OH_AbilityRuntime_OnNativeExtensionCreate");
    g_abilityExtensionInstanceHandle = instance;
    if (instance == nullptr) {
        OH_LOG_ERROR(LOG_APP, "instance is null");
        return;
    }
    ContentEmbed_ErrorCode ret = OH_ContentEmbed_Extension_GetExtensionInstance(instance, &g_instanceHandle);
    OH_LOG_INFO(LOG_APP, "create OH_ContentEmbed_Extension_GetExtensionInstance ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
    ContentEmbed_ExtensionContextHandle ceContext;
    ret = OH_ContentEmbed_Extension_GetContentEmbedContext(g_instanceHandle, &ceContext);
    OH_LOG_INFO(LOG_APP, "create OH_ContentEmbed_Extension_GetContentEmbedContext ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
    ret = OH_ContentEmbed_Extension_GetContext(ceContext, &g_context);
    OH_LOG_INFO(LOG_APP, "create OH_ContentEmbed_Extension_GetContext ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
    ret = OH_ContentEmbed_Extension_RegisterOnCreateFunc(g_instanceHandle, NativeOnCreate);
    OH_LOG_INFO(LOG_APP, "create OH_ContentEmbed_Extension_RegisterOnCreateFunc ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
    ret = OH_ContentEmbed_Extension_RegisterOnDestroyFunc(g_instanceHandle, NativeOnDestroy);
    OH_LOG_INFO(LOG_APP, "create OH_ContentEmbed_Extension_RegisterOnDestroyFunc ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
    ret = OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc(g_instanceHandle, RegisterOnObjectAttachFunc);
    OH_LOG_INFO(LOG_APP, "create OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
    ret = OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc(g_instanceHandle, RegisterOnObjectDetachFunc);
    OH_LOG_INFO(LOG_APP, "create OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc ret: %{public}d", ret);
    if (ret != CE_ERR_OK) {
        return;
    }
}
