/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <cstdint>
#include <hilog/log.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <native_buffer/native_buffer.h>
#include "nativewindow.h"
#include "ace/xcomponent/native_interface_xcomponent.h"
#include <string>

#define SUCCESS 0
#define FAIL (-1)

#define CONSTANT_2147483647 2147483647
#define CONSTANT_2147483648 2147483648
#define CONSTANT_NEG_2147483647 (-2147483647)
#define CONSTANT_NEG_2147483648 (-2147483648)
#define CONSTANT_NEG_9223372036854775807 (9223372036854775807)
#define CONSTANT_NEG_9223372036854775808 (-9223372036854775808)


#define CONSTANT_0 0
#define CONSTANT_1 1
#define CONSTANT_2 2
#define CONSTANT_3 3
#define CONSTANT_4 4
#define CONSTANT_5 5
#define CONSTANT_6 6
#define CONSTANT_7 7
#define CONSTANT_8 8
#define CONSTANT_60 60
#define CONSTANT_2999 2999
#define CONSTANT_3000 3000
#define CONSTANT_3001 3001
#define CONSTANT_998899 998899
#define CONSTANT_100 100
#define CONSTANT_1000 1000
#define CONSTANT_10000 10000
#define CONSTANT_100000 100000
#define CONSTANT_1000000 1000000
#define CONSTANT_10000000 10000000
#define CONSTANT_100000000 100000000
#define CONSTANT_1000000000 1000000000
#define CONSTANT_1999999 1999999
#define CONSTANT_99999999 99999999
#define CONSTANT_99999999999999999 99999999999999999
#define CONSTANT_999999999999999999 999999999999999999
#define CONSTANT_40001000 40001000
#define CONSTANT_50002000 50002000
#define CONSTANT_50102000 50102000

OH_NativeBuffer_Format bufferFormatType[] = {
    NATIVEBUFFER_PIXEL_FMT_CLUT8,        NATIVEBUFFER_PIXEL_FMT_CLUT1,        NATIVEBUFFER_PIXEL_FMT_CLUT4,
    NATIVEBUFFER_PIXEL_FMT_RGB_565,      NATIVEBUFFER_PIXEL_FMT_RGBA_5658,    NATIVEBUFFER_PIXEL_FMT_RGBX_4444,
    NATIVEBUFFER_PIXEL_FMT_RGBA_4444,    NATIVEBUFFER_PIXEL_FMT_RGB_444,      NATIVEBUFFER_PIXEL_FMT_RGBX_5551,
    NATIVEBUFFER_PIXEL_FMT_RGBA_5551,    NATIVEBUFFER_PIXEL_FMT_RGB_555,      NATIVEBUFFER_PIXEL_FMT_RGBX_8888,
    NATIVEBUFFER_PIXEL_FMT_RGBA_8888,    NATIVEBUFFER_PIXEL_FMT_RGB_888,      NATIVEBUFFER_PIXEL_FMT_BGR_565,
    NATIVEBUFFER_PIXEL_FMT_BGRX_4444,    NATIVEBUFFER_PIXEL_FMT_BGRA_4444,    NATIVEBUFFER_PIXEL_FMT_BGRX_5551,
    NATIVEBUFFER_PIXEL_FMT_BGRA_5551,    NATIVEBUFFER_PIXEL_FMT_BGRX_8888,    NATIVEBUFFER_PIXEL_FMT_BGRA_8888,
    NATIVEBUFFER_PIXEL_FMT_YUV_422_I,    NATIVEBUFFER_PIXEL_FMT_YCBCR_422_SP, NATIVEBUFFER_PIXEL_FMT_YCRCB_422_SP,
    NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP, NATIVEBUFFER_PIXEL_FMT_YCRCB_420_SP, NATIVEBUFFER_PIXEL_FMT_YCBCR_422_P,
    NATIVEBUFFER_PIXEL_FMT_YCRCB_422_P,  NATIVEBUFFER_PIXEL_FMT_YCBCR_420_P,  NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P,
    NATIVEBUFFER_PIXEL_FMT_YUYV_422_PKG, NATIVEBUFFER_PIXEL_FMT_UYVY_422_PKG, NATIVEBUFFER_PIXEL_FMT_YVYU_422_PKG,
    NATIVEBUFFER_PIXEL_FMT_VYUY_422_PKG, NATIVEBUFFER_PIXEL_FMT_RGBA_1010102, NATIVEBUFFER_PIXEL_FMT_YCBCR_P010,
    NATIVEBUFFER_PIXEL_FMT_YCRCB_P010,   NATIVEBUFFER_PIXEL_FMT_RAW10,        NATIVEBUFFER_PIXEL_FMT_VENDER_MASK,
    NATIVEBUFFER_PIXEL_FMT_BUTT,         NATIVEBUFFER_PIXEL_FMT_BLOB,         NATIVEBUFFER_PIXEL_FMT_RGBA16_FLOAT};

