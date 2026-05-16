/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#ifndef ARKUI_CAPI_XTS_GESTURE_CANCEL_INTERFACE_TEST_H
#define ARKUI_CAPI_XTS_GESTURE_CANCEL_INTERFACE_TEST_H

#include <arkui/native_gesture.h>
#include "../manager/plugin_manager.h"
#include "common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <string>
#include <unordered_map>

struct TestTouchEventData {
    
    int32_t scrollCount;
    int32_t columnCount;
   
};

namespace ArkUICapiTest {

class GestureInterfaceCancelTest {
public:
    ~GestureInterfaceCancelTest();
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
    
    static GestureInterfaceCancelTest *getInstance() {
         return &GestureInterfaceCancelTest::gestureInterfaceTest_;
    }
    void setCurrentRecognizer(ArkUI_GestureRecognizer *current);
    void setChildRecognizer(ArkUI_GestureRecognizer *child);
    
    ArkUI_GestureRecognizer *getChildRecongnizer() {return childRecognizer_; }
    ArkUI_GestureRecognizer *getcurrentRecongnizer() {return currentRecognizer_; }
    static napi_value GetTouchEventData(napi_env env, napi_callback_info info);   
    static TestTouchEventData testTouchEventData;
    void setLastOffset(float lastOffset) {lastOffset_ = lastOffset; }
    float getLastOffset() {return lastOffset_; }
private:
    static GestureInterfaceCancelTest gestureInterfaceTest_;
    
    ArkUI_GestureRecognizer *currentRecognizer_ = nullptr; 
    ArkUI_GestureRecognizer *childRecognizer_ = nullptr; 
    float lastOffset_ = 0.0f;
    
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_GESTURE_CANCEL_INTERFACE_TEST_H