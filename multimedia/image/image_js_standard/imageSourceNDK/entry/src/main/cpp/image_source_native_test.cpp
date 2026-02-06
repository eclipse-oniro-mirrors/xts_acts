/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <memory>
#include <string>
#include <map>
#include <uv.h>
#include <cstddef>
#include <cstdint>
#include "node_api.h"
#include "hilog/log.h"
#include "image_source_native_test.h"
#include "native_color_space_manager/native_color_space_manager.h"

namespace OHOS {
namespace Media {

using namespace std;


static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_3 = 3;
static constexpr uint32_t MAX_STRING_SIZE = 128;
static constexpr uint32_t MAKER_NOTE_SIZE_MAX = 64 * 1024;

const unsigned char INIT_HW_DATA[] = {
    0x48, 0x55, 0x41, 0x57, 0x45, 0x49, 0x00, 0x00, // Offset 0x06: "HWEI" (Industry standard identifier, 已更改为通用描述)
    //order_offset = 6+8
    0x4D, 0x4D,                          // Offset 0x0E: "MM" (Motorola 字节序，大端序)
    0x00, 0x2A,                          // Offset 0x10: 固定值 0x002A (TIFF 文件标志)
    0x00, 0x00, 0x00, 0x08,              // Offset 0x12: 偏移量 0x08 (指向 IFD 的起始位置)
    //ifd_data_offset = 6+8+8
    0x00, 0x01,                          // Offset 0x16: IFD 条目数量 (1 个条目)
    0x02, 0x00,                          // Offset 0x18: 条目 1 的 Tag = 0x0200
    0x00, 0x04,                          // Offset 0x1A: 条目 1 的 Format = 4 (LONG 类型)
    0x00, 0x00, 0x00, 0x01,              // Offset 0x1C: 条目 1 的 Components = 1 (1 个组件)
    0x00, 0x00, 0x00, 0x00,              // Offset 0x20: 条目 1 的数据偏移量或值 (此处为 0)
    0x00, 0x00, 0x00, 0x00,              // Offset 0x24: 填充字节（保留字段或对齐用）
    0x00, 0x00, 0x00, 0x00               // Offset 0x28: 填充字节（保留字段或对齐用）
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {
            "JsGetImageProperty", nullptr, ImageSourceTest::JsGetImageProperty,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "JsModifyImageProperty", nullptr, ImageSourceTest::JsModifyImageProperty,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "setDecodingOptColorSpace", nullptr, ImageSourceTest::setDecodingOptColorSpace,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "setDecodingOptColorSpaceErr", nullptr, ImageSourceTest::setDecodingOptColorSpaceErr,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "getDecodingOptColorSpace", nullptr, ImageSourceTest::getDecodingOptColorSpace,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "getDecodingOptColorSpaceErr", nullptr, ImageSourceTest::getDecodingOptColorSpaceErr,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "getPixelMapForColorSpace", nullptr, ImageSourceTest::getPixelMapForColorSpace,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "SetDesiredDynamicRangeToDecodingOptions", nullptr,
            ImageSourceTest::SetDesiredDynamicRangeToDecodingOptions, nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "createImageSource", nullptr, ImageSourceTest::createImageSource,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "createDecodingOptions", nullptr, ImageSourceTest::createDecodingOptions,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "createPixelmap", nullptr, ImageSourceTest::createPixelmap,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "releaseImageSource", nullptr, ImageSourceTest::releaseImageSource,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "releaseDecodingOptions", nullptr, ImageSourceTest::releaseDecodingOptions,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "releasePixelMap", nullptr, ImageSourceTest::releasePixelMap,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "ModifyMakerNoteImageProperty", nullptr, ImageSourceTest::ModifyMakerNoteImageProperty,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "GetMakerNoteImageProperty", nullptr, ImageSourceTest::GetMakerNoteImageProperty,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "testPackPixelMapToFile", nullptr, ImageSourceTest::testPackPixelMapToFile,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "SetMimeTypeToTestPackingOptions", nullptr, ImageSourceTest::SetMimeTypeToTestPackingOptions,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "SetQualityToTestPackingOptions", nullptr, ImageSourceTest::SetQualityToTestPackingOptions,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "SetNeedsPackPropertiesToTestPackingOptions", nullptr,
            ImageSourceTest::SetNeedsPackPropertiesToTestPackingOptions, nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "CreatePackingOptions", nullptr, ImageSourceTest::CreatePackingOptions,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestGetImagePropertyShort", nullptr, ImageSourceTest::TestGetImagePropertyShort,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestGetImagePropertyLong", nullptr, ImageSourceTest::TestGetImagePropertyLong,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestGetImagePropertyDouble", nullptr, ImageSourceTest::TestGetImagePropertyDouble,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestGetImagePropertyArraySize", nullptr, ImageSourceTest::TestGetImagePropertyArraySize,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestGetImagePropertyString", nullptr, ImageSourceTest::TestGetImagePropertyString,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestGetImagePropertyIntArray", nullptr, ImageSourceTest::TestGetImagePropertyIntArray,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestGetImagePropertyDoubleArray", nullptr, ImageSourceTest::TestGetImagePropertyDoubleArray,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestGetImagePropertyBlob", nullptr, ImageSourceTest::TestGetImagePropertyBlob,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestGetImagePropertyError", nullptr, ImageSourceTest::TestGetImagePropertyError,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestModifyImagePropertyShort", nullptr, ImageSourceTest::TestModifyImagePropertyShort,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestModifyImagePropertyLong", nullptr, ImageSourceTest::TestModifyImagePropertyLong,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestModifyImagePropertyDouble", nullptr, ImageSourceTest::TestModifyImagePropertyDouble,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestModifyImagePropertyIntArray", nullptr, ImageSourceTest::TestModifyImagePropertyIntArray,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestModifyImagePropertyDoubleArray", nullptr, ImageSourceTest::TestModifyImagePropertyDoubleArray,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestModifyImagePropertyBlob", nullptr, ImageSourceTest::TestModifyImagePropertyBlob,
            nullptr, nullptr, nullptr, napi_static, nullptr
        },
        {
            "TestModifyImagePropertyError", nullptr, ImageSourceTest::TestModifyImagePropertyError,
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
    .nm_modname = "entryMDK",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}

napi_value ImageSourceTest::JsGetImageProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        LOG("JsGetImageProperty failed to parse params");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    std::string propertyKey = getStringFromArgs(env, argValue[NUM_1]);

    std::string value;
    ImageSourceModuleTest ismt;
    Image_ErrorCode ret = ismt.GetImageProperty(fd, propertyKey, &value);
    if (ret != IMAGE_SUCCESS) {
        LOG("JsGetImageProperty failed");
        return result;
    }
    LOG("value = %{public}s", value.c_str());
    napi_create_string_utf8(env, value.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

napi_value ImageSourceTest::JsModifyImageProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok) {
        LOG("JsModifyImageProperty failed to parse params");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);

    std::string propertyKey = getStringFromArgs(env, argValue[NUM_1]);
    std::string propertyValue = getStringFromArgs(env, argValue[NUM_2]);

    std::string value;
    ImageSourceModuleTest ismt;
    Image_ErrorCode ret = ismt.ModifyImageProperty(fd, propertyKey, propertyValue, &value);
    if (ret != IMAGE_SUCCESS) {
        LOG("JsModifyImageProperty failed");
        return result;
    }
    LOG("value = %{public}s", value.c_str());
    napi_create_string_utf8(env, value.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

std::string ImageSourceTest::getStringFromArgs(napi_env env, napi_value arg)
{
    size_t bufLength = 0;
    napi_status status = napi_get_value_string_utf8(env, arg, nullptr, 0, &bufLength);
    if (status != napi_ok || bufLength > PATH_MAX) {
        return nullptr;
    }

    char *buffer = static_cast<char *>(malloc((bufLength + 1) * sizeof(char)));
    if (buffer == nullptr) {
        return nullptr;
    }

    status = napi_get_value_string_utf8(env, arg, buffer, bufLength + 1, &bufLength);
    if (status != napi_ok) {
        free(buffer);
        return nullptr;
    }

    std::string strValue = buffer;
    free(buffer);
    return strValue;
}

napi_value ImageSourceTest::setDecodingOptColorSpace(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("setDecodingOptColorSpace: Invalid input parameters");
        return result;
    }
    void *ptr = nullptr;
    if (napi_get_value_external(env, argValue[NUM_0], &ptr) != napi_ok || ptr == nullptr) {
        LOG("setDecodingOptColorSpace: Failed to get DecodingOptions pointer");
        return result;
    }
    OH_DecodingOptions *ops = reinterpret_cast<OH_DecodingOptions *>(ptr);
    
    int32_t colorSpaceName;
    napi_get_value_int32(env, argValue[NUM_1], &colorSpaceName);
    Image_ErrorCode errCode = OH_DecodingOptions_SetDesiredColorSpace(ops, colorSpaceName);
    if (errCode != IMAGE_SUCCESS) {
        LOG("setDecodingOptColorSpace: Failed to set ColorSpace, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, errCode, &result);
    return result;
}

napi_value ImageSourceTest::setDecodingOptColorSpaceErr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);

    void *ptr = nullptr;
    Image_ErrorCode errCode = IMAGE_SUCCESS;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    if (ptr == nullptr) {
        errCode = OH_DecodingOptions_SetDesiredColorSpace(nullptr, ColorSpaceName::ADOBE_RGB);
        LOG("setDecodingOptColorSpaceErr: Failed to set DecodingOpt nullPtr. errorCode: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    return result;
}

napi_value ImageSourceTest::getDecodingOptColorSpace(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOG("getDecodingOptColorSpace: Invalid input parameters");
        return result;
    }
    void *ptr = nullptr;
    if (napi_get_value_external(env, argValue[NUM_0], &ptr) != napi_ok || ptr == nullptr) {
        LOG("getDecodingOptColorSpace: Failed to get DecodingOptions pointer");
        return result;
    }
    OH_DecodingOptions *ops = reinterpret_cast<OH_DecodingOptions *>(ptr);
    int32_t colorSpaceName;
    Image_ErrorCode errCode = OH_DecodingOptions_GetDesiredColorSpace(ops, &colorSpaceName);
    if (errCode != IMAGE_SUCCESS) {
        LOG("getDecodingOptColorSpace: Failed to get ColorSpace, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value ImageSourceTest::getDecodingOptColorSpaceErr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);

    Image_ErrorCode errCode = IMAGE_SUCCESS;
    void *ptr = nullptr;
    if (napi_get_value_external(env, argValue[NUM_0], &ptr) != napi_ok || ptr == nullptr) {
        int32_t colorSpaceName;
        errCode = OH_DecodingOptions_GetDesiredColorSpace(nullptr, &colorSpaceName);
        LOG("getDecodingOptColorSpace: Failed to get ColorSpace, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    OH_DecodingOptions *ops = reinterpret_cast<OH_DecodingOptions *>(ptr);
    errCode = OH_DecodingOptions_GetDesiredColorSpace(ops, nullptr);
    LOG("getDecodingOptColorSpace: Failed to get ColorSpace, error code: %{public}d", errCode);
    napi_create_int32(env, errCode, &result);
    return result;
}

napi_value ImageSourceTest::getPixelMapForColorSpace(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOG("getPixelMapForColorSpace, the input parameters are smaller than the required parameters");
        return result;
    }
    void *ptr = nullptr;
    if (napi_get_value_external(env, argValue[NUM_0], &ptr) != napi_ok || ptr == nullptr) {
        LOG("getPixelMapForColorSpace: Failed to get DecodingOptions pointer");
        return result;
    }
    OH_PixelmapNative *pixelMap = reinterpret_cast<OH_PixelmapNative *>(ptr);
    OH_NativeColorSpaceManager *colorSpaceNative = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_GetColorSpaceNative(pixelMap, &colorSpaceNative);
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_PixelmapNative_GetColorSpaceNative failed, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    int colorSpaceName = OH_NativeColorSpaceManager_GetColorSpaceName(colorSpaceNative);
    OH_NativeColorSpaceManager_Destroy(colorSpaceNative);
    napi_create_int32(env, colorSpaceName, &result);
    return result;
}

napi_value ImageSourceTest::SetDesiredDynamicRangeToDecodingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("SetDesiredDynamicRangeToDecodingOptions get needsPackProperties failed");
        return result;
    }

    void *decodingOptPtr = nullptr;
    if (napi_get_value_external(env, argValue[NUM_0], &decodingOptPtr) != napi_ok || decodingOptPtr == nullptr) {
        LOG("SetDesiredDynamicRange: Failed to get decodingOptions pointer");
        return result;
    }
    OH_DecodingOptions *ops = reinterpret_cast<OH_DecodingOptions *>(decodingOptPtr);
    int32_t desiredDynamicRange;
    napi_get_value_int32(env, argValue[NUM_1], &desiredDynamicRange);

    Image_ErrorCode errCode = OH_DecodingOptions_SetDesiredDynamicRange(ops, desiredDynamicRange);
    if (errCode != IMAGE_SUCCESS) {
        LOG("SetDesiredDynamicRange: Failed to set desiredDynamicRange, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, errCode, &result);
    return result;
}

napi_value ImageSourceTest::createImageSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOG("createImageSource: Invalid input parameters");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    napi_create_external(env, reinterpret_cast<void *>(imageSource), nullptr, nullptr, &result);
    LOG("createImageSource: imageSource created successfully");
    return result;
}

napi_value ImageSourceTest::createDecodingOptions(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    OH_DecodingOptions *decodingOpt = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&decodingOpt);
    if (errCode != IMAGE_SUCCESS || decodingOpt == nullptr) {
        LOG("createDecodingOptions: Failed to create DecodingOptions, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_external(env, reinterpret_cast<void *>(decodingOpt), nullptr, nullptr, &result);
    LOG("createDecodingOptions: DecodingOptions created successfully");
    return result;
}

napi_value ImageSourceTest::createPixelmap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("createPixelmap: Invalid input parameters");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    void *decodingOptPtr = nullptr;
    if (napi_get_value_external(env, argValue[NUM_1], &decodingOptPtr) != napi_ok || decodingOptPtr == nullptr) {
        LOG("createPixelmap: Failed to get decodingOptions pointer");
        return result;
    }
    OH_DecodingOptions *ops = reinterpret_cast<OH_DecodingOptions *>(decodingOptPtr);
    OH_PixelmapNative *pixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(imageSource, ops, &pixelMap);
    if (errCode != IMAGE_SUCCESS || pixelMap == nullptr) {
        LOG("createPixelmap: Failed to create PixelMap, error code: %{public}d", errCode);
        OH_ImageSourceNative_Release(imageSource);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_external(env, reinterpret_cast<void *>(pixelMap), nullptr, nullptr, &result);
    OH_ImageSourceNative_Release(imageSource);
    return result;
}

napi_value ImageSourceTest::releaseImageSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOG("releaseImageSource: Invalid input parameters");
        return result;
    }

    void *ptr = nullptr;
    if (napi_get_value_external(env, argValue[NUM_0], &ptr) != napi_ok || ptr == nullptr) {
        LOG("releaseImageSource: Failed to get imageSource pointer");
        return result;
    }
    OH_ImageSourceNative *imageSource = reinterpret_cast<OH_ImageSourceNative *>(ptr);
    if (imageSource != nullptr) {
        Image_ErrorCode errCode = OH_ImageSourceNative_Release(imageSource);
        napi_create_int32(env, errCode, &result);
        imageSource = nullptr;
        return result;
    }
    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

napi_value ImageSourceTest::releaseDecodingOptions(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOG("releaseDecodingOptions: Invalid input parameters");
        return result;
    }

    void *ptr = nullptr;
    if (napi_get_value_external(env, argValue[NUM_0], &ptr) != napi_ok || ptr == nullptr) {
        LOG("releaseDecodingOptions: Failed to get decodingOptions pointer");
        return result;
    }
    OH_DecodingOptions *ops = reinterpret_cast<OH_DecodingOptions *>(ptr);
    if (ops != nullptr) {
        Image_ErrorCode errCode = OH_DecodingOptions_Release(ops);
        napi_create_int32(env, errCode, &result);
        ops = nullptr;
        return result;
    }
    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

napi_value ImageSourceTest::releasePixelMap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOG("releasePixelMap: Invalid input parameters");
        return result;
    }

    void *ptr = nullptr;
    if (napi_get_value_external(env, argValue[NUM_0], &ptr) != napi_ok || ptr == nullptr) {
        LOG("releasePixelMap: Failed to get pixelMap pointer");
        return result;
    }
    OH_PixelmapNative *pixelMap = reinterpret_cast<OH_PixelmapNative *>(ptr);
    if (pixelMap != nullptr) {
        Image_ErrorCode errCode = OH_PixelmapNative_Release(pixelMap);
        napi_create_int32(env, errCode, &result);
        pixelMap = nullptr;
        return result;
    }
    napi_create_int32(env, IMAGE_SUCCESS, &result);
    return result;
}

OH_ImageSourceNative* GetImageSourceFromArgs(napi_env env, napi_value arg)
{
    void *ptr = nullptr;
    napi_get_value_external(env, arg, &ptr);
    return reinterpret_cast<OH_ImageSourceNative *>(ptr);
}

Image_String CreateImageStringFromArg(napi_env env, napi_value arg)
{
    Image_String imgStr = {0};
    size_t strLen = 0;
    napi_get_value_string_utf8(env, arg, nullptr, 0, &strLen);
    imgStr.size = strLen;
    if (strLen > MAKER_NOTE_SIZE_MAX) {
        return imgStr;
    }
    imgStr.data = static_cast<char *>(malloc(strLen + 1));
    if (imgStr.data == NULL) {
        imgStr.size = 0;
        return imgStr;
    }
    napi_get_value_string_utf8(env, arg, imgStr.data, strLen + 1, &strLen);
    return imgStr;
}

void SetHwData(Image_String &value)
{
    free(value.data);
    value.size = sizeof(INIT_HW_DATA);
    value.data = static_cast<char *>(malloc(value.size));
    memcpy(value.data, INIT_HW_DATA, value.size);
}

void FreeImageString(Image_String &imgStr)
{
    if (imgStr.data != nullptr) {
        free(imgStr.data);
        imgStr.data = nullptr;
    }
}

int32_t* ParseIntArrayFromArg(napi_env env, napi_value arg, uint32_t* arrayLength)
{
    bool isArray = false;
    if (napi_is_array(env, arg, &isArray) != napi_ok || !isArray ||
        napi_get_array_length(env, arg, arrayLength) != napi_ok) {
        return nullptr;
    }
    
    int32_t *valueArray = static_cast<int32_t *>(malloc(*arrayLength * sizeof(int32_t)));
    if (valueArray == nullptr) {
        return nullptr;
    }
    
    for (uint32_t i = 0; i < *arrayLength; i++) {
        napi_value element;
        if (napi_get_element(env, arg, i, &element) != napi_ok ||
            napi_get_value_int32(env, element, &valueArray[i]) != napi_ok) {
            free(valueArray);
            return nullptr;
        }
    }
    return valueArray;
}

double* ParseDoubleArrayFromArg(napi_env env, napi_value arg, uint32_t* arrayLength)
{
    bool isArray = false;
    if (napi_is_array(env, arg, &isArray) != napi_ok || !isArray ||
        napi_get_array_length(env, arg, arrayLength) != napi_ok) {
        return nullptr;
    }
    
    double *valueArray = static_cast<double *>(malloc(*arrayLength * sizeof(double)));
    if (valueArray == nullptr) {
        return nullptr;
    }
    
    for (uint32_t i = 0; i < *arrayLength; i++) {
        napi_value element;
        if (napi_get_element(env, arg, i, &element) != napi_ok ||
            napi_get_value_double(env, element, &valueArray[i]) != napi_ok) {
            free(valueArray);
            return nullptr;
        }
    }
    return valueArray;
}

void* ParseArrayBufferFromArg(napi_env env, napi_value arg, size_t* bufferSize)
{
    bool isArrayBuffer = false;
    if (napi_is_arraybuffer(env, arg, &isArrayBuffer) != napi_ok || !isArrayBuffer) {
        return nullptr;
    }
    
    void *data = nullptr;
    if (napi_get_arraybuffer_info(env, arg, &data, bufferSize) != napi_ok) {
        return nullptr;
    }
    
    if (data == nullptr || *bufferSize == 0) {
        return nullptr;
    }
    
    void *copiedData = malloc(*bufferSize);
    if (copiedData == nullptr) {
        return nullptr;
    }
    
    std::copy(static_cast<const char*>(data), static_cast<const char*>(data) + *bufferSize,
        static_cast<char*>(copiedData));
    return copiedData;
}

napi_value ImageSourceTest::ModifyMakerNoteImageProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("ModifyMakerNoteImageProperty: Invalid input parameters");
        return result;
    }

    OH_ImageSourceNative *imageSource = GetImageSourceFromArgs(env, argValue[NUM_0]);
    if (imageSource == nullptr) {
        LOG("ModifyMakerNoteImageProperty: Failed to get image source");
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    Image_String value = CreateImageStringFromArg(env, argValue[NUM_2]);
    if (std::strcmp(value.data, "HW") == NUM_0) {
        SetHwData(value);
    }

    Image_ErrorCode errCode = OH_ImageSourceNative_ModifyImageProperty(imageSource, &key, &value);
    FreeImageString(key);
    FreeImageString(value);
    if (errCode != IMAGE_SUCCESS) {
        LOG("ModifyMakerNoteImageProperty failed: err = %{public}d.", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_create_int32(env, errCode, &result);
    LOG("ModifyMakerNoteImageProperty: ModifyImageProperty successfully");
    return result;
}

napi_value ImageSourceTest::GetMakerNoteImageProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("GetMakerNoteImageProperty: Invalid input parameters");
        return result;
    }

    OH_ImageSourceNative *imageSource = GetImageSourceFromArgs(env, argValue[NUM_0]);
    if (imageSource == nullptr) {
        LOG("ModifyMakerNoteImageProperty: Failed to get image source");
        return result;
    }
    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    Image_String value;

    Image_ErrorCode errCode = OH_ImageSourceNative_GetImageProperty(imageSource, &key, &value);
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_GetImageProperty failed: err = %{public}d.", errCode);
        FreeImageString(key);
        FreeImageString(value);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    napi_create_string_utf8(env, value.data, value.size, &result);
    FreeImageString(key);
    FreeImageString(value);
    LOG("GetMakerNoteImageProperty: GetImageProperty successfully");
    return result;
}

napi_value ImageSourceTest::testPackPixelMapToFile(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("testPackPixelMapToFile: Invalid input parameters");
        return result;
    }

    OH_ImagePackerNative *packer = nullptr;
    if (OH_ImagePackerNative_Create(&packer) != IMAGE_SUCCESS) {
        LOG("testPackPixelMapToFile create image packer failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PixelmapNative *pixMap = reinterpret_cast<OH_PixelmapNative *>(ptr);
    ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PackingOptions *opts = reinterpret_cast<OH_PackingOptions *>(ptr);
    int writeFd;
    napi_get_value_int32(env, argValue[NUM_2], &writeFd);

    Image_ErrorCode errCode = OH_ImagePackerNative_PackToFileFromPixelmap(packer, opts, pixMap, writeFd);
    if (errCode != IMAGE_SUCCESS) {
        LOG("testPackPixelMapToFile Failed: err = %{public}d.", errCode);
        OH_ImagePackerNative_Release(packer);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    OH_ImagePackerNative_Release(packer);
    napi_create_int32(env, errCode, &result);
    return result;
}

napi_value ImageSourceTest::SetMimeTypeToTestPackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("SetMimeTypeToTestPackingOptions get MimeType failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    char format[MAX_STRING_SIZE] = {NUM_0};
    size_t formatSize = NUM_0;
    napi_get_value_string_utf8(env, argValue[NUM_1], format, MAX_STRING_SIZE, &formatSize);
    Image_MimeType mimeType = {.data = format, .size = formatSize};

    if (OH_PackingOptions_SetMimeType(packingOptions, &mimeType) != IMAGE_SUCCESS) {
        LOG("OH_PackingOptions_SetMimeType failed");
        return result;
    }
    return result;
}

napi_value ImageSourceTest::SetQualityToTestPackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("SetQualityToTestPackingOptions get Quality failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    int32_t quality = NUM_0;
    napi_get_value_int32(env, argValue[NUM_1], &quality);

    if (OH_PackingOptions_SetQuality(packingOptions, quality) != IMAGE_SUCCESS) {
        LOG("OH_PackingOptions_SetQuality failed");
        return result;
    }
    return result;
}

napi_value ImageSourceTest::SetNeedsPackPropertiesToTestPackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("SetNeedsPackPropertiesToTestPackingOptions get needsPackProperties failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    bool needsPackProperties = true;
    napi_get_value_bool(env, argValue[NUM_1], &needsPackProperties);

    if (OH_PackingOptions_SetNeedsPackProperties(packingOptions, needsPackProperties) != IMAGE_SUCCESS) {
        LOG("OH_PackingOptions_SetNeedsPackProperties failed");
        return result;
    }
    return result;
}

napi_value ImageSourceTest::CreatePackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    OH_PackingOptions *res = nullptr;
    Image_ErrorCode errorCode = OH_PackingOptions_Create(&res);
    if (errorCode != IMAGE_SUCCESS) {
        napi_create_int32(env, errorCode, &result);
        return result;
    }

    napi_status status = napi_create_external(env, reinterpret_cast<void *>(res), nullptr, nullptr, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create external object");
        return nullptr;
    }
    return result;
}

napi_value ImageSourceTest::TestGetImagePropertyShort(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("GetImagePropertyShort: Invalid input parameters");
        return result;
    }
    
    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    uint16_t value = 0;

    errCode = OH_ImageSourceNative_GetImagePropertyShort(imageSource, &key, &value);
    OH_ImageSourceNative_Release(imageSource);
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_GetImagePropertyShort failed: err = %{public}d.", errCode);
        FreeImageString(key);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    napi_create_uint32(env, static_cast<uint32_t>(value), &result);
    FreeImageString(key);
    return result;
}

napi_value ImageSourceTest::TestGetImagePropertyLong(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("GetImagePropertyLong: Invalid input parameters");
        return result;
    }
    
    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    uint32_t value = 0;

    errCode = OH_ImageSourceNative_GetImagePropertyLong(imageSource, &key, &value);
    OH_ImageSourceNative_Release(imageSource);
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_GetImagePropertyLong failed: err = %{public}d.", errCode);
        FreeImageString(key);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    napi_create_uint32(env, value, &result);
    FreeImageString(key);
    LOG("GetImagePropertyLong: GetImagePropertyLong successfully, value = %{public}u", value);
    return result;
}

napi_value ImageSourceTest::TestGetImagePropertyDouble(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("GetImagePropertyDouble: Invalid input parameters");
        return result;
    }
    
    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    double value = 0.0;

