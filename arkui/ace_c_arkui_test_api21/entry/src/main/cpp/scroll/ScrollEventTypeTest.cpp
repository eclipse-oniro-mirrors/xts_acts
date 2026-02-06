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

#include "common/common.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include "../manager/plugin_manager.h"
#include <arkui/native_node_napi.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include "arkui/native_interface.h"

namespace ArkUICapiTest {

struct ArkUI_NodeEvent_Scroll {
    int32_t category;
    int32_t kind;
};

static napi_value Enum_GetEventType_Scroll(napi_env env, napi_callback_info info) {
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NodeEvent_Scroll *event = new ArkUI_NodeEvent_Scroll;
    event ->category = 0;
    int eventTypes[] = {
        NODE_SCROLL_EVENT_ON_SCROLL,
        NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN,
        NODE_SCROLL_EVENT_ON_WILL_SCROLL,
        NODE_SCROLL_EVENT_ON_DID_SCROLL,
        NODE_SCROLL_EVENT_ON_SCROLL_START,
        NODE_SCROLL_EVENT_ON_SCROLL_STOP,
        NODE_SCROLL_EVENT_ON_SCROLL_EDGE,
        NODE_SCROLL_EVENT_ON_REACH_START,
        NODE_SCROLL_EVENT_ON_REACH_END,
        NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING,
        NODE_SCROLL_EVENT_ON_DID_ZOOM,
        NODE_SCROLL_EVENT_ON_ZOOM_START,
        NODE_SCROLL_EVENT_ON_ZOOM_STOP,
        NODE_SCROLL_EVENT_ON_WILL_START_DRAGGING,
        NODE_SCROLL_EVENT_ON_DID_STOP_DRAGGING,
        NODE_SCROLL_EVENT_ON_WILL_START_FLING,
        NODE_SCROLL_EVENT_ON_DID_STOP_FLING
    };
    for (int i = 0; i < sizeof(eventTypes) / sizeof(eventTypes[0]); i++) {
        event->kind = eventTypes[i];
        auto eventType = OH_ArkUI_NodeEvent_GetEventType((ArkUI_NodeEvent*) event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Scroll GetEventType", "result:%{public}d", eventType);
        ASSERT_EQ(eventType, eventTypes[i]);
    }
    NAPI_END;
} 
} // namespace ArkUICapiTest
