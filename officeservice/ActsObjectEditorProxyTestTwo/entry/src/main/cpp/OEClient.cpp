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

#include <fstream>
#include <string>
#include <cstring>
#include <rawfile/raw_file_manager.h>
#include <AbilityKit/ability_runtime/application_context.h>
#include <ContentEmbedKit/content_embed/content_embed_common.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_proxy.h>
#include <hilog/log.h>
#include "ObjectEditor.h"

constexpr int32_t ARGS_COUNT = 4;
static bool g_IsSupport = false;
static ContentEmbed_ExtensionProxy* g_proxy = nullptr;
static ContentEmbed_ExtensionProxy* g_registerProxy = nullptr;
static void* g_contextPtr = nullptr;
static std::string normalOEid = "000209FF-BBBB-DDDD-CAAA-000000000046";
static const size_t FILE_PATH_SIZE = 256;
static constexpr int32_t TEST_LIMIT = 100;

const char* testExtensionGetContextNormal = "testExtensionGetContextNormal";
const char* testExtensionGetEmbedContextNormal = "testExtensionGetEmbedContextNormal";
const char* testExtensionGetExtensionInstanceNormal = "testExtensionGetExtensionInstanceNormal";
const char* testExtensionRegisterOnCreateFuncNormal = "testExtensionRegisterOnCreateFuncNormal";
const char* testExtensionRegisterOnDestroyFuncNormal = "testExtensionRegisterOnDestroyFuncNormal";
const char* testExtensionRegisterOnObjectAttachFuncNormal = "testExtensionRegisterOnObjectAttachFuncNormal";
const char* testExtensionUnRegisterOnObjectAttachFuncNormal = "testExtensionUnRegisterOnObjectAttachFuncNormal";
const char* testExtensionRegisterOnObjectDetachFuncNormal = "testExtensionRegisterOnObjectDetachFuncNormal";
const char* testExtensionUnRegisterOnObjectDetachFuncNormal = "testExtensionUnRegisterOnObjectDetachFuncNormal";
const char* testExtensionRegisterOnWriteToDataStreamFuncNormal =
    "testExtensionRegisterOnWriteToDataStreamFuncNormal";
const char* testExtensionRegisterOnGetSnapshotFuncNormal = "testExtensionRegisterOnGetSnapshotFuncNormal";
const char* testExtensionRegisterOnDoEditFuncNormal = "testExtensionRegisterOnDoEditFuncNormal";
const char* testExtensionRegisterOnGetEditStatusFuncNormal = "testExtensionRegisterOnGetEditStatusFuncNormal";
const char* testExtensionRegisterOnGetCapabilityFuncNormal = "testExtensionRegisterOnGetCapabilityFuncNormal";
const char* testExtensionGetContentEmbedDocumentNormal = "testExtensionGetContentEmbedDocumentNormal";
const char* testExtensionCallbackToOnUpdateNormal = "testExtensionCallbackToOnUpdateNormal";
const char* testExtensionCallbackToOnErrorNormal = "testExtensionCallbackToOnErrorNormal";
const char* testExtensionCallbackToOnEditingFinishedNormal = "testExtensionCallbackToOnEditingFinishedNormal";
const char* testExtensionCallbackToOnExtensionStoppedNormal = "testExtensionCallbackToOnExtensionStoppedNormal";
const char* testExtensionSetSnapshotNormal = "testExtensionSetSnapshotNormal";
const char* testExtensionContextStartSelfUIAbilityNormal = "testExtensionContextStartSelfUIAbilityNormal";
const char* testExtensionContextStartSelfUIAbilityWithStartOptionsNormal =
    "testExtensionContextStartSelfUIAbilityWithStartOptionsNormal";
const char* testExtensionContextTerminateAbilityNormal = "testExtensionContextTerminateAbilityNormal";

void ClientCallBack_OnUpdateFunc(ContentEmbed_ExtensionProxy *proxy)
{
    OH_LOG_INFO(LOG_APP, "Enter ClientCallBack_OnUpdateFunc");
}

void ClientCallBack_OnErrorFunc(ContentEmbed_ExtensionProxy *proxy, ContentEmbed_ErrorCode error)
{
    OH_LOG_INFO(LOG_APP, "Enter ClientCallBack_OnErrorFunc, error: %{public}d", error);
}

