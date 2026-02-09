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
#include "ani/ani.h"

struct CallBackPanGestureData {
    ani_int PanGestureSetDistanceMapCode;
    ani_int TypeUnknownCode;
    ani_int TypeUnknownDiss;
    ani_int TypeFingerCode;
    ani_int TypeFingerDiss;
    ani_int TypePenCode;
    ani_int TypePenDiss;
    ani_int TypeMouseCode;
    ani_int TypeMouseDiss;
    ani_int TypeTouchPadCode;
    ani_int TypeTouchPadDiss;
    ani_int TypeJoyStickCode;
    ani_int TypeJoyStickDiss;
};
namespace ArkUICapiTest {

class PanGestureTest {
public:
    ~PanGestureTest();
    static void PanGestureTest001(ani_env* env, ani_object info, ani_object NodeContent);

    static void PanGestureTest002(ani_env* env, ani_object info, ani_object NodeContent);

    static void PanGestureTest003(ani_env* env, ani_object info, ani_object NodeContent);
    
    static void PanGestureTest004(ani_env* env, ani_object info, ani_object NodeContent);

    static ani_object GetPanGestureData(ani_env* env, ani_object info);
    
    static CallBackPanGestureData testCallBackPanGestureData;
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_PAN_GESTURE_TEST_H