    errCode = OH_ImageSourceNative_GetImagePropertyDouble(imageSource, &key, &value);
    OH_ImageSourceNative_Release(imageSource);
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_GetImagePropertyDouble failed: err = %{public}d.", errCode);
        FreeImageString(key);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    napi_create_double(env, value, &result);
    FreeImageString(key);
    LOG("GetImagePropertyDouble: GetImagePropertyDouble successfully, value = %{public}f", value);
    return result;
}

napi_value ImageSourceTest::TestGetImagePropertyArraySize(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        LOG("GetImagePropertyArraySize: Invalid input parameters");
        return result;
    }
    
    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    size_t size = 0;

    errCode = OH_ImageSourceNative_GetImagePropertyArraySize(imageSource, &key, &size);
    OH_ImageSourceNative_Release(imageSource);
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_GetImagePropertyArraySize failed: err = %{public}d.", errCode);
        FreeImageString(key);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    napi_create_int32(env, size, &result);
    FreeImageString(key);
    LOG("GetImagePropertyArraySize: GetImagePropertyArraySize successfully, size = %{public}zu", size);
    return result;
}

napi_value ImageSourceTest::TestGetImagePropertyString(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("GetImagePropertyString: Invalid input parameters");
        return result;
    }
    
    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    int32_t bufSizeFromJS = 0;
    napi_get_value_int32(env, argValue[NUM_2], &bufSizeFromJS);
    size_t bufSize = static_cast<size_t>(bufSizeFromJS);
    
    char *value = new (std::nothrow) char[bufSize]();
    if (value == nullptr) {
        FreeImageString(key);
        return result;
    }

    errCode = OH_ImageSourceNative_GetImagePropertyString(imageSource, &key, value, bufSize);
    OH_ImageSourceNative_Release(imageSource);
    FreeImageString(key);
    
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_GetImagePropertyString failed: err = %{public}d.", errCode);
        delete[] value;
        napi_create_int32(env, errCode, &result);
        return result;
    }

    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    LOG("GetImagePropertyString successfully, value = %{public}s", value);
    delete[] value;
    return result;
}

