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
#include "manager/PluginManagerTest.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <arkui/native_animate.h>
#include <arkui/native_gesture.h>
#include <arkui/native_node_napi.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include "arkui/native_interface.h"

namespace ArkUICapiTest {
struct ArkUI_NodeEvent_
{
    int32_t category;
    int32_t kind;
};

static napi_value Enum_Swiper_GetEventType(napi_env env, napi_callback_info info) {
     OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Enum_Swiper_GetEventType", "Enum_Swiper_GetEventType start");
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NodeEvent_ *event = new ArkUI_NodeEvent_;
    event ->category = 0;
    int eventTypes[] = {
        NODE_SWIPER_EVENT_ON_CHANGE,
        NODE_SWIPER_EVENT_ON_ANIMATION_START,
        NODE_SWIPER_EVENT_ON_ANIMATION_END,
        NODE_SWIPER_EVENT_ON_GESTURE_SWIPE,
        NODE_SWIPER_EVENT_ON_CONTENT_DID_SCROLL,
        NODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL,
        NODE_SWIPER_EVENT_ON_SELECTED,
        NODE_SWIPER_EVENT_ON_UNSELECTED,
        NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED
    };
    for (int i = 0; i < sizeof(eventTypes) / sizeof(eventTypes[0]); i++) {
        event->kind = eventTypes[i];
        auto eventType = OH_ArkUI_NodeEvent_GetEventType((ArkUI_NodeEvent*)event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetEventType", "swiper enum result:%{public}d", eventType);
        ASSERT_EQ(eventType, eventTypes[i]);
    }
    NAPI_END;
}
} // namespace ArkUICapiTest