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
#include "ohresmgr.h"
#include <string>
#include <sstream>

int GLOBAL_RESMGR = 0xDDD;
const int SUBLEN = 100;
static napi_value GetFileList(napi_env env, napi_callback_info info)
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
    RawDir *rawDir = OH_ResourceManager_OpenRawDir(mNativeResMgr, filename.c_str());
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

napi_value CreateJsString(napi_env env, char *str)
{
    napi_value result;
    if (napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result) != napi_ok) {
        return result;
    }
    return result;
}

napi_value createJsFileDescriptor(napi_env env, RawFileDescriptor *descriptor)
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
    status = napi_create_int32(env, descriptor->start, &offset);
    if (status != napi_ok) {
        return result;
    }
    status = napi_set_named_property(env, result, "offset", offset);
    if (status != napi_ok) {
        return result;
    }

    napi_value length;
    status = napi_create_int32(env, descriptor->length, &length);
    if (status != napi_ok) {
        return result;
    }
    status = napi_set_named_property(env, result, "length", length);
    if (status != napi_ok) {
        return result;
    }
    return result;
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
    napi_value argv[2] = {nullptr};

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
    if (offset == 0) {
        return nullptr;
    }

    long size = OH_ResourceManager_SeekRawFile(rawFile, 1, 0);
    if (size == -1) {
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
    std::unique_ptr<uint8_t[]> data = std::make_unique<uint8_t[]>(len);

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
    napi_value argv[2] = {nullptr};

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
    return createJsFileDescriptor(env, descriptor);
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

static napi_value IsRawDir(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[1], strBuf, sizeof(strBuf), &strSize);
    std::string filename(strBuf, strSize);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    bool result = OH_ResourceManager_IsRawDir(mNativeResMgr, filename.c_str());
    bool flag = (result == false);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetDrawableDescriptor(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    ArkUI_DrawableDescriptor *drawable = nullptr;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, args[0]);
    uint32_t id = 0;
    napi_get_value_uint32(env, args[1], &id);
    OH_ResourceManager_GetDrawableDescriptor(mNativeResMgr, id, &drawable);

    bool flag = (drawable == nullptr);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetDrawableDescriptorByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    ArkUI_DrawableDescriptor *drawable = nullptr;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, args[0]);
    OH_ResourceManager_GetDrawableDescriptorByName(mNativeResMgr, "icon", &drawable);

    bool flag = (drawable != nullptr);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetMediaBase64(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[1], &id);

    char *result = nullptr;
    uint64_t len = 0;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    OH_ResourceManager_GetMediaBase64(mNativeResMgr, id, &result, &len);

    bool flag = (result != nullptr && len != 0);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetMediaBase64ByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    char *result = nullptr;
    uint64_t len = 0;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    OH_ResourceManager_GetMediaBase64ByName(mNativeResMgr, "icon", &result, &len);

    bool flag = (result != nullptr && len != 0);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetMedia(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint32_t id = 0;
    napi_get_value_uint32(env, argv[1], &id);

    uint8_t *result = nullptr;
    uint64_t len = 0;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    OH_ResourceManager_GetMedia(mNativeResMgr, id, &result, &len);

    bool flag = (result != nullptr && len != 0);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetMediaByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    uint8_t *result = nullptr;
    uint64_t len = 0;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    OH_ResourceManager_GetMediaByName(mNativeResMgr, "icon", &result, &len);

    bool flag = (result != nullptr && len != 0);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetSymbolByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    uint32_t result = 0;
    const char *name = "symbol_test";
    ResourceManager_ErrorCode code = OH_ResourceManager_GetSymbolByName(mNativeResMgr, name, &result);

    bool flag = (code == 0 && result == 983040);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetSymbol(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    uint32_t id = 0;
    uint32_t result = 0;
    napi_get_value_uint32(env, argv[1], &id);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    ResourceManager_ErrorCode code = OH_ResourceManager_GetSymbol(mNativeResMgr, id, &result);

    bool flag = (code == 0 && result == 983040);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetBoolByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    bool result = false;
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[1], &id);
    const char *name = "boolean_1";
    ResourceManager_ErrorCode code = OH_ResourceManager_GetBoolByName(mNativeResMgr, name, &result);

    bool flag = (code == 0 && result == true);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetBool(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    uint32_t id = 0;
    bool result = false;
    napi_get_value_uint32(env, argv[1], &id);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    ResourceManager_ErrorCode code = OH_ResourceManager_GetBool(mNativeResMgr, id, &result);

    bool flag = (code == 0 && result == true);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetPluralStringByName(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value argv[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    char *result;
    uint32_t num = 1;
    int second = 2;
    napi_get_value_uint32(env, argv[second], &num);
    const char *name = "eat_apple";
    ResourceManager_ErrorCode code = OH_ResourceManager_GetPluralStringByName(mNativeResMgr, name, num, &result);

    bool flag = (code == 0 && strcmp(result, "1 apples") == 0);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetPluralString(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value argv[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[1], &resId);
    uint32_t num = 0;
    int second = 2;
    napi_get_value_uint32(env, argv[second], &num);
    ResourceManager_ErrorCode code = OH_ResourceManager_GetPluralString(mNativeResMgr, resId, num, &result);

    bool flag = (code == 0 && strcmp(result, "1 apples") == 0);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetColorByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    uint32_t result;
    const char *name = "start_window_background_jjq";
    OH_ResourceManager_GetColorByName(mNativeResMgr, name, &result);

    napi_value jsValue = nullptr;
    napi_create_uint32(env, result, &jsValue);
    return jsValue;
}

static napi_value GetColor(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    uint32_t result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[1], &resId);
    OH_ResourceManager_GetColor(mNativeResMgr, resId, &result);

    napi_value jsValue = nullptr;
    napi_create_uint32(env, result, &jsValue);
    return jsValue;
}

static napi_value GetIntByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    int result;
    const char *name = "integer_1";
    ResourceManager_ErrorCode code = OH_ResourceManager_GetIntByName(mNativeResMgr, name, &result);

    bool flag = (code == 0 && result == 100);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetInt(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    int result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[1], &resId);
    ResourceManager_ErrorCode code = OH_ResourceManager_GetInt(mNativeResMgr, resId, &result);

    bool flag = (code == 0 && result == 100);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetFloatByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    float result;
    const char *name = "float_1";
    ResourceManager_ErrorCode code = OH_ResourceManager_GetFloatByName(mNativeResMgr, name, &result);

    bool flag = (code == 0 && (fabs(result - 30.6) >= 1e-9));
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetFloat(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    float result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[1], &resId);
    ResourceManager_ErrorCode code = OH_ResourceManager_GetFloat(mNativeResMgr, resId, &result);

    bool flag = (code == 0 && (fabs(result - 30.6) >= 1e-9));
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetLocales(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value argv[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);

    char **resultValue;
    uint32_t resultLen;
    bool includeSystem = false;
    OH_ResourceManager_GetLocales(mNativeResMgr, &resultValue, &resultLen, includeSystem);

    std::vector<std::string> tempArray;
    for (uint32_t i = 0; i < resultLen; i++) {
        tempArray.push_back(resultValue[i]);
    }
    napi_value jsStringArray;
    napi_create_array(env, &jsStringArray);
    for (size_t i = 0; i < tempArray.size(); i++) {
        napi_value jsString;
        napi_create_string_utf8(env, tempArray[i].c_str(), NAPI_AUTO_LENGTH, &jsString);
        napi_set_element(env, jsStringArray, i, jsString);
    }
    return jsStringArray;
}

static napi_value GetConfiguration(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    ResourceManager_Configuration config;
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    ResourceManager_ErrorCode code = OH_ResourceManager_GetConfiguration(mNativeResMgr, &config);

    bool flag = (code == 0 && config.direction == 0 && config.deviceType == 0 && config.screenDensity == 3 &&
    config.colorMode == 1 && config.mcc == 0 && config.mnc == 0 && strcmp(config.locale, "zh_Hans_CN") == 0);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetStringArray(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    char **resultValue;
    uint32_t resultLen;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[1], &resId);
    OH_ResourceManager_GetStringArray(mNativeResMgr, resId, &resultValue, &resultLen);

    std::vector<std::string> tempArray;
    for (uint32_t i = 0; i < resultLen; i++) {
        tempArray.push_back(resultValue[i]);
    }
    napi_value jsStringArray;
    napi_create_array(env, &jsStringArray);
    for (size_t i = 0; i < tempArray.size(); i++) {
        napi_value jsString;
        napi_create_string_utf8(env, tempArray[i].c_str(), NAPI_AUTO_LENGTH, &jsString);
        napi_set_element(env, jsStringArray, i, jsString);
    }
    return jsStringArray;
}

static napi_value GetStringArrayByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    char **resultValue;
    uint32_t resultLen;
    const char *name = "size";
    OH_ResourceManager_GetStringArrayByName(mNativeResMgr, name, &resultValue, &resultLen);

    std::vector<std::string> tempArray;
    for (uint32_t i = 0; i < resultLen; i++) {
        tempArray.push_back(resultValue[i]);
    }
    napi_value jsStringArray;
    napi_create_array(env, &jsStringArray);
    for (size_t i = 0; i < tempArray.size(); i++) {
        napi_value jsString;
        napi_create_string_utf8(env, tempArray[i].c_str(), NAPI_AUTO_LENGTH, &jsString);
        napi_set_element(env, jsStringArray, i, jsString);
    }
    return jsStringArray;
}

static napi_value ReleaseStringArray(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    char **resultValue;
    char **resultValueTemp = nullptr;
    uint32_t resultLen;
    const char *name = "size";
    ResourceManager_ErrorCode code;
    OH_ResourceManager_GetStringArrayByName(mNativeResMgr, name, &resultValue, &resultLen);
    resultValueTemp = resultValue;
    code = OH_ResourceManager_ReleaseStringArray(&resultValue, resultLen);

    bool flag = (code == 0 && resultValueTemp != nullptr && resultValue == nullptr);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value ReleaseConfiguration(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    ResourceManager_Configuration config;
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    ResourceManager_ErrorCode code;
    char *temp = static_cast<char *>(malloc(10 * sizeof(char)));
    OH_ResourceManager_GetConfiguration(mNativeResMgr, &config);
    code = OH_ResourceManager_ReleaseConfiguration(&config);

    bool flag = (code == 0 && strcmp(temp, "zh_Hans_CN") == 0 && config.locale == nullptr);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetStringByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    char *result;
    ResourceManager_ErrorCode code = OH_ResourceManager_GetStringByName(mNativeResMgr, "entry_MainAbility", &result);

    bool flag = (code == 0 && strcmp(result, "entry_MainAbility") == 0);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetString(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    char *result;
    uint32_t resId = 0;
    napi_get_value_uint32(env, argv[1], &resId);
    ResourceManager_ErrorCode code = OH_ResourceManager_GetString(mNativeResMgr, resId, &result);

    bool flag = (code == 0 && strcmp(result, "entry_MainAbility") == 0);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetRawFileDescriptorData(napi_env env, napi_callback_info info)
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
    RawFile *rawFile = OH_ResourceManager_OpenRawFile(mNativeResMgr, filename.c_str());
    RawFileDescriptor *descriptor = new RawFileDescriptor();
    OH_ResourceManager_GetRawFileDescriptorData(rawFile, descriptor);
    OH_ResourceManager_ReleaseRawFileDescriptorData(descriptor);
    OH_ResourceManager_GetRawFileDescriptorData(rawFile, descriptor);
    OH_ResourceManager_CloseRawFile(rawFile);
    OH_ResourceManager_ReleaseNativeResourceManager(mNativeResMgr);
    return createJsFileDescriptor(env, descriptor);
}

static napi_value GetLocalesData(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    char **resultValue;
    uint32_t resultLen;
    OH_ResourceManager_GetLocalesData(mNativeResMgr, &resultValue, &resultLen, false);
    char **resultValue1;
    uint32_t resultLen1;
    OH_ResourceManager_GetLocalesData(mNativeResMgr, &resultValue1, &resultLen1, false);
    std::vector<std::string> tempArray;
    for (uint32_t i = 0; i < resultLen; i++) {
        tempArray.push_back(resultValue[i]);
    }
    napi_value jsStringArray;
    napi_create_array(env, &jsStringArray);
    for (size_t i = 0; i < tempArray.size(); i++) {
        napi_value jsString;
        napi_create_string_utf8(env, tempArray[i].c_str(), NAPI_AUTO_LENGTH, &jsString);
        napi_set_element(env, jsStringArray, i, jsString);
    }
    return jsStringArray;
}

static napi_value GetMediaBase64DataByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[1], strBuf, sizeof(strBuf), &strSize);
    char *result = nullptr;
    uint64_t len = 0;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    OH_ResourceManager_GetMediaBase64DataByName(mNativeResMgr, strBuf, &result, &len, 0);
    return CreateJsString(env, result);
}

static napi_value GetMediaBase64Data(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    uint32_t id = 0x000000;
    napi_get_value_uint32(env, argv[1], &id);

    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;

    char *result = NULL;
    uint64_t len = 0;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    OH_ResourceManager_GetMediaBase64Data(mNativeResMgr, hexValue, &result, &len, 0);
    return CreateJsString(env, result);
}

static napi_value GetMediaData(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    uint32_t id = 0;
    napi_get_value_uint32(env, argv[1], &id);

    uint8_t *result = NULL;
    uint64_t len = 0;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    OH_ResourceManager_GetMediaData(mNativeResMgr, id, &result, &len, 0);

    bool flag = (result != NULL && len != 0);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetMediaDataByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[1], strBuf, sizeof(strBuf), &strSize);

    uint8_t *result = NULL;
    uint64_t len = 0;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    OH_ResourceManager_GetMediaDataByName(mNativeResMgr, strBuf, &result, &len, 0);

    bool flag = (result != NULL && len != 0);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetDrawableDescriptorData(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    ArkUI_DrawableDescriptor *drawable = NULL;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);

    uint32_t id = 0x000000;
    napi_get_value_uint32(env, argv[1], &id);

    std::stringstream ss;
    ss << std::hex << id;
    uint32_t hexValue;
    ss >> hexValue;

    OH_ResourceManager_GetDrawableDescriptorData(mNativeResMgr, id, &drawable, 0, 0);
    bool flag = (drawable != NULL);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value GetDrawableDescriptorDataByName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    size_t strSize;
    char strBuf[256];
    napi_get_value_string_utf8(env, argv[1], strBuf, sizeof(strBuf), &strSize);
    ArkUI_DrawableDescriptor *drawable = NULL;
    NativeResourceManager *mNativeResMgr = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);

    OH_ResourceManager_GetDrawableDescriptorDataByName(mNativeResMgr, strBuf, &drawable, 0, 0);
    bool flag = (drawable != NULL);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value AddResource(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    ResourceManager_ErrorCode code = OH_ResourceManager_AddResource(nullptr, "");
    bool flag = (code == 401);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

static napi_value RemoveResource(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    ResourceManager_ErrorCode code = OH_ResourceManager_RemoveResource(nullptr, "");
    bool flag = (code == 401);
    napi_value value = nullptr;
    napi_get_boolean(env, flag, &value);
    return value;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetFileList", nullptr, GetFileList, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetRawFileContent", nullptr, GetRawFileContent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetRawFileDescriptor", nullptr, GetRawFileDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetRawFileContent64", nullptr, GetRawFileContent64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetRawFileDescriptor64", nullptr, GetRawFileDescriptor64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"IsRawDir", nullptr, IsRawDir, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDrawableDescriptor", nullptr, GetDrawableDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDrawableDescriptorByName", nullptr, GetDrawableDescriptorByName, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"GetMediaBase64", nullptr, GetMediaBase64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetMediaBase64ByName", nullptr, GetMediaBase64ByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetMedia", nullptr, GetMedia, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetMediaByName", nullptr, GetMediaByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetSymbolByName", nullptr, GetSymbolByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetSymbol", nullptr, GetSymbol, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetBoolByName", nullptr, GetBoolByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetBool", nullptr, GetBool, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetPluralStringByName", nullptr, GetPluralStringByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetPluralString", nullptr, GetPluralString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetColorByName", nullptr, GetColorByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetColor", nullptr, GetColor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetIntByName", nullptr, GetIntByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetInt", nullptr, GetInt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetFloatByName", nullptr, GetFloatByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetFloat", nullptr, GetFloat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetLocales", nullptr, GetLocales, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetConfiguration", nullptr, GetConfiguration, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetStringArray", nullptr, GetStringArray, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetStringArrayByName", nullptr, GetStringArrayByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ReleaseStringArray", nullptr, ReleaseStringArray, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ReleaseConfiguration", nullptr, ReleaseConfiguration, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetStringByName", nullptr, GetStringByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetString", nullptr, GetString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetRawFileDescriptorData", nullptr, GetRawFileDescriptorData, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"GetLocalesData", nullptr, GetLocalesData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetMediaBase64DataByName", nullptr, GetMediaBase64DataByName, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"GetMediaBase64Data", nullptr, GetMediaBase64Data, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetMediaData", nullptr, GetMediaData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetMediaDataByName", nullptr, GetMediaDataByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetDrawableDescriptorData", nullptr, GetDrawableDescriptorData, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"GetDrawableDescriptorDataByName", nullptr, GetDrawableDescriptorDataByName, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"AddResource", nullptr, AddResource, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveResource", nullptr, RemoveResource, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "resmgrndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}