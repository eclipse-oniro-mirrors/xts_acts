/*
* Copyright (C) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

#include <dlfcn.h>
#include <fcntl.h>
#include <linux/kd.h>
#include <string>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <cstring>

#include <hilog/log.h>
#include "napi/native_api.h"
#include <multimedia/image_framework/image/image_source_native.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "ImageGetMimeType"

#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

#define NUM_0 0
#define NUM_1 1
#define NUM_2 2
#define NUM_3 3
#define NUM_4 4
#define MAX_STRING_SIZE 128
#define MAX_PATH_SIZE 1024

static std::string GetImageSourceMimeType(OH_ImageSourceNative *source)
{
    Image_MimeType mimeType;
    OH_ImageSource_Info *info = nullptr;
    Image_ErrorCode  error = OH_ImageSourceInfo_Create(&info);
    if (error != IMAGE_SUCCESS) {
        OH_ImageSourceNative_Release(source);
        return "";
    }
    int32_t index = 0;
    error = OH_ImageSourceNative_GetImageInfo(source, index, info);
    if (error != 0) {
        OH_ImageSourceInfo_Release(info);
        OH_ImageSourceNative_Release(source);
        return "";
    }
    error = OH_ImageSourceInfo_GetMimeType(info, &mimeType);
    if (error != 0) {
        OH_ImageSourceInfo_Release(info);
        OH_ImageSourceNative_Release(source);
        return "";
    }
    std::string result(mimeType.data, mimeType.size);
    OH_ImageSourceInfo_Release(info);
    OH_ImageSourceNative_Release(source);
    return result;
}

static uint32_t getNativeImageSource(napi_env env, napi_callback_info info,
    napi_value* argValue, size_t &argCount)
{
    napi_value thisVar = nullptr;
    if (argValue == nullptr || argCount == 0) {
        return -1;
    }
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        return -1;
    }
    return 0;
}

static napi_value JsImageSourceGetMimeType_Uri(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    uint32_t num = getNativeImageSource(env, info, argValue, argCount);
    if (num != NUM_0) {
        LOGE("getNativeImageSource failed");
        return result;
    }

    const size_t maxUriLen = MAX_PATH_SIZE;
    char uri[maxUriLen] = "";
    size_t uriSize = NUM_0;
    napi_get_value_string_utf8(env, argValue[NUM_0], uri, maxUriLen, &uriSize);

    OH_ImageSourceNative *source = nullptr;
    Image_ErrorCode ret = OH_ImageSourceNative_CreateFromUri(uri, uriSize, &source);
    if (ret != IMAGE_SUCCESS) {
        LOGE("OH_ImageSourceNative_CreateFromUri failed: err = %{public}d.", ret);
        return result;
    }

    std::string mimeTypeStr = GetImageSourceMimeType(source);
    napi_create_string_utf8(env, mimeTypeStr.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value JsImageSourceGetMimeType_Fd(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value argValue[NUM_1] = {nullptr};
    size_t argCount = NUM_1;
    uint32_t num = getNativeImageSource(env, info, argValue, argCount);
    if (num != 0) {
        LOGE("getNativeImageSource failed");
        return result;
    }

    int32_t fd;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    if (fd < 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }

    OH_ImageSourceNative *source = nullptr;
    Image_ErrorCode ret = OH_ImageSourceNative_CreateFromFd(fd, &source);
    if (ret != IMAGE_SUCCESS) {
        LOGE("OH_ImageSourceNative_CreateFromFd failed: err = %{public}d.", ret);
        return result;
    }

    std::string mimeTypeStr = GetImageSourceMimeType(source);
    napi_create_string_utf8(env, mimeTypeStr.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value JsImageSourceGetMimeType_Data(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value argValue[NUM_1] = {nullptr};
    size_t argCount = NUM_1;
    uint32_t num = getNativeImageSource(env, info, argValue, argCount);
    if (num != NUM_0) {
        LOGE("getNativeImageSource failed");
        return result;
    }

    void *data = nullptr;
    size_t dataSize = NUM_0;

    napi_status status = napi_get_buffer_info(env, argValue[NUM_0], &data, &dataSize);
    if (status != napi_ok) {
        return result;
    }

    OH_ImageSourceNative *source = nullptr;
    Image_ErrorCode ret = OH_ImageSourceNative_CreateFromData(reinterpret_cast<uint8_t *>(data), dataSize, &source);
    if (ret != IMAGE_SUCCESS) {
        LOGE("OH_ImageSourceNative_CreateFromData failed: err = %{public}d.", ret);
        return result;
    }

    std::string mimeTypeStr = GetImageSourceMimeType(source);
    napi_create_string_utf8(env, mimeTypeStr.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value JsImageSourceGetMimeType_RawFile(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value argValue[NUM_3] = {nullptr};
    size_t argCount = NUM_3;
    uint32_t num = getNativeImageSource(env, info, argValue, argCount);
    if (num != NUM_0) {
        LOGE("getNativeImageSource failed");
        return result;
    }

    RawFileDescriptor rawDesc;
    napi_get_value_int32(env, argValue[NUM_0], &rawDesc.fd);
    if (rawDesc.fd < 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int64_t tmp;
    napi_get_value_int64(env, argValue[NUM_1], &tmp);
    rawDesc.start = static_cast<long>(tmp);
    napi_get_value_int64(env, argValue[NUM_2], &tmp);
    rawDesc.length = static_cast<long>(tmp);

    OH_LOG_INFO(LOG_APP, "lhb CreateFromRawFile fd:%{public}d, start:%{public}ld, length:%{public}ld", rawDesc.fd,
                rawDesc.start, rawDesc.length);

    OH_ImageSourceNative *source = nullptr;
    Image_ErrorCode ret = OH_ImageSourceNative_CreateFromRawFile(&rawDesc, &source);
    if (ret != IMAGE_SUCCESS) {
        LOGE("OH_ImageSourceNative_CreateFromRawFile failed: err = %{public}d.", ret);
        return result;
    }

    std::string mimeTypeStr = GetImageSourceMimeType(source);
    napi_create_string_utf8(env, mimeTypeStr.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value imageSourceGetMimeTypeTest_Error01(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    Image_MimeType mimeType;
    OH_ImageSource_Info *imageSourceInfo = nullptr;
    Image_ErrorCode error = OH_ImageSourceInfo_GetMimeType(imageSourceInfo, &mimeType);
    OH_ImageSourceInfo_Release(imageSourceInfo);
    napi_create_int32(env, error, &result);
    return result;
}

static napi_value imageSourceGetMimeTypeTest_Error02(napi_env env, napi_callback_info info)
{
napi_value result = nullptr;
napi_get_undefined(env, &result);
napi_value argValue[NUM_1] = {nullptr};
size_t argCount = NUM_1;
uint32_t num = getNativeImageSource(env, info, argValue, argCount);
if (num != NUM_0) {
    LOGE("getNativeImageSource failed");
    return result;
}

const size_t maxUriLen = MAX_PATH_SIZE;
char uri[maxUriLen] = "";
size_t uriSize = NUM_0;
napi_get_value_string_utf8(env, argValue[NUM_0], uri, maxUriLen, &uriSize);

OH_ImageSourceNative *source = nullptr;
Image_ErrorCode ret = OH_ImageSourceNative_CreateFromUri(uri, uriSize, &source);

OH_ImageSource_Info *imageSourceInfo = nullptr;
Image_ErrorCode  error = OH_ImageSourceInfo_Create(&imageSourceInfo);
if (error != IMAGE_SUCCESS) {
    OH_ImageSourceNative_Release(source);
    napi_create_int32(env, error, &result);
    return result;
}
int32_t index = NUM_0;
error = OH_ImageSourceNative_GetImageInfo(source, index, imageSourceInfo);
if (error != IMAGE_SUCCESS) {
    OH_ImageSourceInfo_Release(imageSourceInfo);
    OH_ImageSourceNative_Release(source);
    napi_create_int32(env, error, &result);
    return result;
}
error = OH_ImageSourceInfo_GetMimeType(imageSourceInfo, nullptr);
OH_ImageSourceInfo_Release(imageSourceInfo);
napi_create_int32(env, error, &result);
return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {
            "JsImageSourceGetMimeType_Uri", nullptr, JsImageSourceGetMimeType_Uri,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "JsImageSourceGetMimeType_Fd", nullptr, JsImageSourceGetMimeType_Fd,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "JsImageSourceGetMimeType_Data", nullptr, JsImageSourceGetMimeType_Data,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "JsImageSourceGetMimeType_RawFile", nullptr, JsImageSourceGetMimeType_RawFile,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "imageSourceGetMimeTypeTest_Error01", nullptr, imageSourceGetMimeTypeTest_Error01,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "imageSourceGetMimeTypeTest_Error02", nullptr, imageSourceGetMimeTypeTest_Error02,
            nullptr, nullptr, nullptr, napi_static, nullptr
        }
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

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }