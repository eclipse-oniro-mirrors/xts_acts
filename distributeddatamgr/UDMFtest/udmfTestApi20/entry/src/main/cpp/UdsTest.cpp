/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "UdsTest.h"
#include "napi/native_api.h"
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_err_code.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

# define MAX_GENERAL_ENTRY_SIZE (100 * 1024 * 1024)

int g_invalidParamCode1 = 20400001;

void AddUdsTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testSetPixelMapInvalidParam", nullptr, TestSetPixelMapInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testArrBufferDestroyInvalidParam", nullptr, TestArrBufferDestroyInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testGetDataInvalidParam", nullptr, TestGetDataInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
}

napi_value TestSetPixelMapInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdsPixelMap *pixelMap = nullptr;
    uint8_t data [500];
    int dataSize = 500;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    int width = 6;
    OH_PixelmapInitializationOptions_SetWidth(createOpts, width);
    int height = 4;
    OH_PixelmapInitializationOptions_SetHeight(createOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative *pixelmapNative;
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmapNative);

    int ret = OH_UdsPixelMap_SetPixelMap(pixelMap, pixelmapNative);
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_INVALID_PARAM ? g_invalidParamCode1 : 1, &result);
    
    return result;
}

napi_value TestArrBufferDestroyInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdsArrayBuffer* buffer = nullptr;
    int ret = OH_UdsArrayBuffer_Destroy(buffer);
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_INVALID_PARAM ? g_invalidParamCode1 : 1, &result);
    return result;
}

napi_value TestGetDataInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UdsArrayBuffer* buffer = OH_UdsArrayBuffer_Create();
    unsigned char data[] = "hello world";
    unsigned int len = sizeof(data);
    
    OH_UdsArrayBuffer_SetData(buffer, data, len);
    
    buffer = nullptr;
    
    unsigned char *getData;
    unsigned int getLen;
    int ret = OH_UdsArrayBuffer_GetData(buffer, &getData, &getLen);
    
    napi_create_int32(env, ret == Udmf_ErrCode::UDMF_E_INVALID_PARAM ? g_invalidParamCode1 : 1, &result);
    
    OH_UdsArrayBuffer_Destroy(buffer);
    return result;
}