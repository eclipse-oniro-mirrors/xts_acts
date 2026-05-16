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

#ifndef CAMERA_ERR_CODE_TEST_H
#define CAMERA_ERR_CODE_TEST_H

#include <ohcamera/camera_manager.h>
#include <ohcamera/capture_session.h>
#include <ohcamera/photo_output.h>
#include <string>
#include <napi/native_api.h>
#include "CameraComTest.h"

const int BUFF_MAX = 4096;
const uint32_t MAX_BUFFER_SIZE = 128;
const uint32_t MAX_ARG_COUNT = 8;
const int32_t INVALID_STATUS = -1;

bool GetString(napi_env env, napi_callback_info info, uint32_t index, std::string& outstr);
int32_t GetInt(napi_env env, napi_callback_info info, uint32_t index, int32_t& outint);
napi_value ReturnInt(napi_env env, int32_t value, napi_value* result);

enum ARG_INDEX {
    ARG_INDEX_0 = 0,
    ARG_INDEX_1 = ARG_INDEX_0 + 1,
    ARG_INDEX_2 = ARG_INDEX_0 + 2,
    ARG_INDEX_3 = ARG_INDEX_0 + 3,
    ARG_INDEX_4 = ARG_INDEX_0 + 4,
    ARG_INDEX_5 = ARG_INDEX_0 + 5,
    ARG_INDEX_6 = ARG_INDEX_0 + 6,
    ARG_INDEX_7 = ARG_INDEX_0 + 7,
    ARG_INDEX_8 = ARG_INDEX_0 + 8,
    ARG_INDEX_9 = ARG_INDEX_0 + 9,
    ARG_INDEX_10 = ARG_INDEX_0 + 10,
    ARG_INDEX_11 = ARG_INDEX_0 + 11,
    ARG_INDEX_12 = ARG_INDEX_0 + 12,
    ARG_INDEX_13 = ARG_INDEX_0 + 13,
};

napi_value CaptureSessionGetWhiteBalanceRange(napi_env env, napi_callback_info info);
napi_value CaptureSessionGetWhiteBalance(napi_env env, napi_callback_info info);
napi_value CaptureSessionSetWhiteBalance(napi_env env, napi_callback_info info);
napi_value CaptureSessionSetWhiteBalanceMode(napi_env env, napi_callback_info info);
napi_value CaptureSessionRegisterSystem(napi_env env, napi_callback_info info);
napi_value CaptureSessionUnregisterSystem(napi_env env, napi_callback_info info);
napi_value CaptureSessionIsControlCenterSupported(napi_env env, napi_callback_info info);
napi_value CaptureSessionGetSupportedEffectTypes(napi_env env, napi_callback_info info);
napi_value CaptureSessionDeleteSupportedEffectTypes(napi_env env, napi_callback_info info);
napi_value CaptureSessionEnableControlCenter(napi_env env, napi_callback_info info);
napi_value CaptureSessionRegisterControl(napi_env env, napi_callback_info info);
napi_value CaptureSessionUnregisterControl(napi_env env, napi_callback_info info);

#endif