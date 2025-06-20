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

//
// Created on 2024/8/6.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef NATIVEWINDOW_USELESS_H
#define NATIVEWINDOW_USELESS_H

#include "napi/native_api.h"
#include <IPCKit/ipc_cparcel.h>
#include <bits/alltypes.h>
#include <chrono>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <native_buffer/native_buffer.h>

class InitNativeWindow {
private:
    int32_t width_ = 0x100;
    int32_t height_ = 0x100;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    OH_NativeImage* _image = nullptr;
    OHNativeWindow* _nativeWindow = nullptr;

public:
    InitNativeWindow()
    {
        _image = OH_ConsumerSurface_Create();
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
        _image = nullptr;
        _nativeWindow = nullptr;
    }
    OHNativeWindow* returnNativeWindow()
    {
        if (_nativeWindow == nullptr) {
            return nullptr;
        } else {
            return _nativeWindow;
        }
    };
    OH_NativeImage* returnNativeImage()
    {
        if (_image == nullptr) {
            return nullptr;
        } else {
            return _image;
        }
    }
};

napi_value testNativeWindowCreateNativeWindowNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowDestroyNativeWindowNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetSurfaceIdNullptr(napi_env env, napi_callback_info info);

napi_value testNativeWindowCreateNativeWindowFromSurfaceIdNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowCreateNativeWindowFromSurfaceIdNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId(napi_env env, napi_callback_info info);
napi_value testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr(napi_env env, napi_callback_info info);

napi_value testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowDestroyNativeWindowBufferNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetBufferHandleFromNativeNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch(napi_env env, napi_callback_info info);

napi_value testNativeWindowNativeWindowRequestBufferNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowAbortBufferNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowRequestAbortBufferNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowRequestAbortBufferAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowRequestBufferFenceFdNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowRequestBufferFenceFdAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowRequestAbortBufferMax(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowRequestAbortBufferErrorCode(napi_env env, napi_callback_info info);

napi_value testNativeWindowWriteToParcelErrptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowReadFromParcelErrptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowWRParcelNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowWriteToParcelAbNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowReadFromParcelAbNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowWRParcelDifferent(napi_env env, napi_callback_info info);

napi_value testNativeWindowNativeWindowFlushBufferNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowFlushBufferNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowFlushBufferAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowFlushBufferErrorCode(napi_env env, napi_callback_info info);

napi_value testNativeWindowGetLastFlushedBufferV2Nullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetLastFlushedBufferNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetLastFlushedBufferV2Normal(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetLastFlushedBufferNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetLastFlushedBufferV2ErrorCode(napi_env env, napi_callback_info info);

napi_value testNativeWindowSetBufferHold(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetNativeObjectMagicNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetNativeObjectMagicNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeObjectReferenceNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeObjectReferenceNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeObjectUnreferenceNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeObjectUnreferenceNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowAttachBufferNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowDetachBufferNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowDetachBufferNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowAttachBufferErrorCode(napi_env env, napi_callback_info info);

napi_value testNativeWindowNativeWindowAttachBufferNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowDetachBufferErrorCode(napi_env env, napi_callback_info info);

napi_value testNativeWindowNativeWindowAtDetachDifferentBufferNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal(napi_env env, napi_callback_info info);

// Native Window 2
napi_value testNativeWindowNativeWindowHandleOptSetGetFormatNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetUsageNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetStrideNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetTransformNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptGetBufferQueueSize(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal(napi_env env,
                                                                                   napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal(napi_env env,
                                                                                   napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowSetSetScalingModeV2Nullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowSetScalingModeV2ScalingMode(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetColorSpaceFirst(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetColorSpaceNormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetColorSpaceNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetColorSpaceNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetColorSpaceAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetMetadataValueFirst(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetDynamicMetadataValue(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetMetadataValueTimes(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetStaticMetadataValue(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetMetadataValue(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetNullMetadataValue(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetMetadataValueNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetMetadataValueAbnormal(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetMetadataValueNullptr(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampNormal(napi_env env,
                                                                                 napi_callback_info info);
napi_value testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampAbNormal(napi_env env,
                                                                                   napi_callback_info info);
napi_value testNativeWindowSetMetadataValue_metadata_type(napi_env env, napi_callback_info info);
napi_value testNativeWindowCreateNativeWindow(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowSetSetScalingMode(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowSetMetaData(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowSetMetaDataSet(napi_env env, napi_callback_info info);
napi_value testNativeWindowNativeWindowSetTunnelHandle(napi_env env, napi_callback_info info);
#endif // NATIVEWINDOW_USELESS_H
