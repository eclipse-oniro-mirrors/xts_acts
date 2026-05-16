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
#include "napi/native_api.h"
#include <cstdint>
#include <hilog/log.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <native_buffer/native_buffer.h>
#include "ace/xcomponent/native_interface_xcomponent.h"
#include "NativeBufferTest.h"
#include "nativewindow.h"
#define SUCCESS 0
void addNativeBufferTest1(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"testNativeBufferEBUFULL", nullptr, testNativeBufferEBUFULL,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferSMPTECFULL", nullptr, testNativeBufferSMPTECFULL,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferEBULIMIT", nullptr, testNativeBufferEBULIMIT,
             nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferSMPTECLIMIT", nullptr, testNativeBufferSMPTECLIMIT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferADOBERGBFULL", nullptr, testNativeBufferADOBERGBFULL,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeLINEARSRGB", nullptr, testNativeLINEARSRGB,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferLINEARBT709", nullptr, testNativeBufferLINEARBT709,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeLINEARP3", nullptr, testNativeLINEARP3,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferLINEARBT2020", nullptr, testNativeBufferLINEARBT2020,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferDISPLAYSRGB", nullptr, testNativeBufferDISPLAYSRGB,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferDISPLAYP3SRGB", nullptr, testNativeBufferDISPLAYP3SRGB,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"smpte2086", nullptr, smpte2086,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"cta861", nullptr, cta861,
            nullptr, nullptr, nullptr, napi_default, nullptr});
}
void addNativeBufferTest(std::vector<napi_property_descriptor>& descData)
{
    addNativeBufferTest1(descData);
    descData.push_back({"testNativeBufferDISPLAYP3HLG", nullptr, testNativeBufferDISPLAYP3HLG,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferDISPLAYP3PQ", nullptr, testNativeBufferDISPLAYP3PQ,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferDISPLAYBT2020SRGB", nullptr, testNativeBufferDISPLAYBT2020SRGB,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferDISPLAYBT2020HLG", nullptr, testNativeBufferDISPLAYBT2020HLG,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeBufferDISPLAYBT2020PQ", nullptr, testNativeBufferDISPLAYBT2020PQ,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ColorX", nullptr, ColorX, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ColorY", nullptr, ColorY, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"Smpte2086Red", nullptr, Smpte2086Red, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"Smpte2086Green", nullptr, Smpte2086Green, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"Smpte2086Blue", nullptr, Smpte2086Blue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"Smpte2086WhitePoint", nullptr, Smpte2086WhitePoint,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"Smpte2086MaxLum", nullptr, Smpte2086MaxLum,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"Smpte2086MinLum", nullptr, Smpte2086MinLum,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"Cta861MaxContentLightLevel", nullptr, Cta861MaxContentLightLevel,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"Cta861MaxFrameAverageLightLevel", nullptr, Cta861MaxFrameAverageLightLevel,
            nullptr, nullptr, nullptr, napi_default, nullptr});
}
napi_value testNativeBufferEBUFULL(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_BT601_EBU_FULL);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferSMPTECFULL(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_BT601_SMPTE_C_FULL);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferEBULIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_BT601_EBU_LIMIT);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferSMPTECLIMIT(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_BT601_SMPTE_C_LIMIT);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferADOBERGBFULL(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_ADOBERGB_FULL);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeLINEARSRGB(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_LINEAR_SRGB);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferLINEARBT709(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_LINEAR_BT709);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeLINEARP3(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_LINEAR_P3);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferLINEARBT2020(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_LINEAR_BT2020);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferDISPLAYSRGB(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_DISPLAY_SRGB);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferDISPLAYP3SRGB(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_DISPLAY_P3_SRGB);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferDISPLAYP3HLG(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_DISPLAY_P3_HLG);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferDISPLAYP3PQ(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_DISPLAY_P3_PQ);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferDISPLAYBT2020SRGB(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_DISPLAY_BT2020_SRGB);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferDISPLAYBT2020HLG(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_DISPLAY_BT2020_HLG);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeBufferDISPLAYBT2020PQ(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_DISPLAY_BT2020_PQ);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value ColorX(napi_env env, napi_callback_info info)
{
    OH_NativeBuffer_ColorXY *pColor = new OH_NativeBuffer_ColorXY();
    pColor->x = 0.1f;
    pColor->y = 0.9f;
    if (pColor->x == 0.1f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}

napi_value ColorY(napi_env env, napi_callback_info info)
{
    OH_NativeBuffer_ColorXY *pColor = new OH_NativeBuffer_ColorXY();
    pColor->x = 0.1f;
    pColor->y = 0.9f;
    if (pColor->y == 0.9f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}

napi_value Smpte2086Red(napi_env env, napi_callback_info info)
{
    // 构造测试数据
    OH_NativeBuffer_ColorXY red;
    red.x = 0.7f;
    red.y = 0.3f;

    OH_NativeBuffer_Smpte2086 metadata;
    metadata.displayPrimaryRed = red;
    if (metadata.displayPrimaryRed.x == 0.7f && metadata.displayPrimaryRed.y == 0.3f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}

napi_value Smpte2086Green(napi_env env, napi_callback_info info)
{
    OH_NativeBuffer_ColorXY green;
    green.x = 0.2f;
    green.y = 0.8f;
    OH_NativeBuffer_Smpte2086 metadata;
    metadata.displayPrimaryGreen = green;
    if (metadata.displayPrimaryGreen.x == 0.2f && metadata.displayPrimaryGreen.y == 0.8f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}

napi_value Smpte2086Blue(napi_env env, napi_callback_info info)
{
    OH_NativeBuffer_ColorXY blue;
    blue.x = 0.1f;
    blue.y = 0.1f;
    OH_NativeBuffer_Smpte2086 metadata;
    metadata.displayPrimaryBlue = blue;
    if (metadata.displayPrimaryBlue.x == 0.1f && metadata.displayPrimaryBlue.y == 0.1f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}

napi_value Smpte2086WhitePoint(napi_env env, napi_callback_info info)
{
    OH_NativeBuffer_ColorXY whitePoint;
    whitePoint.x = 0.3127f;
    whitePoint.y = 0.3290f;
    OH_NativeBuffer_Smpte2086 metadata;
    metadata.whitePoint = whitePoint;
    if (metadata.whitePoint.x == 0.3127f && metadata.whitePoint.y == 0.3290f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}

napi_value Smpte2086MaxLum(napi_env env, napi_callback_info info)
{
    float maxLum = 1000.0f;
    OH_NativeBuffer_Smpte2086 metadata;
    metadata.maxLuminance = maxLum;
    if (metadata.maxLuminance == 1000.0f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}

napi_value Smpte2086MinLum(napi_env env, napi_callback_info info)
{
    float minLum = 1000.0f;
    OH_NativeBuffer_Smpte2086 metadata;
    metadata.minLuminance = minLum;
    if (metadata.minLuminance == 1000.0f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}

napi_value Cta861MaxContentLightLevel(napi_env env, napi_callback_info info)
{
    float maxContentLight = 1000.0f;
    OH_NativeBuffer_Cta861 metadata;
    metadata.maxContentLightLevel = maxContentLight;
    if (metadata.maxContentLightLevel == 1000.0f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}

napi_value Cta861MaxFrameAverageLightLevel(napi_env env, napi_callback_info info)
{
    float maxFrameAverageLight = 200.0f;
    OH_NativeBuffer_Cta861 metadata;
    metadata.maxFrameAverageLightLevel = maxFrameAverageLight;
    if (metadata.maxFrameAverageLightLevel == 200.0f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}

napi_value smpte2086(napi_env env, napi_callback_info info)
{
    OH_NativeBuffer_StaticMetadata metadata;
    metadata.smpte2086 = {.displayPrimaryRed = {0.7f, 0.3f},
                          .displayPrimaryGreen = {0.2f, 0.8f},
                          .displayPrimaryBlue = {0.1f, 0.1f},
                          .whitePoint = {0.3127f, 0.3290f},
                          .maxLuminance = 1000.0f,
                          .minLuminance = 0.0001f};
    if (metadata.smpte2086.displayPrimaryRed.x == 0.7f && metadata.smpte2086.displayPrimaryRed.y == 0.3f &&
        metadata.smpte2086.displayPrimaryGreen.x == 0.2f && metadata.smpte2086.displayPrimaryGreen.y == 0.8f &&
        metadata.smpte2086.displayPrimaryBlue.x == 0.1f && metadata.smpte2086.displayPrimaryBlue.y == 0.1f &&
        metadata.smpte2086.whitePoint.x == 0.3127f && metadata.smpte2086.whitePoint.y == 0.3290f &&
        metadata.smpte2086.maxLuminance == 1000.0f && metadata.smpte2086.minLuminance == 0.0001f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}

napi_value cta861(napi_env env, napi_callback_info info)
{
    OH_NativeBuffer_StaticMetadata metadata;
    metadata.cta861 = {.maxContentLightLevel = 1000.0f, .maxFrameAverageLightLevel = 200.0f};
    if (metadata.cta861.maxContentLightLevel == 1000.0f && metadata.cta861.maxFrameAverageLightLevel == 200.0f) {
        napi_value result = nullptr;
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
}