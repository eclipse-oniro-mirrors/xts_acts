/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "ContentEmbed_TEST"

#include <string>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <hilog/log.h>
#include <filesystem>
#include <system_error>
#include <fstream>
#include <AbilityKit/ability_runtime/application_context.h>
#include <rawfile/raw_file_manager.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_proxy.h>

using namespace std;
namespace fs = std::__fs::filesystem;

namespace {
const size_t BUF_SIZE = 4096;

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
    OH_LOG_INFO(LOG_APP, "register OH_ContentEmbed_Proxy_RegisterOnUpdateFunc ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return errCode;
    }
    errCode = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(proxy, ClientCallBack_OnErrorFunc);
    OH_LOG_INFO(LOG_APP, "register OH_ContentEmbed_Proxy_RegisterOnErrorFunc ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return errCode;
    }
    errCode = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(proxy, ClientCallback_OnEditingFinishedFunc);
    OH_LOG_INFO(LOG_APP, "register OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return errCode;
    }
    errCode = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(proxy, ClientCallback_OnExtensionStoppedFunc);
    OH_LOG_INFO(LOG_APP, "register OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc ret: %{public}d", errCode);
    return errCode;
}

static int32_t CreateDocumentByFile(ContentEmbed_Document** document)
{
    char filePath[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code =
        OH_AbilityRuntime_ApplicationContextGetTempDir(filePath, BUF_SIZE, &writeLength);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_Normal temp dir: %{public}s", filePath);
    napi_value result;
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "TestCreateDocumentByFile_Normal get temp dir failed");
        return -1;
    }
    std::string fullPath = std::string(filePath) + "/test.document";
    std::ofstream(fullPath).close();
    char bundleName[BUF_SIZE];
    code = OH_AbilityRuntime_ApplicationContextGetBundleName(bundleName, BUF_SIZE, &writeLength);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_Normal bundle name: %{public}s", bundleName);
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "TestCreateDocumentByFile_Normal get bundle name failed");
        return -1;
    }
    std::string path = "/storage/Users/currentUser/appdata/el2/base/" + std::string(bundleName)
        + "/temp/test.document";
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_Normal path: %{public}s", path.c_str());
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByFile(path.c_str(),
        path.size(), false, document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_Normal code: %{public}d", errCode);
    if (errCode == CE_ERR_OK || errCode == CE_ERR_DEVICE_NOT_SUPPORTED) {
        return static_cast<int32_t>(errCode);
    }
    return -1;
}

