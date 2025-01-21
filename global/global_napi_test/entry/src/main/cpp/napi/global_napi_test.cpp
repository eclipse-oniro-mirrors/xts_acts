/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include "raw_file_manager.h"
#include "raw_file.h"
#include "raw_dir.h"
#include "hilog/log.h"
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <vector>
int GLOBAL_RESMGR = 0xDDD;
const int SUBLEN = 100;
static napi_value GetFileList(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = { nullptr };

    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[1], strBuf, sizeof(strBuf), &strSize);
    std::string filename(strBuf, strSize);
    RawDir* rawDir = OH_ResourceManager_OpenRawDir(mNativeResMgr, filename.c_str());
    int count = OH_ResourceManager_GetRawFileCount(rawDir);
    std::vector<std::string> tempArray;
    for (int i = 0; i < count; i++) {
        std::string rawfilename = OH_ResourceManager_GetRawFileName(rawDir, i);
        tempArray.emplace_back(rawfilename);
    }

    napi_value fileList;
    napi_create_array(env, &fileList);
    for (size_t i = 0; i < tempArray.size(); i++) {
        napi_value jsString;
        napi_create_string_utf8(env, tempArray[i].c_str(), NAPI_AUTO_LENGTH, &jsString);
        napi_set_element(env, fileList, i, jsString);
    }
    OH_ResourceManager_CloseRawDir(rawDir);
    OH_ResourceManager_ReleaseNativeResourceManager(mNativeResMgr);
    return fileList;
}

napi_value CreateJsArrayValue(napi_env env, std::unique_ptr<uint8_t[]> &data, long length)
{
    napi_value buffer;
    napi_status status = napi_create_external_arraybuffer(env, data.get(), length,
            [](napi_env env, void *data, void *hint) {
                delete[] static_cast<char*>(data);
            }, nullptr, &buffer);
    if (status != napi_ok) {
        return nullptr;
    }
    napi_value result = nullptr;
    status = napi_create_typedarray(env, napi_uint8_array, length, buffer, 0, &result);
    if (status != napi_ok) {
        return nullptr;
    }
    data.release();
    return result;
}

static napi_value GetRawFileContent(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = { nullptr };

    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[1], strBuf, sizeof(strBuf), &strSize);
    std::string filename(strBuf, strSize);
    RawFile *rawFile = OH_ResourceManager_OpenRawFile(mNativeResMgr, filename.c_str());
    if (rawFile != nullptr) {
        return nullptr;
    }
    long len = OH_ResourceManager_GetRawFileSize(rawFile);
    std::unique_ptr<uint8_t[]> data = std::make_unique<uint8_t[]>(len);

    long offset = OH_ResourceManager_GetRawFileOffset(rawFile);
    if(offset == 0){
        return nullptr;
    }

    long size = OH_ResourceManager_SeekRawFile(rawFile, 1, 0);
    if(size == -1){
        return nullptr;
    }

    long offset1 = 0;
    while (OH_ResourceManager_GetRawFileRemainingLength(rawFile) > 0) {
        OH_ResourceManager_ReadRawFile(rawFile, data.get() + offset1, SUBLEN);
        offset1 += SUBLEN;
    }

    OH_ResourceManager_CloseRawFile(rawFile);
    OH_ResourceManager_ReleaseNativeResourceManager(mNativeResMgr);
    return CreateJsArrayValue(env, data, len);
}

static napi_value GetRawFileContent64(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[1], strBuf, sizeof(strBuf), &strSize);
    std::string filename(strBuf, strSize);
    RawFile64 *rawFile = OH_ResourceManager_OpenRawFile64(mNativeResMgr, filename.c_str());
    if (rawFile != nullptr) {
        return nullptr;
    }
    long len = OH_ResourceManager_GetRawFileSize64(rawFile);
    std::unique_ptr<uint8_t[]>data = std::make_unique<uint8_t[]>(len);

    int64_t offset = OH_ResourceManager_GetRawFileOffset64(rawFile);
    if (offset == 0) {
        return nullptr;
    }

    int size = OH_ResourceManager_SeekRawFile64(rawFile, 1, 0);
    if (size == -1) {
        return nullptr;
    }

    int64_t offset1 = 0;
    while (OH_ResourceManager_GetRawFileRemainingLength64(rawFile) > 0) {
        OH_ResourceManager_ReadRawFile64(rawFile, data.get() + offset1, SUBLEN);
        offset1 += SUBLEN;
    }

    OH_ResourceManager_CloseRawFile64(rawFile);
    OH_ResourceManager_ReleaseNativeResourceManager(mNativeResMgr);
    return CreateJsArrayValue(env, data, len);
}

