/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 
#ifndef NATIVE_XCOMPONENT_PLUGIN_MANAGER_H
#define NATIVE_XCOMPONENT_PLUGIN_MANAGER_H

#include <string>
#include <unordered_map>

#include <js_native_api.h>
#include <js_native_api_types.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <napi/native_api.h>
#include <stdint.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <arkui/native_type.h>
#include "ContainerTest.h"
#include "../common/common.h"

namespace NativeXComponentSample {
    enum {
        image_PRE_DRAG = 1,
        image_DRAG_START,
        image_DRAG_MOVE,
        image_DRAG_ENTER,
        image_DRAG_LEAVE,
        image_DRAG_END,
        image_DROP,
    };
    enum {
        text_PRE_DRAG = 1,
        text_DRAG_START,
        text_DRAG_MOVE,
        text_DRAG_ENTER,
        text_DRAG_LEAVE,
        text_DRAG_END,
        text_DROP,
    };

    class ColorManager {
    public:
        ~ColorManager();

        static ColorManager *GetInstance() { return &ColorManager::ColorManager_; }

        static napi_value GetContext(napi_env env, napi_callback_info info);
        static napi_value CreatePixelMapTest(napi_env env, napi_callback_info info);
        static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
        static napi_value UpdateNativeNode(napi_env env, napi_callback_info info);

        void SetNativeXComponent(std::string &id, OH_NativeXComponent *nativeXComponent);
        OH_NativeXComponent *GetNativeXComponent(const std::string &id);

        Container *GetContainer(std::string &id);
        void Export(napi_env env, napi_value exports);

        static ArkUI_NodeHandle dragEventTest(ArkUI_NativeNodeAPI_1 *nodeAPI);

    private:
        static ColorManager ColorManager_;

        std::unordered_map<std::string, OH_NativeXComponent *> nativeXComponentMap_;
        std::unordered_map<std::string, Container *> containerMap_;
    };
} // namespace NativeXComponentSample
#endif // NATIVE_XCOMPONENT_PLUGIN_MANAGER_H

