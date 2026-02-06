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


#ifndef ARKUI_CAPI_XTS_PAN_GESTURE_TEST_H
#define ARKUI_CAPI_XTS_PAN_GESTURE_TEST_H
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include "../common/common.h"

struct CallBackPanGestureData {
    int32_t PanGestureSetDistanceMapCode;
    int32_t TypeUnknownCode;
    int32_t TypeUnknownDiss;
    int32_t TypeFingerCode;
    int32_t TypeFingerDiss;
    int32_t TypePenCode;
    int32_t TypePenDiss;
    int32_t TypeMouseCode;
    int32_t TypeMouseDiss;
    int32_t TypeTouchPadCode;
    int32_t TypeTouchPadDiss;
    int32_t TypeJoyStickCode;
    int32_t TypeJoyStickDiss;
};
namespace ArkUICapiTest {

class PanGestureTest {
public:
    ~PanGestureTest();
    static napi_value PanGestureTest001(napi_env env, napi_callback_info info);

    static napi_value PanGestureTest002(napi_env env, napi_callback_info info);

    static napi_value PanGestureTest003(napi_env env, napi_callback_info info);
    
    static napi_value PanGestureTest004(napi_env env, napi_callback_info info);

    static napi_value GetPanGestureData(napi_env env, napi_callback_info info);
    
    static CallBackPanGestureData testCallBackPanGestureData;
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_PAN_GESTURE_TEST_H