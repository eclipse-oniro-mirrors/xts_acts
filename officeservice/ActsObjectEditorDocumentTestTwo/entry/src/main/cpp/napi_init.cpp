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

#include <fstream>
#include <string>
#include <cstdint>
#include <hilog/log.h>
#include <rawfile/raw_file_manager.h>
#include <AbilityKit/ability_runtime/application_context.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>

using namespace std;

namespace {
const size_t BUF_SIZE = 4096;
const size_t FILE_PATH_SIZE = 256;

static napi_value TestCreateDocumentByFile_LinkingFailed(napi_env env, napi_callback_info info)
{
    char filePath[FILE_PATH_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code =
        OH_AbilityRuntime_ApplicationContextGetFilesDir(filePath, FILE_PATH_SIZE, &writeLength);
    napi_value result;
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    std::string fullPath = std::string(filePath) + "/test.txt";
    std::ofstream(fullPath).close();
    char bundleName[FILE_PATH_SIZE];
    code = OH_AbilityRuntime_ApplicationContextGetBundleName(bundleName, FILE_PATH_SIZE, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    std::string path = "/storage/Users/currentUser/appdata/el2/base/" + std::string(bundleName)
        + "/haps/entry/files/test.txt";
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_LinkingFailed path: %{public}s", path.c_str());
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByFile(path.c_str(),
    path.size(), true, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_LinkingFailed failed code: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED || errCode == CE_ERR_INVALID_LINKING_PATH) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestCreateDocumentByFile_Normal(napi_env env, napi_callback_info info)
{
    char filePath[FILE_PATH_SIZE];
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode code =
        OH_AbilityRuntime_ApplicationContextGetFilesDir(filePath, FILE_PATH_SIZE, &writeLength);
    napi_value result;
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    std::string fullPath = std::string(filePath) + "/test.txt";
    std::ofstream(fullPath).close();
    char bundleName[FILE_PATH_SIZE];
    code = OH_AbilityRuntime_ApplicationContextGetBundleName(bundleName, FILE_PATH_SIZE, &writeLength);
    if (code != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    std::string path = "/storage/Users/currentUser/appdata/el2/base/" + std::string(bundleName)
        + "/haps/entry/files/test.txt";
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_Normal path: %{public}s", path.c_str());
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByFile(path.c_str(),
    path.size(), false, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_Normal code: %{public}d", errCode);
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED || errCode == CE_ERR_OK) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestCreateDocumentByFile_PathEmpty(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode errCode = OH_ContentEmbed_CreateDocumentByFile("",
        0, true, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_PathEmpty failed code: %{public}d", errCode);
    napi_value result;
    if (errCode == CE_ERR_DEVICE_NOT_SUPPORTED || errCode == CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetNativeFilePath_PathEmpty(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char nativeFilePath[1024] = {0};
    code = OH_ContentEmbed_Document_GetNativeFilePath(document, nativeFilePath);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetNativeFilePath_PathEmpty failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStorage_NameEmpty(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameEmpty create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameEmpty get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, "", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameEmpty code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStorage_SameName(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_SameName create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_SameName get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_SameName code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_SameName code2: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetStorage_NameEmpty(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameEmpty create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameEmpty get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    code = OH_ContentEmbed_Storage_GetStorage(rootStorage, "", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameEmpty code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetStorage_StorageFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_StorageFailed create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_StorageFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_GetStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_StorageFailed code: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStream_NameEmpty(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_NameEmpty create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_NameEmpty get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, "", &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_NameEmpty code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStream_StorageFailed(napi_env env, napi_callback_info info)
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
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_StreamFailed create storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_StreamFailed create stream code: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDeleteEntry_StorageFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDeleteEntry_StorageFailed create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestDeleteEntry_StorageFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestDeleteEntry_StorageFailed create storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestDeleteEntry_StorageFailed delete storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestDeleteEntry_StorageFailed delete storage code2: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDeleteEntry_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDeleteEntry_Normal create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestDeleteEntry_Normal get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestDeleteEntry_Normal create storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestDeleteEntry_Normal delete storage code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDeleteAllEntry_StorageFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDeleteAllEntry_StorageFailed create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestDeleteAllEntry_StorageFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestDeleteAllEntry_StorageFailed create storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestDeleteAllEntry_StorageFailed delete entry code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteAllEntry(storage);
    OH_LOG_INFO(LOG_APP, "TestDeleteAllEntry_StorageFailed delete all entry code: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamRead_ReturnNull(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_ReturnNull create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamRead_ReturnNull get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_ReturnNull create stream code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_ReturnNull delete entry code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    unsigned char *buffer = nullptr;
    size_t length = 1024;
    size_t num = 0;
    code = OH_ContentEmbed_Stream_Read(stream, &buffer, length, &num);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_ReturnNull read stream code: %{public}d", code);
    if (code == CE_ERR_NULL_POINTER) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamWrite_ReturnNull(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_ReturnNull create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_ReturnNull get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_ReturnNull create stream code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_ReturnNull delete entry code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    unsigned char buffer[FILE_PATH_SIZE] = {0};
    size_t num = 0;
    code = OH_ContentEmbed_Stream_Write(stream, buffer, FILE_PATH_SIZE, &num);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_ReturnNull write stream code: %{public}d", code);
    if (code == CE_ERR_NULL_POINTER) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamSeek_ReturnNull(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ReturnNull create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ReturnNull get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ReturnNull create stream code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ReturnNull delete entry code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Stream_Seek(stream, 0);
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ReturnNull seek stream code: %{public}d", code);
    if (code == CE_ERR_NULL_POINTER) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamGetPosition_ReturnNull(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_ReturnNull create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_ReturnNull get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_ReturnNull create stream code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_ReturnNull delete entry code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    size_t position = 0;
    code = OH_ContentEmbed_Stream_GetPosition(stream, &position);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_ReturnNull get stream position code: %{public}d", code);
    if (code == CE_ERR_NULL_POINTER) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamGetSize_ReturnNull(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_ReturnNull create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_ReturnNull get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_ReturnNull create stream code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_ReturnNull delete entry code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    size_t size = 0;
    code = OH_ContentEmbed_Stream_GetSize(stream, &size);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_ReturnNull get stream size code: %{public}d", code);
    if (code == CE_ERR_NULL_POINTER) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamGetOEid_StorageFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamGetOEid_StorageFailed create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamGetOEid_StorageFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStreamGetOEid_StorageFailed create storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestStreamGetOEid_StorageFailed delete entry code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char storageOeid[FILE_PATH_SIZE] = {0};
    code = OH_ContentEmbed_Storage_GetOEid(storage, storageOeid, FILE_PATH_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStreamGetOEid_StorageFailed get storage oeid code: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamSetOEid_StorageFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamSetOEid_StorageFailed create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamSetOEid_StorageFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStreamSetOEid_StorageFailed create storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestStreamSetOEid_StorageFailed delete entry code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char storageOeid[FILE_PATH_SIZE] = "000209FF-0000-0000-C000-000000000046";
    code = OH_ContentEmbed_Storage_SetOEid(storage, storageOeid, FILE_PATH_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStreamSetOEid_StorageFailed set storage oeid code: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestCreateStorageElements_Nullptr(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(nullptr);
    OH_LOG_INFO(LOG_APP, "TestCreateStorageElements_Nullptr failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDestroyStorageElements_Nullptr(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Destroy(nullptr);
    OH_LOG_INFO(LOG_APP, "TestDestroyStorageElements_Nullptr failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDestroyStorageElements_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestDestroyStorageElements_Normal create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (elements == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_StorageElements_Destroy(elements);
    OH_LOG_INFO(LOG_APP, "TestDestroyStorageElements_Normal code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetElements_Nullptr(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetElements(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_Nullptr failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetElements_StorageNullptr(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_StorageNullptr create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (elements == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetElements(nullptr, elements);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_StorageNullptr failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetElements_ElementsNullptr(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_ElementsNullptr create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_ElementsNullptr get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetElements(rootStorage, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_ElementsNullptr failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetElements_StorageFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_StorageFailed create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_StorageFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_StorageFailed create storage code: %{public}d", code);
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_StorageFailed delete entry code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_StorageElements *elements = nullptr;
    code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_StorageFailed create code: %{public}d", code);
    if (elements == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_StorageFailed failed code: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElementsCount_Nullptr(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetCount(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestGetElementsCount_Nullptr failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElementsCount_ElementsNullptr(napi_env env, napi_callback_info info)
{
    size_t count = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetCount(nullptr, &count);
    OH_LOG_INFO(LOG_APP, "TestGetElementsCount_ElementsNullptr failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElementsCount_CountNullptr(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestGetElementsCount_CountNullptr create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (elements == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_StorageElements_GetCount(elements, nullptr);
    OH_LOG_INFO(LOG_APP, "TestGetElementsCount_CountNullptr failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElement_Nullptr(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetElement(nullptr, 0, nullptr);
    OH_LOG_INFO(LOG_APP, "TestGetElement_Nullptr failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElement_ElementsNullptr(napi_env env, napi_callback_info info)
{
    size_t count = 0;
    ContentEmbed_StorageElement *element = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetElement(nullptr, count, &element);
    OH_LOG_INFO(LOG_APP, "TestGetElement_ElementsNullptr failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElement_ElementNullptr(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestGetElement_ElementNullptr create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (elements == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, nullptr);
    OH_LOG_INFO(LOG_APP, "TestGetElement_ElementNullptr failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElement_SizeInvalid(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestGetElement_SizeInvalid create code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (elements == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_StorageElement *element = nullptr;
    code = OH_ContentEmbed_StorageElements_GetElement(elements, -1, &element);
    OH_LOG_INFO(LOG_APP, "TestGetElement_SizeInvalid failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElementName_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestGetElementName_Normal create code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestGetElementName_Normal create document code: %{public}d", code);
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestGetElementName_Normal get root storage code: %{public}d", code);
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestGetElementName_Normal create storage code: %{public}d", code);
    code = OH_ContentEmbed_Storage_GetElements(rootStorage, elements);
    OH_LOG_INFO(LOG_APP, "TestGetElementName_Normal get elements code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_StorageElement *element = nullptr;
    code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, &element);
    OH_LOG_INFO(LOG_APP, "TestGetElementName_Normal get element code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char nameElement[FILE_PATH_SIZE] = {0};
    code = OH_ContentEmbed_StorageElement_GetName(element, nameElement, FILE_PATH_SIZE);
    OH_LOG_INFO(LOG_APP, "TestGetElementName_Normal get element name code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElementCTime_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestGetElementCTime_Normal create code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestGetElementCTime_Normal create document code: %{public}d", code);
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestGetElementCTime_Normal get root storage code: %{public}d", code);
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestGetElementCTime_Normal create storage code: %{public}d", code);
    code = OH_ContentEmbed_Storage_GetElements(rootStorage, elements);
    OH_LOG_INFO(LOG_APP, "TestGetElementCTime_Normal get elements code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_StorageElement *element = nullptr;
    code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, &element);
    OH_LOG_INFO(LOG_APP, "TestGetElementCTime_Normal get element code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint64_t ctime = 0;
    code = OH_ContentEmbed_StorageElement_GetCTime(element, &ctime);
    OH_LOG_INFO(LOG_APP, "TestGetElementCTime_Normal get element ctime code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElementMTime_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestGetElementMTime_Normal create code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestGetElementMTime_Normal create document code: %{public}d", code);
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestGetElementMTime_Normal get root storage code: %{public}d", code);
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestGetElementMTime_Normal create storage code: %{public}d", code);
    code = OH_ContentEmbed_Storage_GetElements(rootStorage, elements);
    OH_LOG_INFO(LOG_APP, "TestGetElementMTime_Normal get elements code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_StorageElement *element = nullptr;
    code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, &element);
    OH_LOG_INFO(LOG_APP, "TestGetElementMTime_Normal get element code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    uint64_t ctime = 0;
    code = OH_ContentEmbed_StorageElement_GetMTime(element, &ctime);
    OH_LOG_INFO(LOG_APP, "TestGetElementMTime_Normal get element mtime code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElementIsStorage_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStorage_Normal create code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStorage_Normal create document code: %{public}d", code);
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStorage_Normal get root storage code: %{public}d", code);
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStorage_Normal create storage code: %{public}d", code);
    code = OH_ContentEmbed_Storage_GetElements(rootStorage, elements);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStorage_Normal get elements code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_StorageElement *element = nullptr;
    code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, &element);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStorage_Normal get element code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    bool isStorage = false;
    code = OH_ContentEmbed_StorageElement_IsStorage(element, &isStorage);
    OH_LOG_INFO(LOG_APP,
        "TestGetElementIsStorage_Normal get element isStorage code: %{public}d, isStorage: %{public}d",
        code, isStorage);
    if (code == CE_ERR_OK && isStorage) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestGetElementIsStream_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStream_Normal create code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStream_Normal create document code: %{public}d", code);
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStream_Normal get root storage code: %{public}d", code);
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    code = OH_ContentEmbed_Storage_CreateStream(rootStorage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStream_Normal create stream code: %{public}d", code);
    code = OH_ContentEmbed_Storage_GetElements(rootStorage, elements);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStream_Normal get elements code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_StorageElement *element = nullptr;
    code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, &element);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStream_Normal get element code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    bool isStream = false;
    code = OH_ContentEmbed_StorageElement_IsStream(element, &isStream);
    OH_LOG_INFO(LOG_APP,
        "TestGetElementIsStream_Normal get element isStream code: %{public}d, isStream: %{public}d",
        code, isStream);
    if (code == CE_ERR_OK && isStream) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCopyTo_StorageFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestGetElementIsStream_Normal create document code: %{public}d", code);
    napi_value result;
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
    OH_LOG_INFO(LOG_APP, "TestStorageCopyTo_StorageFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCopyTo_StorageFailed create storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(rootStorage, name);
    OH_LOG_INFO(LOG_APP, "TestStorageCopyTo_StorageFailed delete entry code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CopyTo(storage, storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCopyTo_StorageFailed failed code: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCopyTo_Normal(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageCopyTo_Normal create document code: %{public}d", code);
    napi_value result;
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
    OH_LOG_INFO(LOG_APP, "TestStorageCopyTo_Normal get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *srcStorage = nullptr;
    char srcName[] = "srcStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, srcName, &srcStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageCopyTo_Normal create srcStorage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *dstStorage = nullptr;
    char dstName[] = "dstStorage";
    code = OH_ContentEmbed_Storage_CreateStorage(rootStorage, dstName, &dstStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageCopyTo_Normal create dstStorage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CopyTo(srcStorage, dstStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageCopyTo_Normal copy code: %{public}d", code);
    if (code == CE_ERR_OK) {
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
        {"TestCreateDocumentByFile_LinkingFailed", nullptr,
            TestCreateDocumentByFile_LinkingFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestCreateDocumentByFile_Normal", nullptr,
            TestCreateDocumentByFile_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestCreateDocumentByFile_PathEmpty", nullptr,
            TestCreateDocumentByFile_PathEmpty,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetNativeFilePath_PathEmpty", nullptr,
            TestDocumentGetNativeFilePath_PathEmpty,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStorage_NameEmpty", nullptr,
            TestStorageCreateStorage_NameEmpty,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStorage_SameName", nullptr,
            TestStorageCreateStorage_SameName,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStorage_NameEmpty", nullptr,
            TestStorageGetStorage_NameEmpty,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStorage_StorageFailed", nullptr,
            TestStorageGetStorage_StorageFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStream_NameEmpty", nullptr,
            TestStorageCreateStream_NameEmpty,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStream_StorageFailed", nullptr,
            TestStorageCreateStream_StorageFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDeleteEntry_StorageFailed", nullptr,
            TestDeleteEntry_StorageFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDeleteEntry_Normal", nullptr,
            TestDeleteEntry_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDeleteAllEntry_StorageFailed", nullptr,
            TestDeleteAllEntry_StorageFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamRead_ReturnNull", nullptr,
            TestStreamRead_ReturnNull,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamWrite_ReturnNull", nullptr,
            TestStreamWrite_ReturnNull,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamSeek_ReturnNull", nullptr,
            TestStreamSeek_ReturnNull,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetPosition_ReturnNull", nullptr,
            TestStreamGetPosition_ReturnNull,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetSize_ReturnNull", nullptr,
            TestStreamGetSize_ReturnNull,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetOEid_StorageFailed", nullptr,
            TestStreamGetOEid_StorageFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamSetOEid_StorageFailed", nullptr,
            TestStreamSetOEid_StorageFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestCreateStorageElements_Nullptr", nullptr,
            TestCreateStorageElements_Nullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDestroyStorageElements_Nullptr", nullptr,
            TestDestroyStorageElements_Nullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDestroyStorageElements_Normal", nullptr,
            TestDestroyStorageElements_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetElements_Nullptr", nullptr,
            TestStorageGetElements_Nullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetElements_StorageNullptr", nullptr,
            TestStorageGetElements_StorageNullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetElements_ElementsNullptr", nullptr,
            TestStorageGetElements_ElementsNullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetElements_StorageFailed", nullptr,
            TestStorageGetElements_StorageFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElementsCount_Nullptr", nullptr,
            TestGetElementsCount_Nullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElementsCount_ElementsNullptr", nullptr,
            TestGetElementsCount_ElementsNullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElementsCount_CountNullptr", nullptr,
            TestGetElementsCount_CountNullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElement_Nullptr", nullptr,
            TestGetElement_Nullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElement_ElementsNullptr", nullptr,
            TestGetElement_ElementsNullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElement_ElementNullptr", nullptr,
            TestGetElement_ElementNullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElement_SizeInvalid", nullptr,
            TestGetElement_SizeInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElementName_Normal", nullptr,
            TestGetElementName_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElementCTime_Normal", nullptr,
            TestGetElementCTime_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElementMTime_Normal", nullptr,
            TestGetElementMTime_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElementIsStorage_Normal", nullptr,
            TestGetElementIsStorage_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestGetElementIsStream_Normal", nullptr,
            TestGetElementIsStream_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCopyTo_StorageFailed", nullptr,
            TestStorageCopyTo_StorageFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCopyTo_Normal", nullptr,
            TestStorageCopyTo_Normal,
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