int32_t TransformType[] = {
    NATIVEBUFFER_ROTATE_NONE,   NATIVEBUFFER_ROTATE_90,     NATIVEBUFFER_ROTATE_180,    NATIVEBUFFER_ROTATE_270,
    NATIVEBUFFER_FLIP_H,        NATIVEBUFFER_FLIP_V,        NATIVEBUFFER_FLIP_H_ROT90,  NATIVEBUFFER_FLIP_V_ROT90,
    NATIVEBUFFER_FLIP_H_ROT180, NATIVEBUFFER_FLIP_V_ROT180, NATIVEBUFFER_FLIP_H_ROT270, NATIVEBUFFER_FLIP_V_ROT270,
};

int32_t ColorGamut[] = {
    NATIVEBUFFER_COLOR_GAMUT_NATIVE,         NATIVEBUFFER_COLOR_GAMUT_STANDARD_BT601,
    NATIVEBUFFER_COLOR_GAMUT_STANDARD_BT709, NATIVEBUFFER_COLOR_GAMUT_DCI_P3,
    NATIVEBUFFER_COLOR_GAMUT_SRGB,           NATIVEBUFFER_COLOR_GAMUT_ADOBE_RGB,
    NATIVEBUFFER_COLOR_GAMUT_DISPLAY_P3,     NATIVEBUFFER_COLOR_GAMUT_BT2020,
    NATIVEBUFFER_COLOR_GAMUT_BT2100_PQ,      NATIVEBUFFER_COLOR_GAMUT_BT2100_HLG,
    NATIVEBUFFER_COLOR_GAMUT_DISPLAY_BT2020,
};

uint64_t usageType[] = {
    NATIVEBUFFER_USAGE_CPU_READ,      NATIVEBUFFER_USAGE_CPU_WRITE,  NATIVEBUFFER_USAGE_MEM_DMA,
    NATIVEBUFFER_USAGE_HW_RENDER,     NATIVEBUFFER_USAGE_HW_TEXTURE, NATIVEBUFFER_USAGE_CPU_READ_OFTEN,
    NATIVEBUFFER_USAGE_ALIGNMENT_512,
};

static void DestroyNativeWindowImage(OH_NativeImage *image, OHNativeWindow *window)
{
    OH_NativeWindow_DestroyNativeWindow(window);
    OH_NativeImage_Destroy(&image);
}

