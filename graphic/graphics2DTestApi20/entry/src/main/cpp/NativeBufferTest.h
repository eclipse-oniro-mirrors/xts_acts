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

#ifndef GRAPHICS2DTESTAPI20_NATIVEBUFFERCOLORSPACETEST_H
#define GRAPHICS2DTESTAPI20_NATIVEBUFFERCOLORSPACETEST_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addNativeBufferTest(std::vector<napi_property_descriptor>& descData);
napi_value testNativeBufferEBUFULL(napi_env env, napi_callback_info info);
napi_value testNativeBufferSMPTECFULL(napi_env env, napi_callback_info info);
napi_value testNativeBufferEBULIMIT(napi_env env, napi_callback_info info);
napi_value testNativeBufferSMPTECLIMIT(napi_env env, napi_callback_info info);
napi_value testNativeBufferADOBERGBFULL(napi_env env, napi_callback_info info);
napi_value testNativeLINEARSRGB(napi_env env, napi_callback_info info);
napi_value testNativeBufferLINEARBT709(napi_env env, napi_callback_info info);
napi_value testNativeLINEARP3(napi_env env, napi_callback_info info);
napi_value testNativeBufferLINEARBT2020(napi_env env, napi_callback_info info);
napi_value testNativeBufferDISPLAYSRGB(napi_env env, napi_callback_info info);
napi_value testNativeBufferDISPLAYP3SRGB(napi_env env, napi_callback_info info);
napi_value testNativeBufferDISPLAYP3HLG(napi_env env, napi_callback_info info);
napi_value testNativeBufferDISPLAYP3PQ(napi_env env, napi_callback_info info);
napi_value testNativeBufferDISPLAYBT2020SRGB(napi_env env, napi_callback_info info);
napi_value testNativeBufferDISPLAYBT2020HLG(napi_env env, napi_callback_info info);
napi_value testNativeBufferDISPLAYBT2020PQ(napi_env env, napi_callback_info info);
napi_value ColorX(napi_env env, napi_callback_info info);
napi_value ColorY(napi_env env, napi_callback_info info);
napi_value Smpte2086Red(napi_env env, napi_callback_info info);
napi_value Smpte2086Green(napi_env env, napi_callback_info info);
napi_value Smpte2086Blue(napi_env env, napi_callback_info info);
napi_value Smpte2086WhitePoint(napi_env env, napi_callback_info info);
napi_value Smpte2086MaxLum(napi_env env, napi_callback_info info);
napi_value Smpte2086MinLum(napi_env env, napi_callback_info info);
napi_value Cta861MaxContentLightLevel(napi_env env, napi_callback_info info);
napi_value Cta861MaxFrameAverageLightLevel(napi_env env, napi_callback_info info);
napi_value smpte2086(napi_env env, napi_callback_info info);
napi_value cta861(napi_env env, napi_callback_info info);
#endif //GRAPHICS2DTESTAPI20_NATIVEBUFFERCOLORSPACETEST_H
