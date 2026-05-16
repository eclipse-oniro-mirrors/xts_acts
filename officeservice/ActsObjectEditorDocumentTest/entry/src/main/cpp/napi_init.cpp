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
#include <hilog/log.h>
#include <rawfile/raw_file_manager.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>

using namespace std;

namespace {
const size_t BUF_SIZE = 4096;

static napi_value TestCreateDocumentByOEid_NullOEid(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(nullptr, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByOEid_NullOEid failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestCreateDocumentByOEid_NullDocument(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, nullptr);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByOEid_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestCreateDocumentByOEid_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByOEid_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestCreateDocumentByFile_NullFilePath(napi_env env, napi_callback_info info)
{
    char filePath[] = "/data/test/test.docx";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByFile(nullptr,
        strlen(filePath), false, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_NullFilePath failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestCreateDocumentByFile_ZeroPathLength(napi_env env, napi_callback_info info)
{
    char filePath[] = "/data/test/test.docx";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByFile(filePath, 0, false, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_ZeroPathLength failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestCreateDocumentByFile_NullDocument(napi_env env, napi_callback_info info)
{
    char filePath[] = "/data/test/test.docx";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByFile(filePath, 0, false, nullptr);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestCreateDocumentByFile_ValidParam(napi_env env, napi_callback_info info)
{
    char filePath[] = "/data/test/test.docx";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByFile(filePath,
        strlen(filePath), false, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByFile_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestLoadDocumentFromFile_NullFilePath(napi_env env, napi_callback_info info)
{
    char filePath[] = "/data/test/test.docx";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_LoadDocumentFromFile(nullptr,
        strlen(filePath), &document);
    OH_LOG_INFO(LOG_APP, "TestLoadDocumentFromFile_NullFilePath failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestLoadDocumentFromFile_ZeroPathLength(napi_env env, napi_callback_info info)
{
    char filePath[] = "/data/test/test.docx";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_LoadDocumentFromFile(filePath, 0, &document);
    OH_LOG_INFO(LOG_APP, "TestLoadDocumentFromFile_ZeroPathLength failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestLoadDocumentFromFile_NullDocument(napi_env env, napi_callback_info info)
{
    char filePath[] = "/data/test/test.docx";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_LoadDocumentFromFile(filePath, 0, nullptr);
    OH_LOG_INFO(LOG_APP, "TestLoadDocumentFromFile_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestLoadDocumentFromFile_ValidParam(napi_env env, napi_callback_info info)
{
    char filePath[] = "/data/test/test.docx";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_LoadDocumentFromFile(filePath,
        strlen(filePath), &document);
    OH_LOG_INFO(LOG_APP, "TestLoadDocumentFromFile_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_NULL_POINTER) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentRead_NullBuffer(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document *document = nullptr;
    size_t readSize = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_Read(nullptr, BUF_SIZE, document, 0, &readSize);
    OH_LOG_INFO(LOG_APP, "TestDocumentRead_NullBuffer failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentRead_NullDocument(napi_env env, napi_callback_info info)
{
    uint8_t buffer[BUF_SIZE] = {0};
    size_t readSize = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_Read(buffer, BUF_SIZE, nullptr, 0, &readSize);
    OH_LOG_INFO(LOG_APP, "TestDocumentRead_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentRead_NullReadSize(napi_env env, napi_callback_info info)
{
    uint8_t buffer[BUF_SIZE] = {0};
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_Read(buffer, BUF_SIZE, document, 0, nullptr);
    OH_LOG_INFO(LOG_APP, "TestDocumentRead_NullReadSize failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentRead_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    uint8_t buffer[BUF_SIZE] = {0};
    size_t readSize = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDocumentRead_ValidParam create document code: %{public}d", code);
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
    code = OH_ContentEmbed_Document_Read(buffer, BUF_SIZE, document, 0, &readSize);
    OH_LOG_INFO(LOG_APP, "TestDocumentRead_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetOEid_NullDocument(napi_env env, napi_callback_info info)
{
    char oeidOut[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetOEid(nullptr, oeidOut);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetOEid_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetOEid_NullOEidOut(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetOEid(document, nullptr);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetOEid_NullOEidOut failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetOEid_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    char oeidOut[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetOEid_ValidParam create document code: %{public}d", code);
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
    code = OH_ContentEmbed_Document_GetOEid(document, oeidOut);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetOEid_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentIsLinking_NullDocument(napi_env env, napi_callback_info info)
{
    bool isLinking = false;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_IsLinking(nullptr, &isLinking);
    OH_LOG_INFO(LOG_APP, "TestDocumentIsLinking_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentIsLinking_NullIsLinking(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_IsLinking(document, nullptr);
    OH_LOG_INFO(LOG_APP, "TestDocumentIsLinking_NullIsLinking failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentIsLinking_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    bool isLinking = false;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDocumentIsLinking_ValidParam create document code: %{public}d", code);
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
    code = OH_ContentEmbed_Document_IsLinking(document, &isLinking);
    OH_LOG_INFO(LOG_APP, "TestDocumentIsLinking_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK && !isLinking) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetNativeFilePath_NullDocument(napi_env env, napi_callback_info info)
{
    char nativeFilePath[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetNativeFilePath(nullptr, nativeFilePath);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetNativeFilePath_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetNativeFilePath_NullBuffer(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetNativeFilePath(document, nullptr);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetNativeFilePath_NullBuffer failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetNativeFilePath_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    char nativeFilePath[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetNativeFilePath_ValidParam create document code: %{public}d", code);
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
    code = OH_ContentEmbed_Document_GetNativeFilePath(document, nativeFilePath);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetNativeFilePath_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetRootStorage_NullDocument(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetRootStorage(nullptr, &storage);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetRootStorage_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetRootStorage_NullStorage(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetRootStorage(document, nullptr);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetRootStorage_NullStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentGetRootStorage_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetRootStorage_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestDocumentGetRootStorage_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentFlush_NullDocument(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_Flush(nullptr);
    OH_LOG_INFO(LOG_APP, "TestDocumentFlush_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDocumentFlush_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
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
    code = OH_ContentEmbed_Document_Flush(document);
    OH_LOG_INFO(LOG_APP, "TestDocumentFlush_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_FILE_OPERATION_FAILED || code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStorage_NullParentStorage(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CreateStorage(nullptr, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NullParentStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStorage_NullName(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CreateStorage(storage, nullptr, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NullName failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStorage_NullOutStorage(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CreateStorage(storage, name, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NullOutStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStorage_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetStorage_NullParentStorage(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *childStorage = nullptr;
    char name[] = "testStorage";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetStorage(nullptr, name, &childStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NullParentStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetStorage_NullName(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *parentStorage = nullptr;
    ContentEmbed_Storage *childStorage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetStorage(parentStorage, nullptr, &childStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NullName failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetStorage_NullOutStorage(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *parentStorage = nullptr;
    char name[] = "testStorage";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetStorage(parentStorage, name, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NullOutStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetStorage_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *parentStorage = nullptr;
    ContentEmbed_Storage *childStorage = nullptr;
    char name[] = "testStorage";
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_ValidParam create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &parentStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || parentStorage == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(parentStorage, name, &childStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_ValidParam create child storage code: %{public}d", code);
    if (code != CE_ERR_OK || childStorage == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStorage(parentStorage, name, &childStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStream_NullStorage(napi_env env, napi_callback_info info)
{
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CreateStream(nullptr, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_NullStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStream_NullName(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CreateStream(storage, nullptr, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_NullName failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStream_NullOutStream(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStream";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CreateStream(storage, name, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_NullOutStream failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCreateStream_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStream_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetStream_NullStorage(napi_env env, napi_callback_info info)
{
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetStream(nullptr, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_NullStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetStream_NullName(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetStream(storage, nullptr, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_NullName failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetStream_NullOutStream(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStream";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetStream(storage, name, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_NullOutStream failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetStream_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
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
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_ValidParam create stream code: %{public}d", code);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStream(storage, name, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_ValidParam get stream code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageDeleteEntry_NullStorage(napi_env env, napi_callback_info info)
{
    char name[] = "testEntry";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_DeleteEntry(nullptr, name);
    OH_LOG_INFO(LOG_APP, "TestStorageDeleteEntry_NullStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageDeleteEntry_NullName(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_DeleteEntry(storage, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageDeleteEntry_NullName failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageDeleteEntry_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testEntry";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
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
    OH_LOG_INFO(LOG_APP, "TestStorageDeleteEntry_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteEntry(storage, name);
    OH_LOG_INFO(LOG_APP, "TestStorageDeleteEntry_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_STORAGE_OPERATION_FAILED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDeleteStorage_NullStorage(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyStorage(nullptr);
    OH_LOG_INFO(LOG_APP, "TestDeleteStorage_NullStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDeleteStorage_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
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
    OH_LOG_INFO(LOG_APP, "TestDeleteStorage_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_DestroyStorage(storage);
    OH_LOG_INFO(LOG_APP, "TestDeleteStorage_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamRead_NullStream(napi_env env, napi_callback_info info)
{
    unsigned char *buffer = nullptr;
    size_t readSize = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_Read(nullptr, &buffer, BUF_SIZE, &readSize);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_NullStream failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamRead_NullBuffer(napi_env env, napi_callback_info info)
{
    ContentEmbed_Stream *stream = nullptr;
    size_t readSize = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_Read(stream, nullptr, BUF_SIZE, &readSize);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_NullBuffer failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamRead_NullReadSize(napi_env env, napi_callback_info info)
{
    ContentEmbed_Stream *stream = nullptr;
    unsigned char *buffer = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_Read(stream, &buffer, BUF_SIZE, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_NullReadSize failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamRead_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    unsigned char *buffer = nullptr;
    size_t readSize = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamRead_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_ValidParam create stream code: %{public}d", code);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Stream_Read(stream, &buffer, BUF_SIZE, &readSize);
    OH_LOG_INFO(LOG_APP, "TestStreamRead_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamWrite_NullStream(napi_env env, napi_callback_info info)
{
    uint8_t buffer[BUF_SIZE] = {0};
    size_t writeSize = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_Write(nullptr, buffer, BUF_SIZE, &writeSize);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_NullStream failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamWrite_NullBuffer(napi_env env, napi_callback_info info)
{
    ContentEmbed_Stream *stream = nullptr;
    size_t writeSize = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_Write(stream, nullptr, BUF_SIZE, &writeSize);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_NullBuffer failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamWrite_NullWriteSize(napi_env env, napi_callback_info info)
{
    ContentEmbed_Stream *stream = nullptr;
    uint8_t buffer[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_Write(stream, buffer, BUF_SIZE, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_NullWriteSize failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamWrite_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    uint8_t buffer[BUF_SIZE] = {0};
    size_t writeSize = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_ValidParam create stream code: %{public}d", code);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Stream_Write(stream, buffer, BUF_SIZE, &writeSize);
    OH_LOG_INFO(LOG_APP, "TestStreamWrite_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamSeek_NullStream(napi_env env, napi_callback_info info)
{
    size_t position = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_Seek(nullptr, position);
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_NullStream failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamSeek_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    size_t position = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ValidParam create stream code: %{public}d", code);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Stream_Seek(stream, position);
    OH_LOG_INFO(LOG_APP, "TestStreamSeek_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamGetPosition_NullStream(napi_env env, napi_callback_info info)
{
    size_t position = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_GetPosition(nullptr, &position);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_NullStream failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamGetPosition_NullPosition(napi_env env, napi_callback_info info)
{
    ContentEmbed_Stream *stream = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_GetPosition(stream, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_NullPosition failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamGetPosition_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    size_t position = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_ValidParam create stream code: %{public}d", code);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Stream_GetPosition(stream, &position);
    OH_LOG_INFO(LOG_APP, "TestStreamGetPosition_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamGetSize_NullStream(napi_env env, napi_callback_info info)
{
    size_t size = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_GetSize(nullptr, &size);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_NullStream failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamGetSize_NullSize(napi_env env, napi_callback_info info)
{
    ContentEmbed_Stream *stream = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_GetSize(stream, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_NullSize failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStreamGetSize_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    size_t size = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_ValidParam create stream code: %{public}d", code);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Stream_GetSize(stream, &size);
    OH_LOG_INFO(LOG_APP, "TestStreamGetSize_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDestroyStream_NullStream(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyStream(nullptr);
    OH_LOG_INFO(LOG_APP, "TestDestroyStream_NullStream failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDestroyStream_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDestroyStream_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestDestroyStream_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    OH_LOG_INFO(LOG_APP, "TestDestroyStream_ValidParam create stream code: %{public}d", code);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_DestroyStream(stream);
    OH_LOG_INFO(LOG_APP, "TestDestroyStream_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDestroyDocument_NullDocument(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyDocument(nullptr);
    OH_LOG_INFO(LOG_APP, "TestDestroyDocument_NullDocument failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestDestroyDocument_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDestroyDocument_ValidParam create document code: %{public}d", code);
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
    code = OH_ContentEmbed_DestroyDocument(document);
    OH_LOG_INFO(LOG_APP, "TestDestroyDocument_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageDeleteAllEntry_NullStorage(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_DeleteAllEntry(nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageDeleteAllEntry_NullStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageDeleteAllEntry_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageDeleteAllEntry_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageDeleteAllEntry_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_DeleteAllEntry(storage);
    OH_LOG_INFO(LOG_APP, "TestStorageDeleteAllEntry_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetOEid_NullStorage(napi_env env, napi_callback_info info)
{
    char oeidOut[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetOEid(nullptr, oeidOut, BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStorageGetOEid_NullStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetOEid_NullOEidOut(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetOEid(storage, nullptr, BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStorageGetOEid_NullOEidOut failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetOEid_ZeroBufferSize(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    char oeidOut[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetOEid(storage, oeidOut, 0);
    OH_LOG_INFO(LOG_APP, "TestStorageGetOEid_ZeroBufferSize failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetOEid_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    char oeidOut[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetOEid_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageGetOEid_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetOEid(storage, oeidOut, BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStorageGetOEid_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageSetOEid_NullStorage(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_SetOEid(nullptr, oeid, BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStorageSetOEid_NullStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageSetOEid_NullOEid(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_SetOEid(storage, nullptr, BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStorageSetOEid_NullOEid failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageSetOEid_ZeroBufferSize(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *storage = nullptr;
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_SetOEid(storage, oeid, 0);
    OH_LOG_INFO(LOG_APP, "TestStorageSetOEid_ZeroBufferSize failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageSetOEid_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageSetOEid_ValidParam create document code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageSetOEid_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_SetOEid(storage, oeid, BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStorageSetOEid_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElements_CreateElements(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestStorageElements_CreateElements failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        if (elements != nullptr) {
            OH_ContentEmbed_StorageElements_Destroy(elements);
        }
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageGetElements_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_ValidParam create elements code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_ValidParam create document code: %{public}d", code);
    if (code != CE_ERR_OK || document == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    OH_LOG_INFO(LOG_APP, "TestStorageGetElements_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        OH_ContentEmbed_StorageElements_Destroy(elements);
        return result;
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementsGetCount_NullElements(napi_env env, napi_callback_info info)
{
    size_t count = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetCount(nullptr, &count);
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetCount_NullElements failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementsGetCount_NullCount(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetCount_NullCount create elements code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetCount_NullCount failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        OH_ContentEmbed_StorageElements_Destroy(elements);
        return result;
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementsGetCount_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_StorageElements *elements = nullptr;
    size_t count = 0;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetCount_ValidParam create elements code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (elements == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetCount_ValidParam create document code: %{public}d", code);
    if (code != CE_ERR_OK || document == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetCount_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetCount_ValidParam failed code: %{public}d", code);
    if (code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_StorageElements_GetCount(elements, &count);
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetCount_ValidParam failed code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_create_int32(env, code, &result);
        OH_ContentEmbed_StorageElements_Destroy(elements);
        return result;
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementsGetElement_NullElements(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElement *element = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetElement(nullptr, 0, &element);
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetElement_NullElements failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementsGetElement_NullElement(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetElement_NullElement create elements code: %{public}d", code);
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
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetElement_NullElement failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        OH_ContentEmbed_StorageElements_Destroy(elements);
        return result;
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementsGetElement_ValidParam(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_StorageElement *element = nullptr;
    size_t count = 0;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetElement_ValidParam create element code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    ContentEmbed_Storage *destStorage = nullptr;
    code = OH_ContentEmbed_Storage_CreateStorage(storage, "destStorage", &destStorage);
    code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    code = OH_ContentEmbed_StorageElements_GetCount(elements, &count);
    OH_LOG_INFO(LOG_APP, "TestStorageElementsGetElement_ValidParam get count code: %{public}d", code);
    if (code == CE_ERR_OK && count > 0) {
        code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, &element);
        OH_LOG_INFO(LOG_APP, "TestStorageElementsGetElement_ValidParam failed code: %{public}d", code);
        if (code == CE_ERR_OK) {
            napi_create_int32(env, code, &result);
            OH_ContentEmbed_StorageElements_Destroy(elements);
            return result;
        }
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementGetName_NullElement(napi_env env, napi_callback_info info)
{
    char name[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_GetName(nullptr, name, BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStorageElementGetName_NullElement failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementGetName_NullName(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElement *element = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_GetName(element, nullptr, BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStorageElementGetName_NullName failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementGetName_NullLength(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElement *element = nullptr;
    char name[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_GetName(element, name, BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStorageElementGetName_NullLength failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementGetCTime_NullElement(napi_env env, napi_callback_info info)
{
    uint64_t time = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_GetCTime(nullptr, &time);
    OH_LOG_INFO(LOG_APP, "TestStorageElementGetCTime_NullElement failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementGetCTime_NullTime(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElement *element = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_GetCTime(element, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageElementGetCTime_NullTime failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementGetMTime_NullElement(napi_env env, napi_callback_info info)
{
    uint64_t time = 0;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_GetMTime(nullptr, &time);
    OH_LOG_INFO(LOG_APP, "TestStorageElementGetMTime_NullElement failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementGetMTime_NullTime(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElement *element = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_GetMTime(element, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageElementGetMTime_NullTime failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementIsStorage_NullElement(napi_env env, napi_callback_info info)
{
    bool isStorage = false;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_IsStorage(nullptr, &isStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageElementIsStorage_NullElement failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementIsStorage_NullResult(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElement *element = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_IsStorage(element, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageElementIsStorage_NullResult failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementIsStream_NullElement(napi_env env, napi_callback_info info)
{
    bool isStream = false;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_IsStream(nullptr, &isStream);
    OH_LOG_INFO(LOG_APP, "TestStorageElementIsStream_NullElement failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageElementIsStream_NullResult(napi_env env, napi_callback_info info)
{
    ContentEmbed_StorageElement *element = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_IsStream(element, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageElementIsStream_NullResult failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCopyTo_NullSrcStorage(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *dstStorage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CopyTo(nullptr, dstStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageCopyTo_NullSrcStorage failed code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED || code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageCopyTo_NullDstStorage(napi_env env, napi_callback_info info)
{
    ContentEmbed_Storage *srcStorage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CopyTo(srcStorage, nullptr);
    OH_LOG_INFO(LOG_APP, "TestStorageCopyTo_NullDstStorage failed code: %{public}d", code);
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
        {"TestCreateDocumentByOEid_NullOEid", nullptr,
            TestCreateDocumentByOEid_NullOEid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestCreateDocumentByOEid_NullDocument", nullptr,
            TestCreateDocumentByOEid_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestCreateDocumentByOEid_ValidParam", nullptr,
            TestCreateDocumentByOEid_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestCreateDocumentByFile_NullFilePath", nullptr,
            TestCreateDocumentByFile_NullFilePath,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestCreateDocumentByFile_ZeroPathLength", nullptr,
            TestCreateDocumentByFile_ZeroPathLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestCreateDocumentByFile_NullDocument", nullptr,
            TestCreateDocumentByFile_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestCreateDocumentByFile_ValidParam", nullptr,
            TestCreateDocumentByFile_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestLoadDocumentFromFile_NullFilePath", nullptr,
            TestLoadDocumentFromFile_NullFilePath,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestLoadDocumentFromFile_ZeroPathLength", nullptr,
            TestLoadDocumentFromFile_ZeroPathLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestLoadDocumentFromFile_NullDocument", nullptr,
            TestLoadDocumentFromFile_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestLoadDocumentFromFile_ValidParam", nullptr,
            TestLoadDocumentFromFile_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentRead_NullBuffer", nullptr,
            TestDocumentRead_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentRead_NullDocument", nullptr,
            TestDocumentRead_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentRead_NullReadSize", nullptr,
            TestDocumentRead_NullReadSize,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentRead_ValidParam", nullptr,
            TestDocumentRead_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetOEid_NullDocument", nullptr,
            TestDocumentGetOEid_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetOEid_NullOEidOut", nullptr,
            TestDocumentGetOEid_NullOEidOut,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetOEid_ValidParam", nullptr,
            TestDocumentGetOEid_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentIsLinking_NullDocument", nullptr,
            TestDocumentIsLinking_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentIsLinking_NullIsLinking", nullptr,
            TestDocumentIsLinking_NullIsLinking,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentIsLinking_ValidParam", nullptr,
            TestDocumentIsLinking_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetNativeFilePath_NullDocument", nullptr,
            TestDocumentGetNativeFilePath_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetNativeFilePath_NullBuffer", nullptr,
            TestDocumentGetNativeFilePath_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetNativeFilePath_ValidParam", nullptr,
            TestDocumentGetNativeFilePath_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetRootStorage_NullDocument", nullptr,
            TestDocumentGetRootStorage_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetRootStorage_NullStorage", nullptr,
            TestDocumentGetRootStorage_NullStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentGetRootStorage_ValidParam", nullptr,
            TestDocumentGetRootStorage_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentFlush_NullDocument", nullptr,
            TestDocumentFlush_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDocumentFlush_ValidParam", nullptr,
            TestDocumentFlush_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStorage_NullParentStorage", nullptr,
            TestStorageCreateStorage_NullParentStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStorage_NullName", nullptr,
            TestStorageCreateStorage_NullName,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStorage_NullOutStorage", nullptr,
            TestStorageCreateStorage_NullOutStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStorage_ValidParam", nullptr,
            TestStorageCreateStorage_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStorage_NullParentStorage", nullptr,
            TestStorageGetStorage_NullParentStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStorage_NullName", nullptr,
            TestStorageGetStorage_NullName,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStorage_NullOutStorage", nullptr,
            TestStorageGetStorage_NullOutStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStorage_ValidParam", nullptr,
            TestStorageGetStorage_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStream_NullStorage", nullptr,
            TestStorageCreateStream_NullStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStream_NullName", nullptr,
            TestStorageCreateStream_NullName,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStream_NullOutStream", nullptr,
            TestStorageCreateStream_NullOutStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCreateStream_ValidParam", nullptr,
            TestStorageCreateStream_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStream_NullStorage", nullptr,
            TestStorageGetStream_NullStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStream_NullName", nullptr,
            TestStorageGetStream_NullName,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStream_NullOutStream", nullptr,
            TestStorageGetStream_NullOutStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetStream_ValidParam", nullptr,
            TestStorageGetStream_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageDeleteEntry_NullStorage", nullptr,
            TestStorageDeleteEntry_NullStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageDeleteEntry_NullName", nullptr,
            TestStorageDeleteEntry_NullName,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageDeleteEntry_ValidParam", nullptr,
            TestStorageDeleteEntry_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDeleteStorage_NullStorage", nullptr,
            TestDeleteStorage_NullStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDeleteStorage_ValidParam", nullptr,
            TestDeleteStorage_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamRead_NullStream", nullptr,
            TestStreamRead_NullStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamRead_NullBuffer", nullptr,
            TestStreamRead_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamRead_NullReadSize", nullptr,
            TestStreamRead_NullReadSize,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamRead_ValidParam", nullptr,
            TestStreamRead_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamWrite_NullStream", nullptr,
            TestStreamWrite_NullStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamWrite_NullBuffer", nullptr,
            TestStreamWrite_NullBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamWrite_NullWriteSize", nullptr,
            TestStreamWrite_NullWriteSize,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamWrite_ValidParam", nullptr,
            TestStreamWrite_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamSeek_NullStream", nullptr,
            TestStreamSeek_NullStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamSeek_ValidParam", nullptr,
            TestStreamSeek_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetPosition_NullStream", nullptr,
            TestStreamGetPosition_NullStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetPosition_NullPosition", nullptr,
            TestStreamGetPosition_NullPosition,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetPosition_ValidParam", nullptr,
            TestStreamGetPosition_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetSize_NullStream", nullptr,
            TestStreamGetSize_NullStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetSize_NullSize", nullptr,
            TestStreamGetSize_NullSize,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetSize_ValidParam", nullptr,
            TestStreamGetSize_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDestroyStream_NullStream", nullptr,
            TestDestroyStream_NullStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDestroyStream_ValidParam", nullptr,
            TestDestroyStream_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDestroyDocument_NullDocument", nullptr,
            TestDestroyDocument_NullDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestDestroyDocument_ValidParam", nullptr,
            TestDestroyDocument_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageDeleteAllEntry_NullStorage", nullptr,
            TestStorageDeleteAllEntry_NullStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageDeleteAllEntry_ValidParam", nullptr,
            TestStorageDeleteAllEntry_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetOEid_NullStorage", nullptr,
            TestStorageGetOEid_NullStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetOEid_NullOEidOut", nullptr,
            TestStorageGetOEid_NullOEidOut,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetOEid_ZeroBufferSize", nullptr,
            TestStorageGetOEid_ZeroBufferSize,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetOEid_ValidParam", nullptr,
            TestStorageGetOEid_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageSetOEid_NullStorage", nullptr,
            TestStorageSetOEid_NullStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageSetOEid_NullOEid", nullptr,
            TestStorageSetOEid_NullOEid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageSetOEid_ZeroBufferSize", nullptr,
            TestStorageSetOEid_ZeroBufferSize,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageSetOEid_ValidParam", nullptr,
            TestStorageSetOEid_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElements_CreateElements", nullptr,
            TestStorageElements_CreateElements,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageGetElements_ValidParam", nullptr,
            TestStorageGetElements_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementsGetCount_NullElements", nullptr,
            TestStorageElementsGetCount_NullElements,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementsGetCount_NullCount", nullptr,
            TestStorageElementsGetCount_NullCount,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementsGetCount_ValidParam", nullptr,
            TestStorageElementsGetCount_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementsGetElement_NullElements", nullptr,
            TestStorageElementsGetElement_NullElements,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementsGetElement_NullElement", nullptr,
            TestStorageElementsGetElement_NullElement,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementsGetElement_ValidParam", nullptr,
            TestStorageElementsGetElement_ValidParam,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementGetName_NullElement", nullptr,
            TestStorageElementGetName_NullElement,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementGetName_NullName", nullptr,
            TestStorageElementGetName_NullName,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementGetName_NullLength", nullptr,
            TestStorageElementGetName_NullLength,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementGetCTime_NullElement", nullptr,
            TestStorageElementGetCTime_NullElement,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementGetCTime_NullTime", nullptr,
            TestStorageElementGetCTime_NullTime,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementGetMTime_NullElement", nullptr,
            TestStorageElementGetMTime_NullElement,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementGetMTime_NullTime", nullptr,
            TestStorageElementGetMTime_NullTime,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementIsStorage_NullElement", nullptr,
            TestStorageElementIsStorage_NullElement,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementIsStorage_NullResult", nullptr,
            TestStorageElementIsStorage_NullResult,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementIsStream_NullElement", nullptr,
            TestStorageElementIsStream_NullElement,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageElementIsStream_NullResult", nullptr,
            TestStorageElementIsStream_NullResult,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCopyTo_NullSrcStorage", nullptr,
            TestStorageCopyTo_NullSrcStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStorageCopyTo_NullDstStorage", nullptr,
            TestStorageCopyTo_NullDstStorage,
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
