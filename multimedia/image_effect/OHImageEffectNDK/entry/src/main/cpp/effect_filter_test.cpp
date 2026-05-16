/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include "effect_filter_test.h"

#include <cstdlib>
#include <cstring>
#include <multimedia/image_effect/image_effect_filter.h>

#include "utils/common_utils.h"
#include "utils/pixelmap_helper.h"
#include "gl_utils.h"

#define KEY_FILTER_INTENSITY "FilterIntensity"
#define CUSTOM_FILTER "CustomCrop"

#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define CASE_INDEX_7 7
#define CASE_INDEX_8 8
#define CASE_INDEX_9 9
#define CASE_INDEX_10 10
#define CASE_INDEX_11 11

#define IMAGE_EFFECT_100 100
#define IMAGE_EFFECT_100F 100.f
#define IMAGE_EFFECT_1000 1000
#define IMAGE_EFFECT_1024 1024
#define IMAGE_EFFECT_1048576 1048576
#define IMAGE_EFFECT_1073741824 1073741824
#define IMAGE_EFFECT_1080 1080
#define IMAGE_EFFECT_4090 4090
#define IMAGE_EFFECT_5120 5120
#define IMAGE_EFFECT_CODE_401 401
#define IMAGE_EFFECT_1722514390000 1722514390000

