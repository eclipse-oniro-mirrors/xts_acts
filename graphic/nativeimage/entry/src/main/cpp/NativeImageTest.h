/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef NATIVEIMAGE_TEST_H
#define NATIVEIMAGE_TEST_H

#include "napi/native_api.h"
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES3/gl32.h>
#include <bits/alltypes.h>
#include <cstring>
#include <native_image/native_image.h>
#include <native_buffer/native_buffer.h>
#include <native_window/external_window.h>
#include <sys/mman.h>
#include <chrono>
#include <iostream>
#include <map>
#include <native_image/graphic_error_code.h>
#include <common/native_common.h>

#define SUCCESS 0
#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_8 8
#define PARAM_16 16
#define PARAM_800 800
#define PARAM_600 600
#define ONEVAL 1
#define NUMMAX 16
#define TWOVAL 2
#define ARR_NUMBER_0 0
#define ARR_NUMBER_1 1
#define ARR_NUMBER_2 2
#define ARR_NUMBER_3 3
#define ARR_NUMBER_4 4
#define ARR_NUMBER_5 5
#define ARR_NUMBER_6 6
#define NUMBER_10 10
#define NUMBER_100 100
#define NUMBER_500 500
#define NUMBER_1000 1000
#define NUMBER_5000 5000
#define NUMBER_99999 99999
#define NUMBER_100000 100000
#define NUM_MAX 4294967295
#define ERRORCODE_0 0
#define ERRORCODE_30001000 30001000
#define ERRORCODE_40001000 40001000
#define ERRORCODE_40301000 40301000
#define ERRORCODE_40601000 40601000
#define ERRORCODE_41202000 41202000
#define ERRORCODE_41203000 41203000
#define ERRORCODE_41206000 41206000
#define ERRORCODE_41207000 41207000
#define ERRORCODE_41208000 41208000
#define ERRORCODE_41209000 41209000
#define ERRORCODE_41210000 41210000
#define ERRORCODE_41211000 41211000
#define ERRORCODE_41212000 41212000
#define ERRORCODE_50102000 50102000
#define ERRORCODE_50002000 50002000
#define ERRORCODE_50007000 50007000
#define ERRORCODE_50401000 50401000
#define ERRORCODE_60001000 60001000
#define ERRORCODE_60002000 60002000

class InitNativeWindow {
private:
    int32_t width_ = 0x800;
    int32_t height_ = 0x600;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    OHNativeWindow *_nativeWindow = nullptr;
    GLuint textureId = 0;

public:
    explicit InitNativeWindow(OH_NativeImage *_image)
    {
        if (_image != nullptr) {
            _nativeWindow = OH_NativeImage_AcquireNativeWindow(_image);
            if (_nativeWindow != nullptr) {
                OH_NativeWindow_NativeWindowHandleOpt(_nativeWindow, SET_BUFFER_GEOMETRY, width_, height_);
                OH_NativeWindow_NativeWindowHandleOpt(_nativeWindow, SET_USAGE, usage);
            } else {
                _nativeWindow = nullptr;
            }
        } else {
            _image = nullptr;
            _nativeWindow = nullptr;
        }
    }

    ~InitNativeWindow()
    {
        _nativeWindow = nullptr;
    }

    OHNativeWindow *returnNativeWindow()
    {
        if (_nativeWindow == nullptr) {
            return nullptr;
        } else {
            return _nativeWindow;
        }
    };

    int32_t OH_FlushBuffer()
    {
        OHNativeWindowBuffer *Buffer = nullptr;
        int fenceFd = -1;
        struct Region *region = new Region();
        struct Region::Rect *rect = new Region::Rect();
        rect->x = 0x100;
        rect->y = 0x100;
        rect->w = 0x100;
        rect->h = 0x100;
        region->rects = rect;
        int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(_nativeWindow, &Buffer, &fenceFd);
        ret = OH_NativeWindow_NativeWindowFlushBuffer(_nativeWindow, Buffer, fenceFd, *region);
        return ret;
    };
    
    int32_t OH_FlushBuffer1(BufferHandle **handle, uint32_t num = 3)
    {
        OHNativeWindowBuffer *buffer = nullptr;
        int fenceFd = -1;
        struct Region *region = new Region();
        struct Region::Rect *rect = new Region::Rect();
        rect->x = 0x100;
        rect->y = 0x100;
        rect->w = 0x100;
        rect->h = 0x100;
        region->rects = rect;
        int32_t ret = -1;
        if (num < PARAM_1 || num > PARAM_3) {
            num = PARAM_3;
        };
        for (int i = 0; i < num; i++) {
            ret = OH_NativeWindow_NativeWindowRequestBuffer(_nativeWindow, &buffer, &fenceFd);
            ret = OH_NativeWindow_NativeWindowFlushBuffer(_nativeWindow, buffer, fenceFd, *region);
        }
        *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
        return ret;
    };
};