napi_value testNativeWindowNativeWindowHandleOptSetGetFormatNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
//     OHNativeWindow* nativeWindow;
    for (int i = 0; i < sizeof(bufferFormatType)/sizeof(bufferFormatType[0]); ++i) {
        int32_t flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT, bufferFormatType[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1, &result);
            return result;
        }
        int32_t getFormat;
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_FORMAT, &getFormat);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_2, &result);
            return result;
        }
        if (getFormat != bufferFormatType[i]) {
            napi_create_int32(env, CONSTANT_3, &result);
            return result;
        }
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int32_t flag;
    int32_t arr[] = {-CONSTANT_2147483648, -CONSTANT_2147483647, -CONSTANT_1000000, -CONSTANT_100,      -CONSTANT_1,
                     CONSTANT_0,           CONSTANT_1,           CONSTANT_100000,   CONSTANT_2147483647};

    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_1, &result);
            return result;
        }
        int32_t format;
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_FORMAT, &format);
        if (flag != 0) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_2, &result);
            return result;
        }
        if (format != arr[i]) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_3, &result);
            return result;
        }
    }

    int32_t flag1 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT, "ab%^！#8c");
    int32_t flag2 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT, CONSTANT_999999999999999999);
    int32_t flag3 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT, NULL);
    int32_t flag4 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_FORMAT);
    if (flag1 != 0 || flag2 != 0 || flag3 != 0 || flag4 != 0) {
        napi_create_int32(env, CONSTANT_10000 + CONSTANT_4, &result);
        return result;
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptSetGetUsageNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *_nativeWindow = nullptr;
    _nativeWindow = initNative->returnNativeWindow();
    if (_nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int code = SET_BUFFER_GEOMETRY;
    int32_t width_ = 0x100;
    int32_t height_ = 0x100;
    OH_NativeWindow_NativeWindowHandleOpt(_nativeWindow, code, width_, height_);
    for (int i = 0; i < sizeof(usageType)/sizeof(usageType[0]); ++i) {
        uint64_t getUsage;
        int32_t flag1 = OH_NativeWindow_NativeWindowHandleOpt(_nativeWindow, SET_USAGE, usageType[i]);
        int32_t flag2 = OH_NativeWindow_NativeWindowHandleOpt(_nativeWindow, GET_USAGE, &getUsage);
        if (flag1 != 0 || flag2 != 0) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_2, &result);
            return result;
        }
        if (getUsage != usageType[i]) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_3, &result);
            return result;
        }
    }
    uint64_t arr2[] = {0, 1, 1000, 100000000, 2147483647, 18446744073709551615};
    for (int i = 0; i < sizeof(arr2) / sizeof(arr2[0]); ++i) {
        int32_t flag1 = OH_NativeWindow_NativeWindowHandleOpt(_nativeWindow, SET_USAGE, arr2[i]);
        uint64_t  usage;
        int32_t flag2 = OH_NativeWindow_NativeWindowHandleOpt(_nativeWindow, GET_USAGE, &usage);
        if (flag1 != 0 || flag2 != 0) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_5, &result);
            return result;
        }
        if (usage != arr2[i]) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_6, &result);
            return result;
        }
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int32_t flag;
    unsigned arr[] = {static_cast<unsigned int>(-999999999999999999), static_cast<unsigned int>(-2147483648),
                      static_cast<unsigned int>(-1000), static_cast<unsigned int>(-1),
                      static_cast<unsigned int>(999999999999999999)};

    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_USAGE, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_1, &result);
            return result;
        }
        uint64_t  usage;
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_USAGE, &usage);
        if (flag != 0) {
            napi_create_int32(env, (i + 1) * CONSTANT_1000 + CONSTANT_2, &result);
            return result;
        }
    }

    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_USAGE, "");
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_USAGE, NULL);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_USAGE);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetGetStrideNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int32_t arr[] = {-CONSTANT_2147483647, -CONSTANT_1000, -CONSTANT_1,        CONSTANT_0,
                     CONSTANT_1,           CONSTANT_1000,  CONSTANT_2147483647};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        int32_t stride;
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_STRIDE, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_STRIDE, &stride);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
        if (arr[i] != stride) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_3, &result);
            return result;
        }
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t flag;
    int32_t stride;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();

    long long arr[] = {-CONSTANT_999999999999999999, static_cast<long long>(CONSTANT_999999999999999999), 1LL << 63};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_STRIDE, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_STRIDE, &stride);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_STRIDE, NULL);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_STRIDE, "sdasda213!");
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_STRIDE);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();

    int32_t arr[] = {CONSTANT_0,          CONSTANT_100,        CONSTANT_1000,     CONSTANT_10000,    CONSTANT_1000000,
                     CONSTANT_1000000000, CONSTANT_2147483647, -CONSTANT_1999999, -CONSTANT_99999999};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        int32_t interval;
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SWAP_INTERVAL, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_SWAP_INTERVAL, &interval);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t flag;
    int32_t stride;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();

    long long arr[] = {-CONSTANT_99999999999999999, static_cast<long long>(CONSTANT_99999999999999999), 1LL << 63};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_STRIDE, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_STRIDE, &stride);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_STRIDE, NULL);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_STRIDE, "sdasda213!");
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_STRIDE);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();

    for (int i = 0; i < sizeof(ColorGamut) / sizeof(ColorGamut[0]); ++i) {
        int32_t getColorGamut;
        int32_t flag1 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_COLOR_GAMUT, ColorGamut[i]);
        int32_t flag2 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_COLOR_GAMUT, &getColorGamut);
        if (flag1 != 0 || flag2 != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        if (getColorGamut != ColorGamut[i]) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
    }
    int32_t arr[] = {-CONSTANT_2147483647, -CONSTANT_1000, -CONSTANT_1,        CONSTANT_0,
                     CONSTANT_1,           CONSTANT_1000,  CONSTANT_2147483647};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        int32_t gamut;
        int32_t flag1 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_COLOR_GAMUT, arr[i]);
        int32_t flag2 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_COLOR_GAMUT, &gamut);
        if (flag1 != 0 || flag2 != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_3, &result);
            return result;
        }
        if (arr[i] != gamut) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_4, &result);
            return result;
        }
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t flag;
    int32_t gamut;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();

    long long arr[] = {-CONSTANT_99999999999999999, static_cast<long long>(CONSTANT_99999999999999999), 1LL << 63};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_COLOR_GAMUT, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_COLOR_GAMUT, &gamut);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_COLOR_GAMUT, NULL);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_COLOR_GAMUT, "sdasda213!");
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_COLOR_GAMUT);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetGetTransformNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    for (int i = 0; i < sizeof(TransformType)/sizeof(TransformType[0]); ++i) {
        int32_t getTransformType;
        int32_t flag1 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_TRANSFORM, TransformType[i]);
        int32_t flag2 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_TRANSFORM, &getTransformType);
        if (flag1 != 0 || flag2 != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
        if (TransformType[i] != getTransformType) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_3, &result);
            return result;
        }
    }
    int32_t arr[] = {-CONSTANT_2147483647, -CONSTANT_1000, -CONSTANT_1,        CONSTANT_0,
                     CONSTANT_1,           CONSTANT_1000,  CONSTANT_2147483647};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        int32_t transform;
        int32_t flag1 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_TRANSFORM, arr[i]);
        int32_t flag2 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_TRANSFORM, &transform);
        if (flag1 != 0 || flag2 != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_4, &result);
            return result;
        }
        if (arr[i] != transform) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_5, &result);
            return result;
        }
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t flag;
    int32_t gamut;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();

    long long arr[] = {-CONSTANT_99999999999999999, static_cast<long long>(CONSTANT_99999999999999999), 1LL << 63};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_TRANSFORM, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_TRANSFORM, &gamut);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_TRANSFORM, NULL);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_TRANSFORM, "sdasda213!");
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_TRANSFORM);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    uint64_t arr[] = {CONSTANT_0,          CONSTANT_1, CONSTANT_1000, 1ULL << 63, CONSTANT_999999999999999999,
                      18446744073709551615};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_UI_TIMESTAMP, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int64_t arr[] = {-CONSTANT_1, -CONSTANT_1000, -CONSTANT_1000000, -922337203685477580};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_UI_TIMESTAMP, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_UI_TIMESTAMP, "sdasda213!");
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_UI_TIMESTAMP, NULL);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_UI_TIMESTAMP);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptGetBufferQueueSize(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int32_t size;

    int32_t flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_BUFFERQUEUE_SIZE, &size);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    if (size != CONSTANT_3) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal(napi_env env,
                                                                                 napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int32_t brightness;

    float arr[] = {0.0f, 0.00001f, 0.5f, 0.123456f, 0.99999f, 1.0f};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        int32_t flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_HDR_WHITE_POINT_BRIGHTNESS, brightness);
        if (flag != 0) {
            napi_create_int32(env, i + CONSTANT_1, &result);
            return result;
        }
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal(napi_env env,
                                                                                   napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int32_t brightness;

    float arr[] = {-0.1f, 1.1f, -CONSTANT_100, 0, CONSTANT_100};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        int32_t flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_HDR_WHITE_POINT_BRIGHTNESS, brightness);
        if (flag != 0) {
            napi_create_int32(env, i +CONSTANT_1, &result);
            return result;
        }
    }
    int32_t flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_HDR_WHITE_POINT_BRIGHTNESS, "test123@@#");
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_HDR_WHITE_POINT_BRIGHTNESS);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal(napi_env env,
                                                                                 napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int32_t brightness;

    float arr[] = {0.0f, 0.00001f, 0.5f, 0.123456f, 0.99999f, 1.0f};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        int32_t flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SDR_WHITE_POINT_BRIGHTNESS, brightness);
        if (flag != 0) {
            napi_create_int32(env, i + CONSTANT_1, &result);
            return result;
        }
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal(napi_env env,
                                                                                   napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int32_t brightness;

    float arr[] = {-0.1f, 1.1f, -CONSTANT_100, 0, CONSTANT_100};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        int32_t flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SDR_WHITE_POINT_BRIGHTNESS, brightness);
        if (flag != 0) {
            napi_create_int32(env, i + CONSTANT_1, &result);
            return result;
        }
    }
    int32_t flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SDR_WHITE_POINT_BRIGHTNESS, "test123@@#");
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SDR_WHITE_POINT_BRIGHTNESS);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int32_t SourceType[] = {
        OH_SURFACE_SOURCE_DEFAULT, OH_SURFACE_SOURCE_UI,    OH_SURFACE_SOURCE_GAME,
        OH_SURFACE_SOURCE_CAMERA,  OH_SURFACE_SOURCE_VIDEO,
    };
    for (int i = 0; i < sizeof(SourceType)/sizeof(SourceType[i]); ++i) {
        int32_t getSourceType;
        int32_t flag1 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SOURCE_TYPE, SourceType[i]);
        int32_t flag2 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_SOURCE_TYPE, &getSourceType);
        if (flag1 != 0 || flag2 != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        if (getSourceType != SourceType[i]) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
    }
    int32_t arr[] = {-2147483647, -1000, -1, 0, 1, 1000, 2147483647};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        int32_t flag1 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SOURCE_TYPE, arr[i]);
        int32_t sourceType;
        int32_t flag2 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_SOURCE_TYPE, &sourceType);
        if (flag1 != 0 || flag2 != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_3, &result);
            return result;
        }
        if (sourceType != arr[i]) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_4, &result);
            return result;
        }
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    unsigned arr[] = {static_cast<unsigned int>(-999999999999999999), static_cast<unsigned int>(-2147483648),
                      static_cast<unsigned int>(-1000), static_cast<unsigned int>(-1),
                      static_cast<unsigned int>(999999999999999999)};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SOURCE_TYPE, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        int32_t sourceType;
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_SOURCE_TYPE, &sourceType);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
    }
    int32_t flag1 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SOURCE_TYPE, CONSTANT_999999999999999999);
    int32_t flag2 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SOURCE_TYPE, "sdasda213!");
    int32_t flag3 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SOURCE_TYPE, NULL);
    int32_t flag4 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_SOURCE_TYPE);
    if (flag1 != 0 || flag2 != 0 || flag3 != 0 || flag4 != 0) {
        napi_create_int32(env, CONSTANT_100000 + CONSTANT_3, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t flag;
    char *frameworkType;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();

    const char *arr[] = {
        "", "0123", "natp ", "应用框架", "Test", "!@#$%&*(", "这里一共是二十一个汉字这里一共是二十一个汉"};

    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_APP_FRAMEWORK_TYPE, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_APP_FRAMEWORK_TYPE, &frameworkType);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
        int com = strcmp(arr[i], frameworkType);
        if (com != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_3, &result);
            return result;
        }
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t flag;
    char *frameworkType;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();

    const char *arr[] = {"这里一共是二十二个汉字这里一共是二十二个汉字",
                         "abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde"};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_APP_FRAMEWORK_TYPE, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_APP_FRAMEWORK_TYPE, &frameworkType);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowSetSetScalingModeV2Nullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();

    int32_t flag = OH_NativeWindow_NativeWindowSetScalingModeV2(nullptr, OH_SCALING_MODE_FREEZE_V2);
    if (flag == 0) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowSetScalingModeV2(nativeWindow, static_cast<OHScalingModeV2>(CONSTANT_100));
    if (flag == 0) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowNativeWindowSetScalingModeV2ScalingMode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();

    int32_t flag;
    OHScalingModeV2 arr[] = {OH_SCALING_MODE_FREEZE_V2, OH_SCALING_MODE_SCALE_TO_WINDOW_V2,
                             OH_SCALING_MODE_SCALE_CROP_V2, OH_SCALING_MODE_NO_SCALE_CROP_V2,
                             OH_SCALING_MODE_SCALE_FIT_V2};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowSetScalingModeV2(nativeWindow, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, i + CONSTANT_1, &result);
            return result;
        }
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowGetColorSpaceFirst(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    OHNativeWindowBuffer *windowBuffer = nullptr;
    int fenceFd;
    int32_t flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &windowBuffer, &fenceFd);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    OH_NativeBuffer_ColorSpace colorSpace;
    flag = OH_NativeWindow_GetColorSpace(nativeWindow, &colorSpace);
    if (flag != CONSTANT_50002000 && flag != CONSTANT_50102000) {
        napi_create_int32(env, flag, &result);
        return result;
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowSetColorSpaceNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag;
    for (int i = 0; i < sizeof(OH_NativeBuffer_ColorSpace); ++i) {
        OH_NativeBuffer_ColorSpace colorspace1 = static_cast<OH_NativeBuffer_ColorSpace>(i);
        InitNativeWindow *initNative = new InitNativeWindow();
        OHNativeWindow *nativeWindow = nullptr;
        nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
        OH_NativeImage *iamge = initNative->returnNativeImage();
        OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
        int fenceFd;
        int32_t res = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
        Region::Rect rect{
            .x = 0x100,
            .y = 0x100,
            .w = 0x100,
            .h = 0x100,
        };
        Region region{.rects = &rect};
        res = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
        flag = OH_NativeWindow_SetColorSpace(nativeWindow, colorspace1);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * i + CONSTANT_1, &result);
            return result;
        }
        OH_NativeBuffer_ColorSpace colorSpace;
        flag = OH_NativeWindow_GetColorSpace(nativeWindow, &colorSpace);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * i + CONSTANT_2, &result);
            return result;
        }
        if (colorSpace != colorspace1) {
            napi_create_int32(env, CONSTANT_1000 * i + CONSTANT_3, &result);
            return result;
        }
    
    delete initNative;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowSetColorSpaceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag = OH_NativeWindow_SetColorSpace(nullptr, OH_COLORSPACE_NONE);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowSetColorSpaceAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();

    int32_t flag =
        OH_NativeWindow_SetColorSpace(nativeWindow, static_cast<OH_NativeBuffer_ColorSpace>(CONSTANT_100000));
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowGetColorSpaceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag;
    OH_NativeBuffer_ColorSpace ret;
    flag = OH_NativeWindow_GetColorSpace(nullptr, &ret);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowGetMetadataValueFirst(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int32_t ret1;
    uint8_t *ret2;
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, &ret1, &ret2);
    if (flag != CONSTANT_50002000 && flag != CONSTANT_50102000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowSetDynamicMetadataValue1(napi_env env, napi_callback_info info,
                                                    OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = -1;
    uint8_t metaData[CONSTANT_60];
    int32_t flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != CONSTANT_50002000 && flag != CONSTANT_50102000) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    // 2. X=0 set调用失败 get调用失败
    X = 0;
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != CONSTANT_50002000 && flag != CONSTANT_50102000) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    return result;
}