napi_value ImageSourceTest::TestGetImagePropertyIntArray(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("GetImagePropertyIntArray: Invalid input parameters");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    int32_t bufSizeFromJS = 0;
    napi_get_value_int32(env, argValue[NUM_2], &bufSizeFromJS);
    size_t bufSize = static_cast<size_t>(bufSizeFromJS);

    int32_t *value = new (std::nothrow) int32_t[bufSize]();
    if (value == nullptr) {
        FreeImageString(key);
        return result;
    }

    errCode = OH_ImageSourceNative_GetImagePropertyIntArray(imageSource, &key, value, bufSize);
    FreeImageString(key);
    OH_ImageSourceNative_Release(imageSource);
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_GetImagePropertyIntArray failed: err = %{public}d.", errCode);
        delete[] value;
        napi_create_int32(env, errCode, &result);
        return result;
    }

    napi_create_array_with_length(env, bufSize, &result);
    for (size_t i = 0; i < bufSize; i++) {
        napi_value element;
        napi_create_int32(env, value[i], &element);
        napi_set_element(env, result, i, element);
    }
    LOG("GetImagePropertyIntArray successfully, size = %{public}zu", bufSize);
    delete[] value;
    return result;
}

napi_value ImageSourceTest::TestGetImagePropertyDoubleArray(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("GetImagePropertyDoubleArray: Invalid input parameters");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    int32_t bufSizeFromJS = 0;
    napi_get_value_int32(env, argValue[NUM_2], &bufSizeFromJS);
    size_t bufSize = static_cast<size_t>(bufSizeFromJS);

    double *value = new (std::nothrow) double[bufSize]();
    if (value == nullptr) {
        FreeImageString(key);
        return result;
    }

    errCode = OH_ImageSourceNative_GetImagePropertyDoubleArray(imageSource, &key, value, bufSize);
    FreeImageString(key);
    OH_ImageSourceNative_Release(imageSource);
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_GetImagePropertyDoubleArray failed: err = %{public}d.", errCode);
        delete[] value;
        napi_create_int32(env, errCode, &result);
        return result;
    }

    napi_create_array_with_length(env, bufSize, &result);
    for (size_t i = 0; i < bufSize; i++) {
        napi_value element;
        napi_create_double(env, value[i], &element);
        napi_set_element(env, result, i, element);
    }
    LOG("GetImagePropertyDoubleArray successfully, size = %{public}zu", bufSize);
    delete[] value;
    return result;
}