napi_value OHNativeImageAcquireNativeWindowNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireNativeWindowNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageAttachContextNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeImageDetachContextNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeImageAttachContextNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageDetachContextNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetSurfaceIdNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeGetSurfaceIdNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageUpdateSurfaceImageNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetTimestampNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetTransformMatrixNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetTransformMatrixV2Nullptr(napi_env env, napi_callback_info info);
napi_value OHNativeImageUpdateSurfaceImageNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetTimestampNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetTransformMatrixNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetTransformMatrixV2Normal(napi_env env, napi_callback_info info);
napi_value OHNativeImageSetOnFrameAvailableListenerNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeImageUnSetOnFrameAvailableListenerNullptr(napi_env env, napi_callback_info info);
napi_value OHNativeImageSetOnFrameAvailableListenerNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageUnsetOnFrameAvailableListenerNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreate(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireNativeWindow(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireNativeWindowAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageAttachContext(napi_env env, napi_callback_info info);
napi_value OHNativeImageAttachContextAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageDetachContext(napi_env env, napi_callback_info info);
napi_value OHNativeImageDetachContextAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageUpdateSurfaceImage(napi_env env, napi_callback_info info);
napi_value OHNativeImageUpdateSurfaceImageBoundary(napi_env env, napi_callback_info info);
napi_value OHNativeImageUpdateSurfaceImageAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetTimestamp(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetTransformMatrix(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetTransformMatrixAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageDestroy(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreateNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreateAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageDestroy1(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreateMuch(napi_env env, napi_callback_info info);
napi_value OHNativeWindowDropBufferModeSetTrueNormal2(napi_env env, napi_callback_info info);
napi_value OHNativeWindowDropBufferModeSetAbNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageReleaseNativeWindowBufferNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageReleaseNativeWindowBufferAbnormal01(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetBufferMatrixNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetBufferMatrixNormal01(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetBufferMatrixAbNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetBufferMatrixCall(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireNativeWindowBufferNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireNativeWindowBufferCall(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireNativeWindowBufferAbNormal01(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireNativeWindowBufferAbNormal02(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireNativeWindowBufferAbNormal03(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireNativeWindowBufferAbNormal04(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireNativeWindowBufferAbNormal05(napi_env env, napi_callback_info info);
napi_value OHNativeImageReleaseNativeWindowBufferAbnormal(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceSetDefaultUsageNormal(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceSetDefaultUsageCall(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceSetDefaultUsageAbNormal(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceSetDefaultSizeNormal(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceSetDefaultSizeCall(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceSetDefaultSizeAbNormal(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceSetDefaultSizeAbNormal01(napi_env env, napi_callback_info info);
napi_value oHConsumerSurfaceCreateAbNormal(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceSetDefaultUsageSizeNormal(napi_env env, napi_callback_info info);
napi_value OHNativeWindowDropBufferModeSetTrueNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreateWithSingleBufferModeUsingTextImageNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreateWithSingleBufferModeUsingTextImageNull(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreateWithSingleBufferModeUsingTextImageAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreateWithSingleBufferModeUsingTextImageMultipleCalls(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageNormal(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageAbnormal(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageMultipleCalls(
    napi_env env, napi_callback_info info);
napi_value OHNativeImageReleaseTextImageNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageReleaseTextImageNull(napi_env env, napi_callback_info info);
napi_value OHNativeImageReleaseTextImageMultipleCalls(napi_env env, napi_callback_info info);
napi_value OHNativeImageReleaseTextImageDestroyImage(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetColorSpaceNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetColorSpaceNull(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetColorSpaceMultipleCalls(napi_env env, napi_callback_info info);
napi_value OHNativeImageGetColorSpaceDestoryImage(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreateWithSingleBufferModeTest1(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreateWithSingleBufferModeTest2(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreateWithSingleBufferModeTest3(napi_env env, napi_callback_info info);
napi_value OHConsumerSurfaceCreateWithSingleBufferModeTest(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireLatestNativeWindowBufferAbNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireLatestNativeWindowBufferAbNormal01(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireLatestNativeWindowBufferAbNormal02(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireLatestNativeWindowBufferAbNormal03(napi_env env, napi_callback_info info);
napi_value OHNativeImageAcquireLatestNativeWindowBufferCall(napi_env env, napi_callback_info info);
napi_value OHNativeImageCreateWithSingleBufferModeChangeTextureTarget(napi_env env, napi_callback_info info);
napi_value OHNativeImageIsReleasedNull(napi_env env, napi_callback_info info);
napi_value OHNativeImageIsReleasedNull1(napi_env env, napi_callback_info info);
napi_value OHNativeImageIsReleasedNormal0(napi_env env, napi_callback_info info);
napi_value OHNativeImageIsReleasedNormal1(napi_env env, napi_callback_info info);
napi_value OHNativeImageReleasedNull(napi_env env, napi_callback_info info);
napi_value OHNativeImageReleasedNormal(napi_env env, napi_callback_info info);
napi_value OHNativeImageReleasedNormal1(napi_env env, napi_callback_info info);
napi_value OHNativeImageIsReleasedCalls(napi_env env, napi_callback_info info);
napi_value OHNativeImageReleasedCalls(napi_env env, napi_callback_info info);
napi_value OHNativeImageReleaseAbnormal(napi_env env, napi_callback_info info);
napi_value OHNativeErrorCodeCover(napi_env env, napi_callback_info info);
#endif // NATIVEIMAGE_TEST_H