napi_value testNativeWindowSetDynamicMetadataValue2(napi_env env, napi_callback_info info,
                                                    OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    uint8_t metaData[CONSTANT_60];
    int32_t X = 1; // 3. X=1 set调用成功 get调用成功 两者一致
    metaData[0] = static_cast<uint8_t>(0);
    int32_t flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    X = CONSTANT_60; // 4. X=60 set调用成功 get调用成功 两者一致
    for (int i = 0; i < X; ++i) {
        metaData[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, CONSTANT_60, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_4 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_4 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, CONSTANT_4 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    return result;
}

napi_value testNativeWindowSetDynamicMetadataValue3(napi_env env, napi_callback_info info,
                                                    OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    uint8_t metaData[CONSTANT_60];
    int32_t X = CONSTANT_2999;
    int32_t flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_5 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_5 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, CONSTANT_5 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    X = CONSTANT_3000;
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_6 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_6 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, CONSTANT_6 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    return result;
}

napi_value testNativeWindowSetDynamicMetadataValue4(napi_env env, napi_callback_info info,
                                                    OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    uint8_t metaData[CONSTANT_60];
    int32_t X = CONSTANT_3001;
    int32_t flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_7 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_7 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    X = CONSTANT_100000000;
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_8 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    return result;
}

napi_value testNativeWindowSetDynamicMetadataValue(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    int32_t res = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    Region::Rect rect{.x = 0x100, .y = 0x100, .w = 0x100, .h = 0x100};
    Region region{.rects = &rect};
    res = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);

    result = testNativeWindowSetDynamicMetadataValue1(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }
    result = testNativeWindowSetDynamicMetadataValue2(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }
    result = testNativeWindowSetDynamicMetadataValue3(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }
    result = testNativeWindowSetDynamicMetadataValue4(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowSetMetadataValueTimes(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    int32_t res = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    res = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = CONSTANT_60;
    uint8_t metaData[X];
    for (int j = 0; j < X; ++j) {
        metaData[j] = static_cast<uint8_t>(j);
    }

    for (int i = 0; i < CONSTANT_60; ++i) {
        flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, X, metaData);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
        flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_2, &result);
            return result;
        }
        if (bufferSize != X) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_3, &result);
            return result;
        }
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowSetStaticMetadataValue1(napi_env env, napi_callback_info info,
                                                   OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    uint8_t metaData[CONSTANT_60];
    // 1.
    int32_t X = -1;
    int32_t flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, X, metaData);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != CONSTANT_50002000 && flag != CONSTANT_50102000) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    // 2. X=0 set调用失败 get调用失败
    X = 0;
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, X, metaData);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != CONSTANT_50002000 && flag != CONSTANT_50102000) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    return result;
}