void ClientCallback_OnEditingFinishedFunc(ContentEmbed_ExtensionProxy *proxy, bool dataModified)
{
    OH_LOG_INFO(LOG_APP, "Enter ClientCallback_OnEditingFinishedFunc, dataModified: %{public}d",
        dataModified);
}

void ClientCallback_OnExtensionStoppedFunc(ContentEmbed_ExtensionProxy *proxy)
{
    OH_LOG_INFO(LOG_APP, "Enter ClientCallback_OnExtensionStoppedFunc");
}

static ContentEmbed_ErrorCode ProxyRegisterCallback(ContentEmbed_ExtensionProxy *proxy)
{
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(proxy, ClientCallBack_OnUpdateFunc);
    OH_LOG_INFO(LOG_APP, "CreateProxy OH_ContentEmbed_Proxy_RegisterOnUpdateFunc ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return errCode;
    }
    errCode = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(proxy, ClientCallBack_OnErrorFunc);
    OH_LOG_INFO(LOG_APP, "CreateProxy OH_ContentEmbed_Proxy_RegisterOnErrorFunc ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return errCode;
    }
    errCode = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(proxy, ClientCallback_OnEditingFinishedFunc);
    OH_LOG_INFO(LOG_APP, "CreateProxy OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return errCode;
    }
    errCode = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(proxy, ClientCallback_OnExtensionStoppedFunc);
    OH_LOG_INFO(LOG_APP, "CreateProxy OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc ret: %{public}d", errCode);
    return errCode;
}

static ContentEmbed_ErrorCode CreateProxy(void* contextPtr, ContentEmbed_Document *oeDocument,
    ContentEmbed_ExtensionProxy** proxy)
{
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateExtensionProxy(oeDocument, proxy, contextPtr);
    OH_LOG_INFO(LOG_APP, "CreateProxy OH_ContentEmbed_CreateExtensionProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_CreateExtensionProxy failed");
        return errCode;
    }
    ProxyRegisterCallback(*proxy);
    errCode = OH_ContentEmbed_Proxy_StartWork(*proxy);
    OH_LOG_INFO(LOG_APP, "CreateProxy OH_ContentEmbed_Proxy_StartWork ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return errCode;
    }
    OH_LOG_INFO(LOG_APP, "CreateProxy start work success");
    return errCode;
}

static void HandleRegisterOEid()
{
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000041";
    ContentEmbed_Document* oeDocument;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(oeid, &oeDocument);
    OH_LOG_INFO(LOG_APP, "HandleRegisterOEid OH_ContentEmbed_CreateDocumentByOEid ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return;
    }
    errCode = CreateProxy(g_contextPtr, oeDocument, &g_registerProxy);
    OH_LOG_INFO(LOG_APP, "HandleRegisterOEid CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return;
    }
}

napi_value initObjectServiceConnect(napi_env env, napi_callback_info info)
{
    size_t argc = ARGS_COUNT;
    napi_value args[ARGS_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_value nativeContext = args[0];
    void* contextPtr = nullptr;
    napi_ref tmp = nullptr;
    napi_create_reference(env, nativeContext, 1, &tmp);
    napi_unwrap(env, nativeContext, &contextPtr);
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000046";
    ContentEmbed_Document* oeDocument;
    napi_value result;
    g_contextPtr = contextPtr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(oeid, &oeDocument);
    OH_LOG_INFO(LOG_APP, "initObjectServiceConnect OH_ContentEmbed_CreateDocumentByOEid ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        g_IsSupport = false;
        napi_create_int32(env, errCode, &result);
        return result;
    }
    g_IsSupport = true;
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_CreateDocumentByOEid failed");
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "initObjectServiceConnect CreateProxy ret: %{public}d", errCode);
    if (errCode == CE_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        g_proxy = proxy;
        HandleRegisterOEid();
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static int32_t DocumentDataWriteToServer(ContentEmbed_Document* oeDocument, const char* message)
{
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToServer message: %s start", message);
    ContentEmbed_Storage* rootStorage = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Document_GetRootStorage(oeDocument, &rootStorage);
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToServer OH_ContentEmbed_Document_GetRootStorage ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    const char* name = "client";
    errCode = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToServer OH_ContentEmbed_Storage_DeleteEntry ret: %{public}d",
        errCode);
    ContentEmbed_Stream* stream = nullptr;
    errCode = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToServer OH_ContentEmbed_Storage_CreateStream ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    size_t len = strlen(message);
    size_t num = 0;
    errCode = OH_ContentEmbed_Stream_Write(stream, (unsigned char *)message, len, &num);
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToServer OH_ContentEmbed_Stream_Write ret:%{public}d num:%{public}d",
        errCode, num);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    errCode = OH_ContentEmbed_Document_Flush(oeDocument);
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToServer OH_ContentEmbed_Document_Flush ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DocumentDataWriteToServer message: %s end", message);
    return static_cast<int32_t>(errCode);
}