napi_value ImageSourceTest::TestGetImagePropertyBlob(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("GetImagePropertyBlob: Invalid input parameters");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    int32_t bufSizeFromJS = 0;
    napi_get_value_int32(env, argValue[NUM_2], &bufSizeFromJS);
    size_t bufSize = static_cast<size_t>(bufSizeFromJS);
    
    char *value = new (std::nothrow) char[bufSize]();
    if (value == nullptr) {
        FreeImageString(key);
        return result;
    }

    errCode = OH_ImageSourceNative_GetImagePropertyBlob(imageSource, &key, value, bufSize);
    FreeImageString(key);
    OH_ImageSourceNative_Release(imageSource);
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_GetImagePropertyBlob failed: err = %{public}d.", errCode);
        delete[] value;
        napi_create_int32(env, errCode, &result);
        return result;
    }

    void *arrayBufferData = nullptr;
    napi_create_arraybuffer(env, bufSize, &arrayBufferData, &result);
    if (arrayBufferData != nullptr && value != nullptr) {
        std::copy(value, value + bufSize, static_cast<char*>(arrayBufferData));
    }
    LOG("GetImagePropertyBlob successfully, size = %{public}zu", bufSize);
    delete[] value;
    return result;
}

napi_value ImageSourceTest::TestGetImagePropertyError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOG("TestGetImagePropertyError: Invalid input parameters");
        return result;
    }

    std::string type = getStringFromArgs(env, argValue[NUM_0]);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = IMAGE_SUCCESS;
    Image_String key = {.data = const_cast<char *>("test"), .size = 4};
    size_t bufSize = 10;

    if (type == "short") {
        uint16_t value = 0;
        errCode = OH_ImageSourceNative_GetImagePropertyShort(imageSource, &key, &value);
    } else if (type == "long") {
        uint32_t value = 0;
        errCode = OH_ImageSourceNative_GetImagePropertyLong(imageSource, &key, &value);
    } else if (type == "double") {
        double value = 0.0;
        errCode = OH_ImageSourceNative_GetImagePropertyDouble(imageSource, &key, &value);
    } else if (type == "arraySize") {
        errCode = OH_ImageSourceNative_GetImagePropertyArraySize(imageSource, &key, &bufSize);
    } else if (type == "string") {
        char value[128] = {0};
        errCode = OH_ImageSourceNative_GetImagePropertyString(imageSource, &key, value, bufSize);
    } else if (type == "intArray") {
        int32_t value[10] = {0};
        errCode = OH_ImageSourceNative_GetImagePropertyIntArray(imageSource, &key, value, bufSize);
    } else if (type == "doubleArray") {
        double value[10] = {0};
        errCode = OH_ImageSourceNative_GetImagePropertyDoubleArray(imageSource, &key, value, bufSize);
    } else if (type == "arrayBuffer") {
        char value[128] = {0};
        LOG("TestGetImagePropertyError: imageSource: %{public}d", imageSource);
        errCode = OH_ImageSourceNative_GetImagePropertyBlob(imageSource, &key, value, bufSize);
    }

    LOG("TestGetImagePropertyError: %{public}s returned error code: %{public}d", type.c_str(), errCode);
    napi_create_int32(env, errCode, &result);
    return result;
}