napi_value testNativeWindowSetStaticMetadataValue2(napi_env env, napi_callback_info info,
                                                   OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    uint8_t metaData[CONSTANT_60];
    int32_t X = 1; // 3. X=1 set调用成功 get调用成功 两者一致
    metaData[0] = static_cast<uint8_t>(0);
    int32_t flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    X = CONSTANT_60; // 4.
    for (int i = 0; i < X; ++i) {
        metaData[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, CONSTANT_60, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_4 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_4 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, CONSTANT_4 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    return result;
}

napi_value testNativeWindowSetStaticMetadataValue3(napi_env env, napi_callback_info info,
                                                   OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    uint8_t metaData[CONSTANT_60];

    int32_t X = CONSTANT_2999;
    int32_t flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_5 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_5 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, CONSTANT_5 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    X = CONSTANT_3000;
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_6 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_6 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, CONSTANT_6 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    return result;
}

napi_value testNativeWindowSetStaticMetadataValue4(napi_env env, napi_callback_info info,
                                                   OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    uint8_t metaData[CONSTANT_60];
    int32_t X = CONSTANT_3001;
    int32_t flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, X, buffer);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_7 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_7 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    X = CONSTANT_100000000;
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_STATIC_METADATA, X, metaData);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_8 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    return result;
}

