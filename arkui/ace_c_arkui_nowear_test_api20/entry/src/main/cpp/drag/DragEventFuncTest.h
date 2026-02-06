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

#ifndef ARKUI_CAPI_XTS_DRAGEVENT_FUNC_TEST_H
#define ARKUI_CAPI_XTS_DRAGEVENT_FUNC_TEST_H

#include "../common/common.h"
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>

namespace ArkUICapiTest {
class DragEventFuncTest {
    public: 
        static DragEventFuncTest *GetInstance() {
            return &DragEventFuncTest::manager_;
        }
        ~DragEventFuncTest();
        static napi_value DragEventFuncTest001(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest002(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest003(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest004(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest005(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest006(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest007(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest008(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest009(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest010(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest011(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest012(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest013(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest015(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest016(napi_env env, napi_callback_info info);
        static napi_value DragEventFuncTest017(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest018(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest019(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest020(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest021(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest022(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest023(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest024(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest026(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest027(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest028(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest029(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest030(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest031(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest032(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest033(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest034(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest035(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest036(napi_env env, napi_callback_info info);
        static napi_value GetPanGesture036Ret(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest037(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest038(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest039(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest040(napi_env env, napi_callback_info info);
        static napi_value dragEventFuncTest041(napi_env env, napi_callback_info info);
        static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
    private:
        static DragEventFuncTest manager_;
    };
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_DRAGEVENT_FUNC_TEST_H