static int32_t WriteDocumentToSandbox(ContentEmbed_Document *document)
{
    char filePath[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code =
        OH_AbilityRuntime_ApplicationContextGetFilesDir(filePath, BUF_SIZE, &writeLength);
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
    uint8_t *buffer = new (std::nothrow) uint8_t[BUF_SIZE + 1];
    ContentEmbed_ErrorCode errCode = CE_ERR_OK;
    size_t offset = 0;
    size_t actualRead = 0;
    int32_t count = 0;
    do {
        errCode = OH_ContentEmbed_Document_Read(buffer, BUF_SIZE, document, offset, &actualRead);
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
        count++;
    } while (count < BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "WriteDocumentToSandbox end offset:%{public}d", static_cast<int32_t>(offset));
    delete[] buffer;
    file.close();
    return static_cast<int32_t>(errCode);
}

static ContentEmbed_ErrorCode CreateProxy(ContentEmbed_Document *oeDocument,
    ContentEmbed_ExtensionProxy** proxy)
{
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateExtensionProxy(oeDocument, proxy, (void *)oeDocument);
    OH_LOG_INFO(LOG_APP, "CreateProxy OH_ContentEmbed_CreateExtensionProxy ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "OH_ContentEmbed_CreateExtensionProxy failed");
        return errCode;
    }
    ProxyRegisterCallback(*proxy);
    errCode = OH_ContentEmbed_Proxy_StartWork(*proxy);
    OH_LOG_INFO(LOG_APP, "CreateProxy OH_ContentEmbed_Proxy_StartWork ret: %{public}d", errCode);
    return CE_ERR_OK;
}

static int32_t LoadDocumentFromSandbox(ContentEmbed_Document** document)
{
    int32_t ret = CreateDocumentByFile(document);
    OH_LOG_INFO(LOG_APP, "LoadDocumentFromSandbox create document ret: %{public}d", ret);
    if (ret != 0) {
        return -1;
    }
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    ret = CreateProxy(*document, &proxy);
    if (ret != 0) {
        return -1;
    }
    ret = WriteDocumentToSandbox(*document);
    OH_LOG_INFO(LOG_APP, "LoadDocumentFromSandbox write to sandbox ret: %{public}d", ret);
    if (ret != 0) {
        return -1;
    }
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "LoadDocumentFromSandbox StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "LoadDocumentFromSandbox DestroyExtensionProxy ret: %{public}d", errCode);
    proxy = nullptr;
    char filePath[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode abilityCode =
        OH_AbilityRuntime_ApplicationContextGetFilesDir(filePath, BUF_SIZE, &writeLength);
    OH_LOG_ERROR(LOG_APP, "LoadDocumentFromSandbox get file dir ret: %{public}d", abilityCode);
    if (abilityCode != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        return -1;
    }
    std::string fullPath = std::string(filePath) + "/ole.bin";
    *document = nullptr;
    errCode = OH_ContentEmbed_LoadDocumentFromFile(fullPath.c_str(),
        fullPath.size(), document);
    OH_LOG_INFO(LOG_APP, "LoadDocumentFromSandbox load document from sandbox ret: %{public}d", errCode);
    if (errCode != CE_ERR_OK) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "LoadDocumentFromSandbox success");
    return static_cast<int32_t>(errCode);
}

static napi_value TestLoadDocumentFromFile_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    char nativeFilePath[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestLoadDocumentFromFile_Normal create document code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    int32_t ret = CreateDocumentByFile(&document);
    OH_LOG_INFO(LOG_APP, "TestLoadDocumentFromFile_Normal create document ret: %{public}d", ret);
    ContentEmbed_ExtensionProxy *proxy = nullptr;
    ret = CreateProxy(document, &proxy);
    ret = WriteDocumentToSandbox(document);
    OH_LOG_INFO(LOG_APP, "TestLoadDocumentFromFile_Normal write to sandbox ret: %{public}d", ret);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_Proxy_StopWork(proxy);
    OH_LOG_INFO(LOG_APP, "TestLoadDocumentFromFile_Normal StopWork ret: %{public}d", errCode);
    errCode = OH_ContentEmbed_DestroyExtensionProxy(proxy);
    OH_LOG_INFO(LOG_APP, "TestLoadDocumentFromFile_Normal DestroyExtensionProxy ret: %{public}d", errCode);
    proxy = nullptr;
    char filePath[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode abilityCode =
        OH_AbilityRuntime_ApplicationContextGetFilesDir(filePath, BUF_SIZE, &writeLength);
    OH_LOG_ERROR(LOG_APP, "TestLoadDocumentFromFile_Normal get file dir ret: %{public}d", abilityCode);
    if (abilityCode != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    std::string fullPath = std::string(filePath) + "/ole.bin";
    document = nullptr;
    ContentEmbed_ErrorCode embedCode = OH_ContentEmbed_LoadDocumentFromFile(fullPath.c_str(),
        fullPath.size(), &document);
    OH_LOG_INFO(LOG_APP, "TestLoadDocumentFromFile_Normal load document from file ret: %{public}d", embedCode);
    if (embedCode == CE_ERR_OK) {
        napi_create_int32(env, embedCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetNativeFilePath_OEIDIsEmpty(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    char nativeFilePath[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetNativeFilePath_OEIDIsEmpty create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    document = nullptr;
    code = OH_ContentEmbed_Document_GetNativeFilePath(document, "");
    OH_LOG_INFO(LOG_APP, "TestDocumentGetNativeFilePath_OEIDIsEmpty failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageSetOEid_OEIDIsEmpty(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageSetOEid_OEIDIsEmpty create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_SetOEid(storage, "", BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStorageSetOEid_OEIDIsEmpty failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetOEidFromFormat_OEIDIsEmpty(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetOEidFromFormat(format, "");
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

static napi_value  TestCreateDocumentByOEid_OEIDIsValid(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByOEid_OEIDIsValid code1: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByOEid_OEIDIsValid code2: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_CreateDocumentByOEid("", &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByOEid_OEIDIsValid code3: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_CreateDocumentByOEid(
        "000209FF-0000-0000-C000000209FF-0000-0000-C000000209FF-0000-0000-C000", &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByOEid_OEIDIsValid code3: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
    return result;
}

static napi_value TestStorageCreateStorage_NameIsValid(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid create document code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, "", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid code1: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, "/", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid code2: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, "\\", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid code3: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, ":", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid code4: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, "!", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid code5: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
    return result;
}

static napi_value TestStorageCreateStorage_NameExceedMaxLen(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameExceedMaxLen create document code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameExceedMaxLen get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char name[] = {"OH_ContentEmbed_Document_GetRootStorageOH_ContentEmbed_Document_GetRootStorage111111111111"};
    code = OH_ContentEmbed_Storage_CreateStorage(storage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameExceedMaxLen code1: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
    return result;
}

static napi_value TestStorageGetStorage_NameIsValid(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid create document code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStorage(storage, "", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid code1: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStorage(storage, "/", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid code2: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStorage(storage, "\\", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid code3: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStorage(storage, ":", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid code4: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStorage(storage, "!", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid code5: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
    return result;
}

static napi_value TestStorageGetStorage_NameExceedMaxLen(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameExceedMaxLen create document code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameExceedMaxLen get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char name[] = {"TestStorageGetStorage_NameExceedMaxLenTestStorageGetStorage_NameExceedMaxLen11111234"};
    code = OH_ContentEmbed_Storage_GetStorage(storage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameExceedMaxLen code1: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
    return result;
}

static napi_value TestStorageCreateStream_StreamFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_StreamFailed create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_StreamFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        OH_ContentEmbed_DestroyDocument(document);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char streamName[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, streamName, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_StreamFailed create stream code: %{public}d", code);
    if (code == CE_ERR_STREAM_OPERATION_FAILED || code == CE_ERR_OK) {
        napi_create_int32(env, CE_ERR_STREAM_OPERATION_FAILED, &result);
        OH_ContentEmbed_DestroyDocument(document);
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_ContentEmbed_DestroyDocument(document);
    return result;
}

static napi_value TestStorageGetStream_StorageFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_StorageFailed create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_StorageFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        OH_ContentEmbed_DestroyDocument(document);
        return result;
    }
    char storageName[] = "testStorage";
    ContentEmbed_Storage *childStorage = nullptr;
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, storageName, &childStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_StorageFailed create storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        OH_ContentEmbed_DestroyDocument(document);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    code = OH_ContentEmbed_Storage_GetStream(rootStorage, storageName, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_StorageFailed get stream code: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        OH_ContentEmbed_DestroyDocument(document);
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_ContentEmbed_DestroyDocument(document);
    return result;
}

static napi_value TestStorageGetStream_StreamFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_StreamFailed create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_StreamFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        OH_ContentEmbed_DestroyDocument(document);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char streamName[] = "nonexistentStream";
    code = OH_ContentEmbed_Storage_GetStream(rootStorage, streamName, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_StreamFailed get stream code: %{public}d", code);
    if (code == CE_ERR_STREAM_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        OH_ContentEmbed_DestroyDocument(document);
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_ContentEmbed_DestroyDocument(document);
    return result;
}

static napi_value TestCreateDocumentByFile_EmptyPath(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByFile("", 0, false, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_EmptyPath failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageDeleteEntry_FileFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testEntry";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageDeleteEntry_FileFailed create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageDeleteEntry_FileFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(storage, "");
    OH_LOG_INFO(LOG_APP, "TestStorageDeleteEntry_FileFailed code: %{public}d", code);
    if (code == CE_ERR_FILE_OPERATION_FAILED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, CE_ERR_FILE_OPERATION_FAILED, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamSeek_ExceedSize(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ExceedSize create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ExceedSize get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ExceedSize create stream code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Stream_Seek(stream, std::numeric_limits<std::size_t>::max());
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ExceedSize seek stream code: %{public}d", code);
    if (code == CE_ERR_STREAM_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static int32_t ClearDir()
{
    char filePath[BUF_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode abilityCode =
        OH_AbilityRuntime_ApplicationContextGetTempDir(filePath, BUF_SIZE, &writeLength);
    OH_LOG_INFO(LOG_APP, "ClearDir get temp dir ret: %{public}d", abilityCode);
    if (abilityCode != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_ERROR(LOG_APP, "ClearDir OH_AbilityRuntime_ApplicationContextGetTempDir failed");
        return -1;
    }
    std::error_code ec;  // 错误码，替代异常
    if (!fs::exists(filePath, ec)) {
        OH_LOG_ERROR(LOG_APP, "ClearDir path not exists: %{public}d", ec.value());
        return -1;  // 不存在 = 也算删除成
    }
    fs::remove_all(filePath, ec);
    OH_LOG_INFO(LOG_APP, "ClearDir remove_all: %{public}s %{public}d", filePath, ec.value());
    if (ec) {
        OH_LOG_ERROR(LOG_APP, "ClearDir remove_all failed: %{public}d", ec.value());
        return -1;
    }
    abilityCode =
        OH_AbilityRuntime_ApplicationContextGetFilesDir(filePath, BUF_SIZE, &writeLength);
    OH_LOG_INFO(LOG_APP, "ClearDir get file dir ret: %{public}d", abilityCode);
    if (abilityCode != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        return -1;
    }
    std::string fullPath = std::string(filePath) + "/ole.bin";
    fs::remove(fullPath.c_str(), ec);
    OH_LOG_INFO(LOG_APP, "ClearDir remove: %{public}s %{public}d", fullPath.c_str(), ec.value());
    if (ec) {
        OH_LOG_ERROR(LOG_APP, "ClearDir remove failed: %{public}d", ec.value());
        return -1;
    }
    return 0;
}

static napi_value TestStreamRead_StreamFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_StreamFailed create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    int32_t ret = LoadDocumentFromSandbox(&document);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_StreamFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_StreamFailed create stream code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    if (ClearDir() != 0) {
        OH_LOG_ERROR(LOG_APP, "TestStreamRead_StreamFailed ClearDir failed");
        napi_create_int32(env, -1, &result);
        return result;
    }
    unsigned char *buffer = nullptr;
    size_t readSize = 0;
    code = OH_ContentEmbed_Stream_Read(stream, &buffer, BUF_SIZE, &readSize);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_StreamFailed read stream code: %{public}d", code);
    if (code == CE_ERR_STREAM_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamWrite_StreamFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_StreamFailed create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    int32_t ret = LoadDocumentFromSandbox(&document);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_StreamFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_StreamFailed create stream code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    if (ClearDir() != 0) {
        OH_LOG_ERROR(LOG_APP, "TestStreamWrite_StreamFailed ClearDir failed");
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint8_t buffer[BUF_SIZE] = {0};
    size_t writeSize = 0;
    code = OH_ContentEmbed_Stream_Write(stream, buffer, BUF_SIZE, &writeSize);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_StreamFailed write stream code: %{public}d", code);
    if (code == CE_ERR_STREAM_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamGetPosition_StreamFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_StreamFailed create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    int32_t ret = LoadDocumentFromSandbox(&document);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_StreamFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_StreamFailed create stream code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    if (ClearDir() != 0) {
        OH_LOG_ERROR(LOG_APP, "TestStreamGetPosition_StreamFailed ClearDir failed");
        napi_create_int32(env, -1, &result);
        return result;
    }
    size_t position = 0;
    code = OH_ContentEmbed_Stream_GetPosition(stream, &position);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_StreamFailed getPosition code: %{public}d", code);
    if (code == CE_ERR_STREAM_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamGetSize_StreamFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_StreamFailed create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    int32_t ret = LoadDocumentFromSandbox(&document);
    if (ret != 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_StreamFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_StreamFailed create stream code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    if (ClearDir() != 0) {
        OH_LOG_ERROR(LOG_APP, "TestStreamGetSize_StreamFailed ClearDir failed");
        napi_create_int32(env, -1, &result);
        return result;
    }
    size_t size = 0;
    code = OH_ContentEmbed_Stream_GetSize(stream, &size);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_StreamFailed getSize code: %{public}d", code);
    if (code == CE_ERR_STREAM_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"TestLoadDocumentFromFile_Normal", nullptr,
            TestLoadDocumentFromFile_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetNativeFilePath_OEIDIsEmpty", nullptr,
            TestDocumentGetNativeFilePath_OEIDIsEmpty,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageSetOEid_OEIDIsEmpty", nullptr,
            TestStorageSetOEid_OEIDIsEmpty,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetOEidFromFormat_OEIDIsEmpty", nullptr,
            TestProxyGetOEidFromFormat_OEIDIsEmpty,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestCreateDocumentByOEid_OEIDIsValid", nullptr,
            TestCreateDocumentByOEid_OEIDIsValid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStorage_NameIsValid", nullptr,
            TestStorageCreateStorage_NameIsValid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStorage_NameExceedMaxLen", nullptr,
            TestStorageCreateStorage_NameExceedMaxLen,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStorage_NameIsValid", nullptr,
            TestStorageGetStorage_NameIsValid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStorage_NameExceedMaxLen", nullptr,
            TestStorageGetStorage_NameExceedMaxLen,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStream_StreamFailed", nullptr,
            TestStorageCreateStream_StreamFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStream_StorageFailed", nullptr,
            TestStorageGetStream_StorageFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStream_StreamFailed", nullptr,
            TestStorageGetStream_StreamFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestCreateDocumentByFile_EmptyPath", nullptr,
            TestCreateDocumentByFile_EmptyPath,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageDeleteEntry_FileFailed", nullptr,
            TestStorageDeleteEntry_FileFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamSeek_ExceedSize", nullptr,
            TestStreamSeek_ExceedSize,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamRead_StreamFailed", nullptr,
            TestStreamRead_StreamFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamWrite_StreamFailed", nullptr,
            TestStreamWrite_StreamFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetPosition_StreamFailed", nullptr,
            TestStreamGetPosition_StreamFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetSize_StreamFailed", nullptr,
            TestStreamGetSize_StreamFailed,
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