napi_value ImageSourceTest::TestModifyImagePropertyShort(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("ModifyImagePropertyShort: Invalid input parameters");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    
    uint32_t valueFromJS = 0;
    if (napi_get_value_uint32(env, argValue[NUM_2], &valueFromJS) != napi_ok) {
        LOG("ModifyImagePropertyShort: Failed to get value parameter");
        FreeImageString(key);
        return result;
    }
    uint16_t value = static_cast<uint16_t>(valueFromJS);
    LOG("ModifyImagePropertyShort: Successfully modified property, value = %{public}u", value);

    errCode = OH_ImageSourceNative_ModifyImagePropertyShort(imageSource, &key, value);

    OH_ImageSourceNative_Release(imageSource);
    FreeImageString(key);
    napi_create_int32(env, errCode, &result);
    
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_ModifyImagePropertyShort failed: err = %{public}d.", errCode);
    }
    return result;
}

napi_value ImageSourceTest::TestModifyImagePropertyLong(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("ModifyImagePropertyLong: Invalid input parameters");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    
    uint32_t value = 0;
    if (napi_get_value_uint32(env, argValue[NUM_2], &value) != napi_ok) {
        LOG("ModifyImagePropertyLong: Failed to get value parameter");
        FreeImageString(key);
        return result;
    }
    errCode = OH_ImageSourceNative_ModifyImagePropertyLong(imageSource, &key, value);

    OH_ImageSourceNative_Release(imageSource);
    FreeImageString(key);
    napi_create_int32(env, errCode, &result);
    
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_ModifyImagePropertyLong failed: err = %{public}d.", errCode);
    }
    return result;
}