napi_value testNativeWindowSetStaticMetadataValue(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    int32_t res = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    Region::Rect rect{.x = 0x100, .y = 0x100, .w = 0x100, .h = 0x100};
    Region region{.rects = &rect};
    res = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);

    result = testNativeWindowSetStaticMetadataValue1(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }
    result = testNativeWindowSetStaticMetadataValue2(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }
    result = testNativeWindowSetStaticMetadataValue3(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }
    result = testNativeWindowSetStaticMetadataValue4(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowSetMetadataValue1(napi_env env, napi_callback_info info, OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t flag;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = -1;
    uint8_t metaData[CONSTANT_60];
    // 1.
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, X, metaData);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != CONSTANT_50002000 && flag != CONSTANT_50102000) {
        napi_create_int32(env, CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    // 2. X=0 set调用失败 get调用失败
    X = 0;
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, X, metaData);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != CONSTANT_50002000 && flag != CONSTANT_50102000) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    return result;
}

napi_value testNativeWindowSetMetadataValue2(napi_env env, napi_callback_info info, OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = 1; // 3. X=1 set调用成功 get调用成功 两者一致
    uint8_t metaData[CONSTANT_60];
    metaData[0] = static_cast<uint8_t>(X);
    int32_t flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != CONSTANT_4) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    X = CONSTANT_4; // 4. X=60 set调用成功 get调用成功 两者一致
    for (int i = 0; i < X; ++i) {
        metaData[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_4 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_4 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != CONSTANT_4) {
        napi_create_int32(env, CONSTANT_4 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    return result;
}

napi_value testNativeWindowSetMetadataValue3(napi_env env, napi_callback_info info, OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t flag;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = -1;
    uint8_t metaData[CONSTANT_60];
    // 5. X=2999 set调用成功 get调用成功 两者一致
    X = CONSTANT_2999;
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_5 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_5 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != CONSTANT_4) {
        napi_create_int32(env, CONSTANT_5 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    // 6. X=3000 set调用成功 get调用成功 两者一致
    X = CONSTANT_3000;
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_6 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_6 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    if (bufferSize != CONSTANT_4) {
        napi_create_int32(env, CONSTANT_6 * CONSTANT_1000 + CONSTANT_3, &result);
        return result;
    }
    return result;
}

napi_value testNativeWindowSetMetadataValue4(napi_env env, napi_callback_info info, OHNativeWindow *nativeWindow)
{
    napi_value result = nullptr;
    int32_t flag;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = -1;
    uint8_t metaData[CONSTANT_60];
    // 7.
    X = CONSTANT_3001;
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, X, metaData);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_7 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_7 * CONSTANT_1000 + CONSTANT_2, &result);
        return result;
    }
    // 8. X=100000000 set调用失败 get调用失败
    X = CONSTANT_100000000;
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, X, metaData);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_8 * CONSTANT_1000 + CONSTANT_1, &result);
        return result;
    }
    return result;
}