/**-----------------------------------------   EffectBufferInfo   --------------------------------------------------**/
napi_value OHEffectBufferInfoCreate(napi_env env, napi_callback_info info)
{
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_value ret;
    int status = -1;
    if (bufferInfo != nullptr) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value OHEffectBufferInfoSetAddr(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    void *addr = malloc(IMAGE_EFFECT_1000);
    switch (index) {
    case CASE_INDEX_1:
        break;
    case CASE_INDEX_2:
        bufferInfo = nullptr;
        break;
    case CASE_INDEX_3:
        addr = nullptr;
        break;
    case CASE_INDEX_4:
        addr = nullptr;
        bufferInfo = nullptr;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_SetAddr(bufferInfo, addr);
    free(addr);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoGetAddr(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    napi_value ret;
    napi_create_int32(env, code, &ret);
    
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    void *setAddr = malloc(IMAGE_EFFECT_1000);
    void *retAddr = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        OH_EffectBufferInfo_SetAddr(bufferInfo, setAddr);
        code = OH_EffectBufferInfo_GetAddr(bufferInfo, &retAddr);
        if (retAddr != setAddr) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        code = OH_EffectBufferInfo_GetAddr(bufferInfo, &retAddr);
        break;
    case CASE_INDEX_3:
        bufferInfo = nullptr;
        code = OH_EffectBufferInfo_GetAddr(bufferInfo, &retAddr);
        break;
    default:
        break;
    }
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoSetEffectFormat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_Format format;
    switch (index) {
    case CASE_INDEX_1:
        format = EFFECT_PIXEL_FORMAT_UNKNOWN;
        break;
    case CASE_INDEX_2:
        format = EFFECT_PIXEL_FORMAT_RGBA8888;
        break;
    case CASE_INDEX_3:
        format = EFFECT_PIXEL_FORMAT_NV21;
        break;
    case CASE_INDEX_4:
        format = EFFECT_PIXEL_FORMAT_NV12;
        break;
    case CASE_INDEX_5:
        format = EFFECT_PIXEL_FORMAT_RGBA1010102;
        break;
    case CASE_INDEX_6:
        format = EFFECT_PIXEL_FORMAT_YCBCR_P010;
        break;
    case CASE_INDEX_7:
        format = EFFECT_PIXEL_FORMAT_YCRCB_P010;
        break;
    case CASE_INDEX_8:
        bufferInfo = nullptr;
        format = EFFECT_PIXEL_FORMAT_RGBA8888;
        break;
    default:
        break;
    }

    ImageEffect_ErrorCode code = OH_EffectBufferInfo_SetEffectFormat(bufferInfo, format);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoGetEffectFormat(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_Format setFormat;
    ImageEffect_Format getFormat;
    ImageEffect_ErrorCode code;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setFormat = EFFECT_PIXEL_FORMAT_UNKNOWN;
        code = OH_EffectBufferInfo_SetEffectFormat(bufferInfo, setFormat);
        code = OH_EffectBufferInfo_GetEffectFormat(bufferInfo, &getFormat);
        if (getFormat != setFormat) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setFormat = EFFECT_PIXEL_FORMAT_RGBA8888;
        code = OH_EffectBufferInfo_GetEffectFormat(bufferInfo, &getFormat);
        break;
    case CASE_INDEX_3:
        code = OH_EffectBufferInfo_GetEffectFormat(bufferInfo, &getFormat);
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        setFormat = EFFECT_PIXEL_FORMAT_RGBA8888;
        code = OH_EffectBufferInfo_GetEffectFormat(bufferInfo, &getFormat);
        break;
    case CASE_INDEX_5:
        bufferInfo = nullptr;
        code = OH_EffectBufferInfo_GetEffectFormat(bufferInfo, &getFormat);
        break;
    default:
        break;
    }

    OH_EffectBufferInfo_Release(bufferInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoSetHeight(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    int32_t height;
    switch (index) {
    case CASE_INDEX_1:
        height = 0;
        break;
    case CASE_INDEX_2:
        height = IMAGE_EFFECT_1000;
        break;
    case CASE_INDEX_3:
        height = -IMAGE_EFFECT_1000;
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        height = IMAGE_EFFECT_1000;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_SetHeight(bufferInfo, height);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoGetHeight(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setHeight;
    int32_t getHeight;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setHeight = 0;
        code = OH_EffectBufferInfo_SetHeight(bufferInfo, setHeight);
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        if (getHeight != setHeight) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setHeight = IMAGE_EFFECT_1000;
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        break;
    case CASE_INDEX_3:
        setHeight = -IMAGE_EFFECT_1000;
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        setHeight = IMAGE_EFFECT_1000;
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        break;
    default:
        break;
    }
    
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoSetRowSize(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t rowSize;
    switch (index) {
    case CASE_INDEX_1:
        rowSize = IMAGE_EFFECT_1024;
        break;
    case CASE_INDEX_2:
        rowSize = IMAGE_EFFECT_1048576;
        break;
    case CASE_INDEX_3:
        rowSize = IMAGE_EFFECT_1073741824;
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        rowSize = IMAGE_EFFECT_1024;
        break;
    default:
        break;
    }
    code = OH_EffectBufferInfo_SetRowSize(bufferInfo, rowSize);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoGetRowSize(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setRowSize;
    int32_t getRowSize;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setRowSize = IMAGE_EFFECT_1024;
        code = OH_EffectBufferInfo_SetRowSize(bufferInfo, setRowSize);
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        if (getRowSize != setRowSize) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setRowSize = IMAGE_EFFECT_1048576;
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        break;
    case CASE_INDEX_3:
        setRowSize = IMAGE_EFFECT_1073741824;
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        setRowSize = IMAGE_EFFECT_1024;
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        break;
    default:
        break;
    }
    
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoSetWidth(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t width;
    switch (index) {
    case CASE_INDEX_1:
        width = IMAGE_EFFECT_1080;
        break;
    case CASE_INDEX_2:
        width = IMAGE_EFFECT_4090;
        break;
    case CASE_INDEX_3:
        width = -IMAGE_EFFECT_5120;
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        width = IMAGE_EFFECT_1024;
        break;
    default:
        break;
    }

    code = OH_EffectBufferInfo_SetWidth(bufferInfo, width);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoGetWidth(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setWidth;
    int32_t getWidth;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setWidth = IMAGE_EFFECT_1080;
        code = OH_EffectBufferInfo_SetWidth(bufferInfo, setWidth);
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        if (getWidth != setWidth) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setWidth = IMAGE_EFFECT_4090;
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        break;
    case CASE_INDEX_3:
        setWidth = -IMAGE_EFFECT_5120;
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        setWidth = IMAGE_EFFECT_1024;
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        break;
    default:
        break;
    }
    
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoSetTimestamp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int64_t timestamp = 0;
    switch (index) {
    case CASE_INDEX_1:
        timestamp = IMAGE_EFFECT_1722514390000;
        break;
    case CASE_INDEX_2:
        timestamp = -IMAGE_EFFECT_1722514390000;
        break;
    case CASE_INDEX_3:
        bufferInfo = nullptr;
        timestamp = IMAGE_EFFECT_1722514390000;
        break;
    default:
        break;
    }

    code = OH_EffectBufferInfo_SetTimestamp(bufferInfo, timestamp);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoGetTimestamp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int64_t setTimestamp;
    int64_t getTimestamp;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setTimestamp = IMAGE_EFFECT_1722514390000;
        code = OH_EffectBufferInfo_SetTimestamp(bufferInfo, setTimestamp);
        code = OH_EffectBufferInfo_GetTimestamp(bufferInfo, &getTimestamp);
        if (getTimestamp != setTimestamp) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setTimestamp = -IMAGE_EFFECT_1722514390000;
        code = OH_EffectBufferInfo_GetTimestamp(bufferInfo, &getTimestamp);
        break;
    case CASE_INDEX_3:
        bufferInfo = nullptr;
        setTimestamp = IMAGE_EFFECT_1722514390000;
        code = OH_EffectBufferInfo_GetTimestamp(bufferInfo, &getTimestamp);
        break;
    default:
        break;
    }

    OH_EffectBufferInfo_Release(bufferInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoSetTextureId(napi_env env, napi_callback_info info)
{
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_SetTextureId(bufferInfo, 1);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoGetTextureId(napi_env env, napi_callback_info info)
{
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    int32_t dstTex;
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_SetTextureId(bufferInfo, 1);
    code = OH_EffectBufferInfo_GetTextureId(bufferInfo, &dstTex);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        bufferInfo = OH_EffectBufferInfo_Create();
        break;
    case CASE_INDEX_2:
        bufferInfo = nullptr;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

/**-------------------------------------------- EffectFilterInfo ---------------------------------------------------**/
napi_value OHEffectFilterInfoCreate(napi_env env, napi_callback_info info)
{
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    OH_EffectFilterInfo_Release(filterInfo);
    napi_value ret;
    int status = -1;
    if (filterInfo != nullptr) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value OHEffectFilterInfoSetFilterName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilterInfo_SetFilterName(filterInfo, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilterInfo_SetFilterName(nullptr, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilterInfo_SetFilterName(filterInfo, nullptr);
        break;
    default:
        break;
    }
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoGetFilterName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    char *getName = nullptr;
    ImageEffect_ErrorCode code;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilterInfo_SetFilterName(filterInfo, OH_EFFECT_BRIGHTNESS_FILTER);
        code = OH_EffectFilterInfo_GetFilterName(filterInfo, &getName);
        //判断  getName != OH_EFFECT_BRIGHTNESS_FILTER
        if (strcmp(getName, OH_EFFECT_BRIGHTNESS_FILTER) != 0) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilterInfo_GetFilterName(filterInfo, nullptr);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilterInfo_GetFilterName(nullptr, &getName);
        break;
    default:
        break;
    }
    OH_EffectFilterInfo_Release(filterInfo);
    
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoSetSupportedBufferTypes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_BufferType bufferTypes[2] = {};
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        break;
    case CASE_INDEX_2:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        bufferTypes[1] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_TEXTURE;
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        break;
    default:
        break;
    }
    uint32_t size = sizeof(bufferTypes) / sizeof(ImageEffect_BufferType);
    code = OH_EffectFilterInfo_SetSupportedBufferTypes(filterInfo, size, bufferTypes);
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoGetSupportedBufferTypes(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_BufferType bufferTypes[2] = {};
    uint32_t size = sizeof(bufferTypes) / sizeof(ImageEffect_BufferType);
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_ErrorCode code;
    
    napi_value ret;
    ImageEffect_BufferType *bufferTypeArray = nullptr;
    uint32_t getSize;
    switch (index) {
    case CASE_INDEX_1:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        code = OH_EffectFilterInfo_SetSupportedBufferTypes(filterInfo, size, bufferTypes);
        code = OH_EffectFilterInfo_GetSupportedBufferTypes(filterInfo, &getSize, &bufferTypeArray);
        if (getSize != size) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        bufferTypes[1] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_TEXTURE;
        code = OH_EffectFilterInfo_GetSupportedBufferTypes(filterInfo, &getSize, &bufferTypeArray);
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        code = OH_EffectFilterInfo_GetSupportedBufferTypes(filterInfo, &getSize, &bufferTypeArray);
        break;
    default:
        break;
    }
    
    OH_EffectFilterInfo_Release(filterInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoSetSupportedFormats(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_Format formats[2] = {};
    switch (index) {
    case CASE_INDEX_1:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        break;
    case CASE_INDEX_2:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        formats[1] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV12;
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        break;
    default:
        break;
    }
    uint32_t size = sizeof(formats) / sizeof(ImageEffect_Format);
    ImageEffect_ErrorCode code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, size, formats);
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

ImageEffect_ErrorCode GetSupportedFormats(int32_t index, OH_EffectFilterInfo *filterInfo)
{
    ImageEffect_Format formats[2] = {};
    uint32_t setSize = sizeof(formats) / sizeof(ImageEffect_Format);
    uint32_t getSize;
    ImageEffect_Format *formatArray = nullptr;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_4:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV21;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    case CASE_INDEX_5:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV12;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    case CASE_INDEX_6:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA1010102;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    default:
        break;
    }
    return code;
}

napi_value OHEffectFilterInfoGetSupportedFormats(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_Format formats[2] = {};
    uint32_t setSize = sizeof(formats) / sizeof(ImageEffect_Format);
    ImageEffect_ErrorCode code;
    
    napi_value ret;
    uint32_t getSize;
    ImageEffect_Format *formatArray = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        if (getSize != setSize) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        formats[1] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV12;
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    case CASE_INDEX_4:
    case CASE_INDEX_5:
    case CASE_INDEX_6:
        code = GetSupportedFormats(index, filterInfo);
        break;
    default:
        break;
    }
    OH_EffectFilterInfo_Release(filterInfo);
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = nullptr;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        filterInfo = OH_EffectFilterInfo_Create();
        break;
    case CASE_INDEX_2:
        filterInfo = nullptr;
        break;
    default:
        break;
    }
    code = OH_EffectFilterInfo_Release(filterInfo);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

/**---------------------------------------------- EffectFilter -----------------------------------------------------**/
napi_value OHEffectFilterCreate(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *filter = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        filter = OH_EffectFilter_Create(nullptr);
        break;
    default:
        break;
    }

    int code = IMAGE_EFFECT_CODE_401;
    if (filter != nullptr) {
        OH_EffectFilter_Release(filter);
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterSetValue(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_ErrorCode code;
    ImageEffect_Any setValue;
    switch (index) {
    case CASE_INDEX_1:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &setValue);
        break;
    case CASE_INDEX_2:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &setValue);
        break;
    case CASE_INDEX_3:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(nullptr, KEY_FILTER_INTENSITY, &setValue);
        break;
    case CASE_INDEX_4:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(filter, nullptr, &setValue);
        break;
    case CASE_INDEX_5:
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, nullptr);
        break;
    default:
        break;
    }
    OH_EffectFilter_Release(filter);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterGetValue(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    OH_EffectFilter *filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_ErrorCode code;
    ImageEffect_Any setValue;
    ImageEffect_Any retValue;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &setValue);
        code = OH_EffectFilter_GetValue(filter, KEY_FILTER_INTENSITY, &retValue);
        if (retValue.dataType != setValue.dataType || retValue.dataValue.floatValue != setValue.dataValue.floatValue) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100;
        OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &setValue);
        code = OH_EffectFilter_GetValue(filter, KEY_FILTER_INTENSITY, &retValue);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilter_GetValue(nullptr, KEY_FILTER_INTENSITY, &retValue);
        break;
    case CASE_INDEX_4:
        code = OH_EffectFilter_GetValue(filter, nullptr, &retValue);
        break;
    case CASE_INDEX_5:
        code = OH_EffectFilter_GetValue(filter, KEY_FILTER_INTENSITY, nullptr);
        break;
    default:
        break;
    }
    OH_EffectFilter_Release(filter);

    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterLookupFilterInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilter_LookupFilterInfo(OH_EFFECT_BRIGHTNESS_FILTER, filterInfo);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilter_LookupFilterInfo(OH_EFFECT_BRIGHTNESS_FILTER, nullptr);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilter_LookupFilterInfo(nullptr, filterInfo);
        break;
    default:
        break;
    }
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterLookupFilters(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_FilterNames *filterNames = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filterNames = OH_EffectFilter_LookupFilters("Format:default");
        break;
    case CASE_INDEX_2:
        filterNames = OH_EffectFilter_LookupFilters("Format:rgba_8888");
        break;
    case CASE_INDEX_3:
        filterNames = OH_EffectFilter_LookupFilters("Format:nv21");
        break;
    case CASE_INDEX_4:
        filterNames = OH_EffectFilter_LookupFilters("Format:nv12");
        break;
    case CASE_INDEX_5:
        filterNames = OH_EffectFilter_LookupFilters("test:default");
        break;
    default:
        break;
    }

    int code = -1;
    if (filterNames != nullptr) {
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterRegister(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_FilterDelegate delegate = {
        .setValue = [](OH_EffectFilter *filter, const char *key, const ImageEffect_Any *value) { return false; },
        .render =
            [](OH_EffectFilter *filter, OH_EffectBufferInfo *src, OH_EffectFilterDelegate_PushData pushData) {
                pushData(filter, src);
                return true;
            },
        .save = [](OH_EffectFilter *filter, char **info) { return true; },
        .restore = [](const char *info) { return OH_EffectFilter_Create("CustomBrightnessEFilter"); }};
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilter_Register(filterInfo, &delegate);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilter_Register(nullptr, &delegate);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilter_Register(filterInfo, nullptr);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterRelease(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    OH_EffectFilter *filter = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        code = OH_EffectFilter_Release(filter);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilter_Release(nullptr);
        break;
    default:
        break;
    }

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterReleaseFilterNames(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    switch (index) {
    case CASE_INDEX_1:
        OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        OH_EffectFilter_ReleaseFilterNames();
        break;
    case CASE_INDEX_2:
        OH_EffectFilter_ReleaseFilterNames();
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}
