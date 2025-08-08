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

#ifndef BRUSH_POINT_RECORD_TEST_H
#define BRUSH_POINT_RECORD_TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addBrushPointRecordTest(std::vector<napi_property_descriptor>& descData);

napi_value OH_Drawing_BrushGetAlphaFloatSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_BrushGetAlphaFloatFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_BrushGetRedFloatSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_BrushGetRedFloatFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_BrushGetGreenFloatSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_BrushGetGreenFloatFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_BrushGetBlueFloatSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_BrushGetBlueFloatFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_PointGetXSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_PointGetXFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_PointGetYSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_PointGetYFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_PointSetSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_PointSetFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RecordCmdUtilsDestroySuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RecordCmdUtilsDestroyFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RecordCmdUtilsBeginRecordingSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RecordCmdUtilsBeginRecordingFail(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RecordCmdUtilsFinishRecordingSuccess(napi_env env, napi_callback_info info);
napi_value OH_Drawing_RecordCmdUtilsFinishRecordingFail(napi_env env, napi_callback_info info);

#endif //BRUSH_POINT_RECORD_TEST_H