napi_value ImageSourceTest::TestModifyImagePropertyDouble(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("ModifyImagePropertyDouble: Invalid input parameters");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    
    double value = 0.0;
    if (napi_get_value_double(env, argValue[NUM_2], &value) != napi_ok) {
        LOG("ModifyImagePropertyDouble: Failed to get value parameter");
        FreeImageString(key);
        return result;
    }

    errCode = OH_ImageSourceNative_ModifyImagePropertyDouble(imageSource, &key, value);

    OH_ImageSourceNative_Release(imageSource);
    FreeImageString(key);
    napi_create_int32(env, errCode, &result);
    
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_ModifyImagePropertyDouble failed: err = %{public}d.", errCode);
    }
    return result;
}

napi_value ImageSourceTest::TestModifyImagePropertyIntArray(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("ModifyImagePropertyIntArray: Invalid input parameters");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    
    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    uint32_t arrayLength = 0;
    int32_t *valueArray = ParseIntArrayFromArg(env, argValue[NUM_2], &arrayLength);
    
    if (valueArray == nullptr) {
        LOG("ModifyImagePropertyIntArray: Failed to parse array parameter");
        FreeImageString(key);
        return result;
    }

    errCode = OH_ImageSourceNative_ModifyImagePropertyIntArray(imageSource, &key, valueArray, arrayLength);
    
    OH_ImageSourceNative_Release(imageSource);
    free(valueArray);
    FreeImageString(key);
    napi_create_int32(env, errCode, &result);
    
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_ModifyImagePropertyIntArray failed: err = %{public}d.", errCode);
    }
    return result;
}