static int32_t DocumentDataReadFromServer(ContentEmbed_Document* oeDocument)
{
    OH_LOG_INFO(LOG_APP, "DocumentDataReadFromServer start");
    ContentEmbed_Storage* rootStorage = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Document_GetRootStorage(oeDocument, &rootStorage);
    OH_LOG_INFO(LOG_APP, "DocumentDataReadFromServer OH_ContentEmbed_Document_GetRootStorage ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    const char* name = "server";
    ContentEmbed_Stream* stream = nullptr;
    errCode = OH_ContentEmbed_Storage_GetStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "DocumentDataReadFromServer OH_ContentEmbed_Storage_GetStream ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    unsigned char *buffer = nullptr;
    size_t bytesRead = 0;
    errCode = OH_ContentEmbed_Stream_Read(stream, &buffer, BUF_SIZE, &bytesRead);
    OH_LOG_INFO(LOG_APP, "DocumentDataReadFromServer OH_ContentEmbed_Stream_Read ret: %{public}d",
        errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    buffer[bytesRead] = '\0';
    char* endptr = nullptr;
    long num = strtol(reinterpret_cast<char *>(buffer), &endptr, 10);
    if (endptr == reinterpret_cast<char *>(buffer) || *endptr != '\0') {
        OH_LOG_ERROR(LOG_APP, "DocumentDataReadFromServer strtol failed");
        delete[] buffer;
        return -1;
    }
    if (num < INT32_MIN || num > INT32_MAX) {
        OH_LOG_ERROR(LOG_APP, "DocumentDataReadFromServer strtol failed");
        delete[] buffer;
        return -1;
    }
    int32_t result = static_cast<int32_t>(num);
    OH_LOG_INFO(LOG_APP, "DocumentDataReadFromServer message: %d end", result);
    delete[] buffer;
    return static_cast<int32_t>(errCode);
}

static int32_t WriteDocumentToSandbox(ContentEmbed_Document *document)
{
    char filePath[FILE_PATH_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code =
        OH_AbilityRuntime_ApplicationContextGetFilesDir(filePath, FILE_PATH_SIZE, &writeLength);
    napi_value result;
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "WriteDocumentToSandbox OH_AbilityRuntime_ApplicationContextGetFilesDir failed");
        return -1;
    }
    std::string fullPath = std::string(filePath) + "/ole.bin";
    std::ofstream file(fullPath, std::ios::binary | std::ios::out);
    if (!file.is_open()) {
        OH_LOG_ERROR(LOG_APP, "WriteDocumentToSandbox file open failed");
        return -1;
    }
    const size_t CHUNK_SIZE = 4096; // 分块大小
    uint8_t *buffer = new (std::nothrow) uint8_t[CHUNK_SIZE + 1];
    ContentEmbed_ErrorCode errCode = CE_ERR_OK;
    size_t offset = 0;
    size_t actualRead = 0;
    do {
        errCode = OH_ContentEmbed_Document_Read(buffer, CHUNK_SIZE, document, offset, &actualRead);
        OH_LOG_INFO(LOG_APP, "WriteDocumentToSandbox read ret:%{public}d offset:%{public}d actualRead:%{public}d",
            errCode, offset, actualRead);
        if (errCode != CE_ERR_OK || actualRead == 0) {
            OH_LOG_INFO(LOG_APP, "WriteDocumentToSandbox OH_ContentEmbed_Document_Read failed");
            break;
        }
        file.write(reinterpret_cast<char*>(buffer), actualRead);
        if (!file) {
            OH_LOG_ERROR(LOG_APP, "WriteDocumentToSandbox file write failed");
            errCode = CE_ERR_FILE_OPERATION_FAILED;
            break;
        }
        offset += actualRead;
    } while (true);
    OH_LOG_INFO(LOG_APP, "WriteDocumentToSandbox end offset:%{public}d", static_cast<int32_t>(offset));
    delete[] buffer;
    file.close();
    return static_cast<int32_t>(errCode);
}

static int32_t LoadDocumentFromSandbox(ContentEmbed_ExtensionProxy** proxy)
{
    char filePath[FILE_PATH_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code =
        OH_AbilityRuntime_ApplicationContextGetFilesDir(filePath, FILE_PATH_SIZE, &writeLength);
    napi_value result;
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "WriteDocumentToSandbox OH_AbilityRuntime_ApplicationContextGetFilesDir failed");
        return -1;
    }
    std::string fullPath = std::string(filePath) + "/ole.bin";
    ContentEmbed_Document* oeDocument;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_LoadDocumentFromFile(fullPath.c_str(),
        fullPath.size(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "LoadDocumentFromSandbox OH_ContentEmbed_LoadDocumentFromFile ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    errCode = CreateProxy(g_contextPtr, oeDocument, proxy);
    OH_LOG_INFO(LOG_APP, "LoadDocumentFromSandbox CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "LoadDocumentFromSandbox start work success");
    return static_cast<int32_t>(errCode);
}

napi_value TestExtensionGetContent_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContent_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContent_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionGetContextNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContent_Normal write to server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContent_Normal write to sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContent_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContent_Normal DestroyExtensionProxy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContent_Normal load document from sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContent_Normal getCapability ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestDocumentStreamRead_Normal(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!g_IsSupport) {
        napi_create_int32(env, CE_ERR_DEVICE_NOT_SUPPORTED, &result);
        return result;
    }
    ContentEmbed_Document* oeDocument = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_GetDocument(g_proxy, &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestDocumentStreamRead_Normal get document ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage* rootStorage = nullptr;
    errCode = OH_ContentEmbed_Document_GetRootStorage(oeDocument, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestDocumentStreamRead_Normal get root storage ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    const char* name = "normal";
    ContentEmbed_Stream* stream = nullptr;
    errCode = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestDocumentStreamRead_Normal create stream ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    unsigned char message[] = "test";
    size_t num = 0;
    errCode = OH_ContentEmbed_Stream_Write(stream, message, 4, &num); // 4: message length
    OH_LOG_INFO(LOG_APP, "TestDocumentStreamRead_Normal write ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    unsigned char *buffer = nullptr;
    size_t bytesRead = 0;
    errCode = OH_ContentEmbed_Stream_Read(stream, &buffer, BUF_SIZE, &bytesRead);
    OH_LOG_INFO(LOG_APP, "TestDocumentStreamRead_Normal read ret: %{public}d", errCode);
    if (errCode == CE_ERR_OK) {
        delete[] buffer;
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestExtensionGetEmbedContent_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetEmbedContent_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetEmbedContent_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionGetEmbedContextNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetEmbedContent_Normal write to server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetEmbedContent_Normal write to sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetEmbedContent_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetEmbedContent_Normal DestroyExtensionProxy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetEmbedContent_Normal load document from sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetEmbedContent_Normal getCapability ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionGetExtensionInstance_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionGetExtensionInstanceNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_Normal write to server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_Normal write to sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_Normal DestroyExtensionProxy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_Normal load document from sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_Normal getCapability ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionRegisterOnCreateFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionRegisterOnCreateFuncNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc_Normal write to server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc_Normal write ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc getCapability ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionRegisterOnDestroyFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionRegisterOnDestroyFuncNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc getCapability ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionRegisterOnObjectAttachFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectAttachFunc_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectAttachFunc_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionRegisterOnObjectAttachFuncNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectAttachFunc_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectAttachFunc_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectAttachFunc_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectAttachFunc_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectAttachFunc_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectAttachFunc getCapability ret:%{public}d, bitmask:%{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionUnRegisterOnObjectAttachFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectAttachFunc_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectAttachFunc_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionUnRegisterOnObjectAttachFuncNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectAttachFunc_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectAttachFunc_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectAttachFunc_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectAttachFunc_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectAttachFunc_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectAttachFunc ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionRegisterOnObjectDetachFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectDetachFunc_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectDetachFunc_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionRegisterOnObjectDetachFuncNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectDetachFunc_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectDetachFunc_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectDetachFunc_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectDetachFunc_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectDetachFunc_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectDetachFunc ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionUnRegisterOnObjectDetachFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectDetachFunc_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectDetachFunc_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionUnRegisterOnObjectDetachFuncNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectDetachFunc_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectDetachFunc_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectDetachFunc_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectDetachFunc_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectDetachFunc_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectDetachFunc ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionRegisterOnWriteToDataStreamFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnWriteToDataStreamFunc_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnWriteToDataStreamFunc_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionRegisterOnWriteToDataStreamFuncNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnWriteToDataStreamFunc_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnWriteToDataStreamFunc_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnWriteToDataStreamFunc_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnWriteToDataStreamFunc_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnWriteToDataStreamFunc_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnWriteToDataStreamFunc ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionRegisterOnGetSnapshotFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetSnapshotFunc_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetSnapshotFunc_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionRegisterOnGetSnapshotFuncNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetSnapshotFunc_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetSnapshotFunc_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetSnapshotFunc_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetSnapshotFunc_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetSnapshotFunc_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetSnapshotFunc ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionRegisterOnDoEditFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDoEditFunc_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDoEditFunc_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionRegisterOnDoEditFuncNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDoEditFunc_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDoEditFunc_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDoEditFunc_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDoEditFunc_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDoEditFunc_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDoEditFunc ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionRegisterOnGetEditStatusFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetEditStatusFunc_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetEditStatusFunc_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionRegisterOnGetEditStatusFuncNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetEditStatusFunc_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetEditStatusFunc_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetEditStatusFunc_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetEditStatusFunc_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetEditStatusFunc_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetEditStatusFunc ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionRegisterOnGetCapabilityFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetCapabilityFunc_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetCapabilityFunc_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionRegisterOnGetCapabilityFuncNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetCapabilityFunc_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetCapabilityFunc_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetCapabilityFunc_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetCapabilityFunc_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetCapabilityFunc_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetCapabilityFunc ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionGetContentEmbedDocument_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionGetContentEmbedDocumentNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionCallbackToOnUpdate_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionCallbackToOnUpdateNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionCallbackToOnError_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionCallbackToOnErrorNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionCallbackToOnEditingFinished_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionCallbackToOnEditingFinishedNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionCallbackToOnExtensionStopped_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStopped_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStopped_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionCallbackToOnExtensionStoppedNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStopped_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStopped_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStopped_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStopped_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStopped_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(CE_ERR_OK), &result);
    return result;
}

napi_value TestExtensionSetSnapshot_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionSetSnapshotNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionSetSnapshot ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionContextStartSelfUIAbility_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionContextStartSelfUIAbilityNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbility ret: %{public}d, bitmask: %{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbilityWithStartOptions document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbilityWithStartOptions proxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionContextStartSelfUIAbilityWithStartOptionsNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbilityWithStartOptions write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbilityWithStartOptions write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbilityWithStartOptions StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbilityWithStartOptions destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbilityWithStartOptions load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextStartSelfUIAbilityWithStartOption ret:%{public}d, bitmask:%{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestExtensionContextTerminateAbility_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextTerminateAbility_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextTerminateAbility_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionContextTerminateAbilityNormal);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextTerminateAbility_Normal write server ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextTerminateAbility_Normal write sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextTerminateAbility_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextTerminateAbility_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextTerminateAbility_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestExtensionContextTerminateAbility ret:%{public}d, bitmask:%{public}d",
        errCode, bitmask);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(bitmask), &result);
    return result;
}

napi_value TestProxyGetSnapshot_NotSupported(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!g_IsSupport) {
        napi_create_int32(env, CE_ERR_DEVICE_NOT_SUPPORTED, &result);
        return result;
    }
    HandleRegisterOEid();
    OH_PixelmapNative *snapshot = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_GetSnapshot(g_registerProxy, &snapshot);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_NotSupported code: %{public}d", errCode);
    if (errCode == CE_ERR_EXTENSION_NOT_SUPPORT) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyGetSnapshot_ExtensionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!g_IsSupport) {
        napi_create_int32(env, CE_ERR_DEVICE_NOT_SUPPORTED, &result);
        return result;
    }
    HandleRegisterOEid();
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_StopWork(g_registerProxy);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_ExtensionError stop work code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_PixelmapNative *snapshot = nullptr;
    errCode = OH_ContentEmbed_Proxy_GetSnapshot(g_registerProxy, &snapshot);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_ExtensionError code: %{public}d", errCode);
    if (errCode == CE_ERR_EXTENSION_ERROR) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyGetSnapshot_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_Normal CreateProxy ret: %{public}d", errCode);
    int32_t ret = DocumentDataWriteToServer(oeDocument, testExtensionSetSnapshotNormal);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_Normal write server ret: %{public}d", ret);
    ret = WriteDocumentToSandbox(oeDocument);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_Normal write sandbox ret: %{public}d", ret);
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_Normal destroy ret: %{public}d", errCode);
    proxy = nullptr;
    ret = LoadDocumentFromSandbox(&proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_Normal load document ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_Normal ret: %{public}d, bitmask: %{public}d", errCode, bitmask);
    OH_PixelmapNative *snapshot = nullptr;
    errCode = OH_ContentEmbed_Proxy_GetSnapshot(proxy, &snapshot);
    if (errCode == CE_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, CE_ERR_OK, &result);
    return result;
}

napi_value TestProxyStartWork_Error(napi_env env, napi_callback_info info)
{
    char oeid[] = "111209FF-BBBB-DDDD-CAAA-220000000046";
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(oeid, &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Error document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = OH_ContentEmbed_CreateExtensionProxy(oeDocument, &proxy, g_contextPtr);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Error proxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(proxy, ClientCallBack_OnUpdateFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Error updatefunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(proxy, ClientCallBack_OnErrorFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Error errorfunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(proxy, ClientCallback_OnEditingFinishedFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Error editingfinishedfunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(proxy, ClientCallback_OnExtensionStoppedFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Error extensionstoppedfunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_StartWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Error startwork ret: %{public}d", errCode);
    if (errCode == CE_ERR_SYSTEM_ABNORMAL) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyStartWork_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000041";
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(oeid, &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = OH_ContentEmbed_CreateExtensionProxy(oeDocument, &proxy, g_contextPtr);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal proxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(proxy, ClientCallBack_OnUpdateFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal updatefunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(proxy, ClientCallBack_OnErrorFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal errorfunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(proxy, ClientCallback_OnEditingFinishedFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal editingfinishedfunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(proxy, ClientCallback_OnExtensionStoppedFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal extensionstoppedfunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_StartWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal startwork ret: %{public}d", errCode);
    if (errCode == CE_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyStopWork_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000041";
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(oeid, &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = OH_ContentEmbed_CreateExtensionProxy(oeDocument, &proxy, g_contextPtr);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal proxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(proxy, ClientCallBack_OnUpdateFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal updatefunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(proxy, ClientCallBack_OnErrorFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal errorfunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(proxy, ClientCallback_OnEditingFinishedFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal editingfinishedfunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(proxy, ClientCallback_OnExtensionStoppedFunc);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal extensionstoppedfunc ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_Proxy_StartWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyStartWork_Normal startwork ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyStopWork_Normal stopwork ret: %{public}d", errCode);
    if (errCode == CE_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyDoEdit_NotSupported(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!g_IsSupport) {
        napi_create_int32(env, CE_ERR_DEVICE_NOT_SUPPORTED, &result);
        return result;
    }
    HandleRegisterOEid();
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_DoEdit(g_registerProxy);
    OH_LOG_INFO(LOG_APP, "TestProxyDoEdit_NotSupported code: %{public}d", errCode);
    if (errCode == CE_ERR_EXTENSION_NOT_SUPPORT) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyDoEdit_ExtensionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!g_IsSupport) {
        napi_create_int32(env, CE_ERR_DEVICE_NOT_SUPPORTED, &result);
        return result;
    }
    HandleRegisterOEid();
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_StopWork(g_registerProxy);
    OH_LOG_INFO(LOG_APP, "TestProxyDoEdit_ExtensionError stop work code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_DoEdit(g_registerProxy);
    OH_LOG_INFO(LOG_APP, "TestProxyDoEdit_ExtensionError code: %{public}d", errCode);
    if (errCode == CE_ERR_EXTENSION_ERROR) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyDoEdit_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestProxyDoEdit_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyDoEdit_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    errCode = OH_ContentEmbed_Proxy_DoEdit(proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyDoEdit_Normal code: %{public}d", errCode);
    if (errCode == CE_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyGetEditStatus_ExtensionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!g_IsSupport) {
        napi_create_int32(env, CE_ERR_DEVICE_NOT_SUPPORTED, &result);
        return result;
    }
    HandleRegisterOEid();
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_StopWork(g_registerProxy);
    OH_LOG_INFO(LOG_APP, "TestProxyDoEdit_ExtensionError stop work code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    bool isEditing = false;
    bool isModified = false;
    errCode = OH_ContentEmbed_Proxy_GetEditStatus(g_registerProxy, &isEditing, &isModified);
    OH_LOG_INFO(LOG_APP, "TestProxyDoEdit_ExtensionError code: %{public}d", errCode);
    if (errCode == CE_ERR_EXTENSION_ERROR) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyGetEditStatus_Normal(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!g_IsSupport) {
        napi_create_int32(env, CE_ERR_DEVICE_NOT_SUPPORTED, &result);
        return result;
    }
    HandleRegisterOEid();
    bool isEditing = false;
    bool isModified = false;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_GetEditStatus(g_registerProxy, &isEditing, &isModified);
    OH_LOG_INFO(LOG_APP, "TestProxyGetEditStatus_Normal code: %{public}d", errCode);
    if (errCode == CE_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyGetCapability_ExtensionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!g_IsSupport) {
        napi_create_int32(env, CE_ERR_DEVICE_NOT_SUPPORTED, &result);
        return result;
    }
    HandleRegisterOEid();
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_StopWork(g_registerProxy);
    OH_LOG_INFO(LOG_APP, "TestProxyDoEdit_ExtensionError stop work code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(g_registerProxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestProxyGetCapability_ExtensionError code: %{public}d", errCode);
    if (errCode == CE_ERR_EXTENSION_ERROR) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyGetCapability_Normal(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!g_IsSupport) {
        napi_create_int32(env, CE_ERR_DEVICE_NOT_SUPPORTED, &result);
        return result;
    }
    HandleRegisterOEid();
    uint32_t bitmask = 0;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_GetCapability(g_registerProxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestProxyGetCapability_Normal code: %{public}d", errCode);
    if (errCode == CE_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestProxyMultiExtension_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_Normal document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    ContentEmbed_ExtensionProxy* proxy = nullptr;
    errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
    OH_LOG_INFO(LOG_APP, "TestProxyGetSnapshot_Normal CreateProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    HandleRegisterOEid();
    errCode = OH_ContentEmbed_Proxy_StopWork(g_registerProxy);
    OH_LOG_INFO(LOG_APP, "TestProxyDoEdit_ExtensionError stop work code: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint32_t bitmask = 0;
    errCode = OH_ContentEmbed_Proxy_GetCapability(proxy, &bitmask);
    OH_LOG_INFO(LOG_APP, "TestProxyMultiExtension_Normal code: %{public}d", errCode);
    if (errCode == CE_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value TestStartWorkLimit(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document* oeDocument;
    napi_value result;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
    OH_LOG_INFO(LOG_APP, "TestStartWorkLimit document ret: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "TestStartWorkLimit CreateProxy ret: %{public}d", errCode);
    for (int i = 0; i < TEST_LIMIT; ++i) {
        errCode = OH_ContentEmbed_CreateDocumentByOEid(normalOEid.c_str(), &oeDocument);
        OH_LOG_INFO(LOG_APP, "TestStartWorkLimit document ret: %{public}d", errCode);
        if (errCode != CE_ERR_OK) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        ContentEmbed_ExtensionProxy* proxy = nullptr;
        errCode = CreateProxy(g_contextPtr, oeDocument, &proxy);
        OH_LOG_INFO(LOG_APP, "TestStartWorkLimit CreateProxy ret: %{public}d", errCode);
        if (errCode == CE_ERR_CONNECT_LIMIT_EXCEED) {
            napi_create_int32(env, errCode, &result);
            return result;
        }
        errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
        OH_LOG_INFO(LOG_APP, "TestStartWorkLimit DestroyExtensionProxy ret: %{public}d", errCode);
    }
    napi_create_int32(env, -1, &result);
    return result;
}