napi_value createJsFileDescriptor(napi_env env, RawFileDescriptor &descriptor)
{
    napi_value result;
    napi_status status = napi_create_object(env, &result);
    if (status != napi_ok) {
        return result;
    }

    napi_value fd;
    status = napi_create_int32(env, descriptor.fd, &fd);
    if (status != napi_ok) {
        return result;
    }
    status = napi_set_named_property(env, result, "fd", fd);
    if (status != napi_ok) {
        return result;
    }

    napi_value offset;
    status = napi_create_int64(env, descriptor.start, &offset);
    if (status != napi_ok) {
        return result;
    }
    status = napi_set_named_property(env, result, "offset", offset);
    if (status != napi_ok) {
        return result;
    }

    napi_value length;
    status = napi_create_int64(env, descriptor.length, &length);
    if (status != napi_ok) {
        return result;
    }
    status = napi_set_named_property(env, result, "length", length);
    if (status != napi_ok) {
        return result;
    }
    return result;
}

napi_value createJsFileDescriptor64(napi_env env, RawFileDescriptor64 *descriptor)
{
    napi_value result;
    napi_status status = napi_create_object(env, &result);
    if (status != napi_ok) {
        return result;
    }

    napi_value fd;
    status = napi_create_int32(env, descriptor->fd, &fd);
    if (status != napi_ok) {
        return result;
    }
    status = napi_set_named_property(env, result, "fd", fd);
    if (status != napi_ok) {
        return result;
    }

    napi_value offset;
    status = napi_create_int64(env, descriptor->start, &offset);
    if (status != napi_ok) {
        return result;
    }
    status = napi_set_named_property(env, result, "offset", offset);
    if (status != napi_ok) {
        return result;
    }

    napi_value length;
    status = napi_create_int64(env, descriptor->length, &length);
    if (status != napi_ok) {
        return result;
    }
    return result;
}

static napi_value GetRawFileDescriptor(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = { nullptr };

    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[1], strBuf, sizeof(strBuf), &strSize);
    std::string filename(strBuf, strSize);
    RawFile *rawFile = OH_ResourceManager_OpenRawFile(mNativeResMgr, filename.c_str());
    if (rawFile != nullptr) {
        return nullptr;
    }
    RawFileDescriptor descriptor;
    OH_ResourceManager_GetRawFileDescriptor(rawFile, descriptor);
    OH_ResourceManager_ReleaseRawFileDescriptor(descriptor);

    OH_ResourceManager_CloseRawFile(rawFile);
    OH_ResourceManager_ReleaseNativeResourceManager(mNativeResMgr);
    return createJsFileDescriptor(env,descriptor);
}

static napi_value GetRawFileDescriptor64(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    napi_valuetype valueType;
    napi_typeof(env, argv[0], &valueType);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[1], strBuf, sizeof(strBuf), &strSize);
    std::string filename(strBuf, strSize);
    RawFile64 *rawFile = OH_ResourceManager_OpenRawFile64(mNativeResMgr, filename.c_str());
    if (rawFile != nullptr) {
        return nullptr;
    }
    RawFileDescriptor64 *descriptor = new RawFileDescriptor64();
    OH_ResourceManager_GetRawFileDescriptor64(rawFile, descriptor);
    OH_ResourceManager_ReleaseRawFileDescriptor64(descriptor);

    OH_ResourceManager_CloseRawFile64(rawFile);
    OH_ResourceManager_ReleaseNativeResourceManager(mNativeResMgr);
    return createJsFileDescriptor64(env, descriptor);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "GetFileList", nullptr, GetFileList, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetRawFileContent", nullptr, GetRawFileContent, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetRawFileDescriptor", nullptr, GetRawFileDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetRawFileContent64", nullptr, GetRawFileContent64, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetRawFileDescriptor64", nullptr, GetRawFileDescriptor64, nullptr, nullptr, nullptr, napi_default, nullptr }
    };

    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "resmgrndk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}