napi_value ImageSourceTest::TestModifyImagePropertyDoubleArray(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("ModifyImagePropertyDoubleArray: Invalid input parameters");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    
    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    uint32_t arrayLength = 0;
    double *valueArray = ParseDoubleArrayFromArg(env, argValue[NUM_2], &arrayLength);
    
    if (valueArray == nullptr) {
        LOG("ModifyImagePropertyDoubleArray: Failed to parse array parameter");
        FreeImageString(key);
        return result;
    }

    errCode = OH_ImageSourceNative_ModifyImagePropertyDoubleArray(imageSource, &key, valueArray, arrayLength);
    
    OH_ImageSourceNative_Release(imageSource);
    free(valueArray);
    FreeImageString(key);
    napi_create_int32(env, errCode, &result);
    
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_ModifyImagePropertyDoubleArray failed: err = %{public}d.", errCode);
    }
    return result;
}

napi_value ImageSourceTest::TestModifyImagePropertyBlob(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        LOG("ModifyImagePropertyBlob: Invalid input parameters");
        return result;
    }

    int32_t fd = 0;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOG("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    
    Image_String key = CreateImageStringFromArg(env, argValue[NUM_1]);
    size_t bufferSize = 0;
    void *bufferData = ParseArrayBufferFromArg(env, argValue[NUM_2], &bufferSize);

    errCode = OH_ImageSourceNative_ModifyImagePropertyBlob(imageSource, &key, bufferData, bufferSize);
    
    OH_ImageSourceNative_Release(imageSource);
    free(bufferData);
    FreeImageString(key);
    napi_create_int32(env, errCode, &result);
    
    if (errCode != IMAGE_SUCCESS) {
        LOG("OH_ImageSourceNative_ModifyImagePropertyBlob failed: err = %{public}d.", errCode);
    }
    return result;
}

