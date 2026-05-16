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

#ifndef GRAPHICS2DTESTAPI20_EXTERNALWINDOW_H
#define GRAPHICS2DTESTAPI20_EXTERNALWINDOW_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addExternalWindowTest(std::vector<napi_property_descriptor>& descData);
napi_value testOHScalingModeToWindow(napi_env env, napi_callback_info info);
napi_value testOHScalingModeCrop(napi_env env, napi_callback_info info);
napi_value testOHScalingModeNoCrop(napi_env env, napi_callback_info info);
napi_value testOhMetakeyRedPrimaryY(napi_env env, napi_callback_info info);
napi_value testOhMetakeyGreenPrimaryX(napi_env env, napi_callback_info info);
napi_value testOhMetakeyGreenPrimaryY(napi_env env, napi_callback_info info);
napi_value testOhMetakeyBluePrimaryX(napi_env env, napi_callback_info info);
napi_value testOhMetakeyBluePrimaryY(napi_env env, napi_callback_info info);
napi_value testOhMetakeyWhitePrimaryX(napi_env env, napi_callback_info info);
napi_value testOhMetakeyWhitePrimaryY(napi_env env, napi_callback_info info);
napi_value testOhMetakeyMaxLuminance(napi_env env, napi_callback_info info);
napi_value testOhMetakeyMinLuminance(napi_env env, napi_callback_info info);
napi_value testOhMetakeyMaxContentLightLevel(napi_env env, napi_callback_info info);
napi_value testOhMetakeyMaxFrameAverageLightLevel(napi_env env, napi_callback_info info);
napi_value testOhMetakeyHdrVivid(napi_env env, napi_callback_info info);
napi_value testNativeWindowWTParcelSuccess(napi_env env, napi_callback_info info);
napi_value testNativeWindowWTParcelInvalidArguments(napi_env env, napi_callback_info info);
napi_value testNativeWindowRFParcelSuccess(napi_env env, napi_callback_info info);
napi_value testNativeWindowRFParcelInvalidArguments(napi_env env, napi_callback_info info);
napi_value testNativeWindowWindowHandleOptSetTimeOut(napi_env env, napi_callback_info info);
napi_value testNativeWindowWindowHandleOptGetTimeOut(napi_env env, napi_callback_info info);
napi_value testNativeWindowGLFlushedBufferV2Success(napi_env env, napi_callback_info info);
napi_value testNativeWindowGLFBufferV2InvalidArguments(napi_env env, napi_callback_info info);
napi_value testNativeWindowGLFlushedBufferV2BUFFERSTATEINVALID(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetColorSpaceSuccess(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetColorSpaceInvalidArguments(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetColorSpaceInvalidArguments(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetMVSuccess(napi_env env, napi_callback_info info);
napi_value testNativeWindowSetMVInvalidArguments(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetMVSuccess(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetMVInvalidArguments(napi_env env, napi_callback_info info);
napi_value testNativeWindowGetMVUnsupported(napi_env env, napi_callback_info info);
napi_value testNativeWindowCleanCacheInvalidArguments(napi_env env, napi_callback_info info);
napi_value testNativeWindowCleanCacheConsumerDisconnected(napi_env env, napi_callback_info info);
#endif //GRAPHICS2DTESTAPI20_EXTERNALWINDOW_H
