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

#ifndef RECT_TEST_H
#define RECT_TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addRectTest(std::vector<napi_property_descriptor>& descData);
void AddFontTest(std::vector<napi_property_descriptor>& descData);
napi_value OH_Drawing_RectGetArraySizeSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RectGetArraySizeFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RectGetArrayElementSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RectGetArrayElementFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RectDestroyArraySuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RectDestroyArrayFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RoundRectOffsetSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RoundRectOffsetFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontMeasureSingleCharacterWithFeaturesSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontMeasureSingleCharacterWithFeaturesFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontMeasureTextSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontMeasureTextFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontMeasureTextWithBrushOrPenFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontGetWidthsBoundsFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontGetPosSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontGetPosFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontGetSpacingSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontGetSpacingFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontGetBoundsFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontGetPathForGlyphSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontGetPathForGlyphFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontGetTextPathSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontGetTextPathFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontFeaturesCreateSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontFeaturesAddFeatureSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontFeaturesAddFeatureFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontFeaturesDestroySuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_FontFeaturesDestroyFail(napi_env env, napi_callback_info info);
#endif //RECT_TEST_H