napi_value ImageSourceTest::TestModifyImagePropertyError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        LOG("TestModifyImagePropertyError: Invalid input parameters");
        return result;
    }

    std::string type = getStringFromArgs(env, argValue[NUM_0]);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = IMAGE_SUCCESS;
    Image_String key = {.data = const_cast<char *>("test"), .size = 4};

    int32_t intArray[] = {1, 2, 3};
    double doubleArray[] = {1.0, 2.0, 3.0};
    char bufferData[] = {0x01, 0x02, 0x03};
    uint32_t imagePropertyValue = 100;
    double imageDoubleValue = 100.0;
    size_t size = 3;

    if (type == "short") {
        errCode = OH_ImageSourceNative_ModifyImagePropertyShort(imageSource, &key, imagePropertyValue);
    } else if (type == "long") {
        errCode = OH_ImageSourceNative_ModifyImagePropertyLong(imageSource, &key, imagePropertyValue);
    } else if (type == "double") {
        errCode = OH_ImageSourceNative_ModifyImagePropertyDouble(imageSource, &key, imageDoubleValue);
    } else if (type == "intArray") {
        errCode = OH_ImageSourceNative_ModifyImagePropertyIntArray(imageSource, &key, intArray, size);
    } else if (type == "doubleArray") {
        errCode = OH_ImageSourceNative_ModifyImagePropertyDoubleArray(imageSource, &key, doubleArray, size);
    } else if (type == "arrayBuffer") {
        errCode = OH_ImageSourceNative_ModifyImagePropertyBlob(imageSource, &key, bufferData, size);
    }

    LOG("TestModifyImagePropertyError: %{public}s returned error code: %{public}d", type.c_str(), errCode);
    napi_create_int32(env, errCode, &result);
    return result;
}

} // namespace Media
} // namespace OHOS