napi_value testNativeWindowSetMetadataValue(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    int32_t flag = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    Region::Rect rect{.x = 0x100, .y = 0x100, .w = 0x100, .h = 0x100};
    Region region{.rects = &rect};
    flag = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);

    result = testNativeWindowSetMetadataValue1(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }
    result = testNativeWindowSetMetadataValue2(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }
    result = testNativeWindowSetMetadataValue3(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }
    result = testNativeWindowSetMetadataValue4(env, info, nativeWindow);
    if (result != nullptr) {
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowSetNullMetadataValue(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    uint8_t *buffer = new uint8_t[CONSTANT_60];
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, static_cast<OH_NativeBuffer_MetadataKey>(CONSTANT_1000000),
                                            CONSTANT_60, buffer);
    if (flag != CONSTANT_50002000 && flag != CONSTANT_50102000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowSetMetadataValueNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    uint8_t *buffer = new uint8_t[CONSTANT_60];
    flag = OH_NativeWindow_SetMetadataValue(nullptr, OH_HDR_DYNAMIC_METADATA, CONSTANT_60, buffer);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, CONSTANT_60, nullptr);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, 1, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}


napi_value testNativeWindowGetMetadataValueAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    uint8_t *buffer = new uint8_t[CONSTANT_60];
    flag = OH_NativeWindow_SetMetadataValue(nullptr, OH_HDR_DYNAMIC_METADATA, CONSTANT_60, buffer);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, CONSTANT_60, nullptr);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, 1, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowGetMetadataValueNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    uint8_t *buffer = new uint8_t[CONSTANT_60];
    int32_t ret1;
    uint8_t *ret2;
    // 1.
    flag = OH_NativeWindow_SetMetadataValue(nullptr, OH_HDR_DYNAMIC_METADATA, CONSTANT_60, buffer);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    // 2.
    flag = OH_NativeWindow_GetMetadataValue(nullptr, OH_HDR_DYNAMIC_METADATA, &ret1, nullptr);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }
    // 3.
    flag = OH_NativeWindow_GetMetadataValue(nullptr, OH_HDR_DYNAMIC_METADATA, nullptr, &ret2);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }
    // 4.
    flag = OH_NativeWindow_GetMetadataValue(nullptr, OH_HDR_DYNAMIC_METADATA, &ret1, &ret2);
    if (flag != CONSTANT_40001000) {
        napi_create_int32(env, CONSTANT_4, &result);
        return result;
    }
    delete[] buffer;

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampNormal(napi_env env,
                                                                                 napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    uint64_t arr[] = {CONSTANT_1, CONSTANT_1000, CONSTANT_1000000000, 1ULL << 63, CONSTANT_999999999999999999};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_DESIRED_PRESENT_TIMESTAMP, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampAbNormal(napi_env env,
                                                                                   napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t flag;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    int64_t arr[] = {CONSTANT_0, -CONSTANT_1, -CONSTANT_1000, -CONSTANT_1000000, CONSTANT_NEG_9223372036854775807};
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); ++i) {
        flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_DESIRED_PRESENT_TIMESTAMP, arr[i]);
        if (flag != 0) {
            napi_create_int32(env, CONSTANT_1000 * (i + 1) + CONSTANT_1, &result);
            return result;
        }
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_DESIRED_PRESENT_TIMESTAMP, "sdasda213!");
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_DESIRED_PRESENT_TIMESTAMP, NULL);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_2 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }
    flag = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_DESIRED_PRESENT_TIMESTAMP);
    if (flag != 0) {
        napi_create_int32(env, CONSTANT_3 * CONSTANT_100000 + CONSTANT_1, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowSetMetadataValue_metadata_type(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OH_NativeImage *iamge = initNative->returnNativeImage();
    OH_NativeBuffer_MetadataType hdr_type[] = {OH_VIDEO_HDR_HLG, OH_VIDEO_HDR_HDR10, OH_VIDEO_HDR_VIVID, OH_VIDEO_NONE};
    for (int i = 0; i <= sizeof(hdr_type) / sizeof(hdr_type[0]); i++) {
        int32_t bufferSize;
        uint8_t *buffer;
        uint8_t val = hdr_type[i];
        int32_t flag = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, sizeof(uint8_t), &val);
        if (flag != SUCCESS) {
            napi_create_int32(env, CONSTANT_1000 * i + CONSTANT_1, &result);
            return result;
        }
        flag = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
        if (*buffer != val) {
            napi_create_int32(env, CONSTANT_1000 * i + CONSTANT_2, &result);
            return result;
        }
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}